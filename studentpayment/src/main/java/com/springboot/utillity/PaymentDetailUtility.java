package com.springboot.utillity;

import java.sql.SQLException;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.springboot.models.Details;
import com.springboot.util.DatabaseUtillity;

public class PaymentDetailUtility {
	DatabaseUtillity util = new DatabaseUtillity();
		
	public JSONObject getDetails(Details details) throws JSONException {
		JSONObject detail = new JSONObject();
		String nisn = details.getNisn();
		String startSemester = details.getStartMonth();
		String endSemester =  details.getEndMonth();
		String kelas = details.getKelas();
		String queryDetails = "SELECT type_desc, \n" + 
				"       ( besaran - tot_byr ) AS sisa_angs \n" + 
				"FROM   (SELECT type_desc, \n" + 
				"               besaran, \n" + 
				"               ( CASE \n" + 
				"                   WHEN total_bayar IS NULL THEN 0 \n" + 
				"                   ELSE total_bayar \n" + 
				"                 end )AS tot_byr \n" + 
				"        FROM   (SELECT tp.deskripsi   AS type_desc, \n" + 
				"                       Sum(lp.besaran)AS besaran, \n" + 
				"                       lp.kelas \n" + 
				"                FROM   list_pembayaran lp \n" + 
				"                       INNER JOIN tipe_pembayaran tp \n" + 
				"                               ON lp.tipe_id = tp.id \n" + 
				"                WHERE  Concat(lp.year, Lpad(lp.month, 2, '0')) BETWEEN \n" + 
				"                       "+startSemester+" AND "+endSemester+" \n" + 
				"                       AND kelas = "+kelas+" \n" + 
				"                GROUP  BY tp.deskripsi)ta \n" + 
				"               LEFT JOIN (SELECT nisn, nama,kelas, \n" + 
				"        				Sum(bayar)AS total_bayar, \n" + 
				"        				tipe_pembayaran \n" + 
				"        				FROM   (SELECT s.nisn,s.nama,\n" + 
				"        				s.kelas,a.tipe_pembayaran_id,\n" + 
				"        				lp.deskripsi, a.bayar, lp.month,lp.year, \n" + 
				"        				tp.deskripsi AS tipe_pembayaran \n" + 
				"        				from siswa s \n" + 
				"        				INNER JOIN angsuran a ON s.id = a.siswa_id \n" + 
				"        				INNER JOIN list_pembayaran lp ON a.tipe_pembayaran_id = lp.id\n" + 
				"        				INNER JOIN tipe_pembayaran tp ON tp.id = lp.tipe_id\n" + 
				"       					 WHERE s.nisn = '"+nisn+"' AND concat(lp.year, lpad(lp.month, 2, '0')) \n" + 
				"        				between "+startSemester+" and "+endSemester+")tb GROUP BY tipe_pembayaran)tb \n" + 
				"                      ON ta.type_desc = tb.tipe_pembayaran)details_pembayaran ";
		try {
			JSONArray summary = util.readDataDB(queryDetails);
			detail.put("summary", summary);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String subQuery = "SELECT id, type_desc, angs_deskripsi,besaran, (case when bayar is null then 0 else bayar end)as bayar  FROM \n" + 
				"	(SELECT lp.id, tp.deskripsi as type_desc, lp.deskripsi as angs_deskripsi, lp.besaran,lp.kelas FROM 		list_pembayaran lp INNER JOIN tipe_pembayaran tp\n" + 
				"		ON lp.tipe_id = tp.id where concat(lp.year, lpad(lp.month, 2, '0')) between "+startSemester+" and "+endSemester+" 		and kelas = "+kelas+")angs \n" + 
				"LEFT JOIN \n" + 
				"    (SELECT s.nisn,s.nama,s.kelas,a.tipe_pembayaran_id,lp.deskripsi, a.bayar, lp.month,lp.year from siswa s \n" + 
				"INNER JOIN angsuran a ON s.id = a.siswa_id \n" + 
				"INNER JOIN list_pembayaran lp ON a.tipe_pembayaran_id = lp.id\n" + 
				"WHERE s.nisn = '"+nisn+"' AND concat(lp.year, lpad(lp.month, 2, '0')) between "+startSemester+" and "+endSemester+" " + 
				")byr\n" + 
				"ON angs.id = byr.tipe_pembayaran_id\n" + 
				"\n" + 
				"";
		try {
			JSONArray detailsSiswa = util.readDataDB(subQuery);
			JSONObject detailsPayment = new JSONObject();
			if(detailsSiswa.length() > 0) {
				 HashMap<String, JSONArray> hmap = new HashMap<String, JSONArray>();
				 for(int i = 0 ; i< detailsSiswa.length(); i++) {
					 JSONObject obj = detailsSiswa.getJSONObject(i);
					 String key = obj.getString("type_desc");
					 if(hmap.containsKey(key)) {
						 JSONArray detailType = hmap.get(key);
						 detailType.put(obj);
					 }else {
						 JSONArray detailType = new JSONArray();
						 detailType.put(obj);
						 hmap.put(key, detailType);
					 }
				 }
				 
				 for (String key : hmap.keySet()) {
					 detailsPayment.put(key, hmap.get(key));
					}
			}
			detail.put("detail", detailsPayment);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return detail;
	}
	
	public JSONArray getTypeAngsuran (Details details) {
		JSONArray result = new JSONArray();
		String startDate = details.getStartMonth();
		String endDate = details.getEndMonth();
		String kelas = details.getKelas();
		
		String query = "SELECT id,deskripsi,besaran FROM `list_pembayaran` WHERE Concat(year, Lpad(month, 2, '0')) "
				+ "BETWEEN "+startDate+" AND "+endDate+"  AND kelas = "+kelas+"";
		try {
			result = util.readDataDB(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
}
