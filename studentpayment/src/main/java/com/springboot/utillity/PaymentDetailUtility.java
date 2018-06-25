package com.springboot.utillity;

import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.springboot.models.Details;
import com.springboot.util.DatabaseUtillity;

public class PaymentDetailUtility {
	DatabaseUtillity util = new DatabaseUtillity();
		
	public JSONObject getDetails(Details details) throws JSONException {
		JSONObject result = new JSONObject();
		String queryDetails = util.requestFileResource("sql/angsuran_details.sql");
		String queryUjianDetails = util.requestFileResource("sql/ujian_details.sql");
		String nisn = details.getNisn();
		Integer startSemester = details.getStartMonth();
		Integer endSemester =  details.getEndMonth();
		queryDetails = String.format(queryDetails, nisn,startSemester, endSemester );
		System.out.println(queryDetails);
		try {
			JSONArray detail = util.readDataDB(queryDetails);
			result.put("angsuran", detail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		queryUjianDetails = String.format(queryUjianDetails, nisn,startSemester, endSemester );
		try {
			JSONArray detail = util.readDataDB(queryUjianDetails);
			result.put("ujian", detail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
