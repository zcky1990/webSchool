package com.springboot.utillity;

import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.springboot.models.Details;
import com.springboot.util.DatabaseUtillity;

public class PaymentDetailUtility {
	DatabaseUtillity util = new DatabaseUtillity();
		
	public JSONArray getDetails(Details details) throws JSONException {
		JSONArray result = new JSONArray();
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
				"               LEFT JOIN (SELECT nisn, \n" + 
				"                                 nama, \n" + 
				"                                 kelas, \n" + 
				"                                 Sum(bayar)AS total_bayar, \n" + 
				"                                 tipe_pembayaran \n" + 
				"                          FROM   (SELECT s.nisn, \n" + 
				"                                         s.nama, \n" + 
				"                                         s.kelas, \n" + 
				"                                         a.bayar, \n" + 
				"                                         ( CASE \n" + 
				"                                             WHEN a.modified_date IS NOT NULL \n" + 
				"                                           THEN \n" + 
				"                                             Date_format(a.modified_date, \n" + 
				"                                             '%Y-%m-%d') \n" + 
				"                                             ELSE Date_format(a.created_date, \n" + 
				"                                                  '%Y-%m-%d') \n" + 
				"                                           end )      AS tngl_bayar, \n" + 
				"                                         lp.deskripsi, \n" + 
				"                                         tp.deskripsi AS tipe_pembayaran \n" + 
				"                                  FROM   siswa s \n" + 
				"                                         INNER JOIN angsuran a \n" + 
				"                                                 ON s.id = a.siswa_id \n" + 
				"                                         INNER JOIN list_pembayaran lp \n" + 
				"                                                 ON a.tipe_pembayaran_id = lp.id \n" + 
				"                                         INNER JOIN tipe_pembayaran tp \n" + 
				"                                                 ON lp.tipe_id = tp.id)tbl \n" + 
				"                          WHERE  Date_format(tngl_bayar, '%Y%m') BETWEEN \n" + 
				"                                 "+startSemester+" AND "+endSemester+"  \n" + 
				"                                 AND kelas = "+kelas+" AND nisn ="+ nisn+" \n" + 
				"                          GROUP  BY tipe_pembayaran)tb \n" + 
				"                      ON ta.type_desc = tb.tipe_pembayaran)details_pembayaran ";
		try {
			result = util.readDataDB(queryDetails);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
