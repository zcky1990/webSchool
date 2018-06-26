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
		JSONObject result = new JSONObject();
		String nisn = details.getNisn();
		String startSemester = details.getStartMonth();
		String endSemester =  details.getEndMonth();
		String kelas = details.getKelas();
		String queryDetails = "select * FROM \n" + 
				"		(select (total_angsuran-total_bayar) as spp  from (select \n" + 
				"			(CASE\n" + 
				"			    WHEN total_angsuran is null THEN 0\n" + 
				"			    ELSE total_angsuran\n" + 
				"			END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"			from spp_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+")totalAngsuran)ta\n" + 
				"			JOIN                                          \n" + 
				"			(select * from(select (\n" + 
				"			    CASE\n" + 
				"			    	WHEN total_bayar is null THEN 0\n" + 
				"			    	ELSE total_bayar\n" + 
				"				END)AS total_bayar \n" + 
				"			    FROM(SELECT sum(bayar)as total_bayar FROM spp \n" + 
				"			         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_spp\n" + 
				" JOIN\n" + 
				"		(select (total_angsuran-total_bayar) as mpls  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from mpls_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+" )totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM mpls \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_mpls \n" + 
				" JOIN\n" + 
				"		(select (total_angsuran-total_bayar) as seragam  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from seragam_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+")totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM seragam \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_seragam\n" + 
				" JOIN\n" + 
				"	(select (total_angsuran-total_bayar) as praktek  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from praktek_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+")totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM praktek \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_praktek\n" + 
				" JOIN\n" + 
				"	(select (total_angsuran-total_bayar) as lks  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from lks_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+")totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM lks \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_lks	\n" + 
				" JOIN\n" + 
				"	(select (total_angsuran-total_bayar) as lks_produktif  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from lks_produktif_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+")totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM lks_produktif \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_lks_produktif\n" + 
				" JOIN\n" + 
				"	(select (total_angsuran-total_bayar) as kegiatan  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from kegiatan_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+")totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM kegiatan \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_kegiatan		\n" + 
				" JOIN\n" + 
				"	(select (total_angsuran-total_bayar) as kartu_pelajar  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from kartu_pelajar_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+")totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM kartu_pelajar \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_kartu_pelajar  \n" + 
				"JOIN\n" + 
				"	(select (total_angsuran-total_bayar) as qurban  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from qurban_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+")totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM qurban \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_qurban      	 \n" + 
				"JOIN\n" + 
				"	(select (total_angsuran-total_bayar) as ldks  from (select \n" + 
				"		(CASE\n" + 
				"		    WHEN total_angsuran is null THEN 0\n" + 
				"		    ELSE total_angsuran\n" + 
				"		END)AS total_angsuran from (select sum(besaran)as total_angsuran \n" + 
				"		from ldks_list where concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and kelas = "+kelas+")totalAngsuran)ta\n" + 
				"		JOIN                                          \n" + 
				"		(select * from(select (\n" + 
				"		    CASE\n" + 
				"		    	WHEN total_bayar is null THEN 0\n" + 
				"		    	ELSE total_bayar\n" + 
				"			END)AS total_bayar \n" + 
				"		    FROM(SELECT sum(bayar)as total_bayar FROM ldks \n" + 
				"		         WHERE concat(tahun, lpad(bulan, 2, '0')) between "+startSemester+" and "+endSemester+" and nisn = "+nisn+")total_bayar_angsuran)asd)angs)angsuran_ldks   \n" + 
				"JOIN\n" + 
				"	(select (case when (gl.besaran - gdn.total_bayar) is null then 0\n" + 
				"	       else (gl.besaran - gdn.total_bayar) end\n" + 
				"	       ) as gedung  from (\n" + 
				"		select gedung.gedung_list_id, \n" + 
				"		(case when sum(gedung.bayar) is nULL then 0 \n" + 
				"	    ELSE  sum(gedung.bayar)\n" + 
				"	     END\n" + 
				"	)as total_bayar from gedung where nisn = "+nisn+")gdn\n" + 
				"	LEFT JOIN (SELECT gedung_list.id, (CASE \n" + 
				"                                        WHEN gedung_list.besaran IS NULL THEN 0\n" + 
				"                                       ELSE gedung_list.besaran END)AS besaran  FROM gedung_list) gl ON gl.id = gdn.gedung_list_id  )angsuran_gedung		";
		try {
			JSONArray detail = util.readDataDB(queryDetails);
			JSONObject angsuran = new JSONObject();
			if(detail.length() > 0) {
				angsuran = detail.getJSONObject(0);
			}
			result.put("angsuran", angsuran);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String queryUjianDetails = "SELECT description, (angsuran_ujian.besaran - angsuran_ujian.bayar ) as sisa " + 
				"from (SELECT * FROM ujian_list ul INNER JOIN (SELECT nisn,ujian_id,\n" + 
				"	(case " + 
				"     	when bayar is null then 0 " + 
				"     	else bayar " + 
				"    end) as bayar " + 
				"FROM  ujian WHERE ujian.nisn = '"+ nisn +"' " + 
				"and concat(ujian.tahun, lpad(ujian.bulan, 2, '0')) between "+ startSemester +" and "+ endSemester +")bu " + 
				"ON ul.id = bu.ujian_id)angsuran_ujian";
		try {
			JSONArray detailUjian = util.readDataDB(queryUjianDetails);
			result.put("ujian", detailUjian);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JSONArray endResult= new JSONArray();
		endResult.put(result);
		return endResult;
	}

}
