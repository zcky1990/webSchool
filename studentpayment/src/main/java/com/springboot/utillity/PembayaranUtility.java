package com.springboot.utillity;

import java.sql.SQLException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.springboot.models.Bayar;
import com.springboot.models.SiswaBayar;
import com.springboot.util.DatabaseUtillity;

public class PembayaranUtility {
	DatabaseUtillity util = new DatabaseUtillity();

	public String getUserId(String username) throws JSONException {
		String userId =null;
		String query ="SELECT u.user_id from users u WHERE u.username = '"+username+"'";
		try {
			JSONArray result = util.readDataDB(query);
			if (result.length() >0) {
				JSONObject user = result.getJSONObject(0);
				userId = user.opt("user_id").toString();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userId;
	}
	
	public String getSiswaId(String nisn) throws JSONException {
		String userId =null;
		String query ="SELECT s.id from siswa s WHERE s.nisn = '"+nisn+"'";
		try {
			JSONArray result = util.readDataDB(query);
			if (result.length() >0) {
				JSONObject user = result.getJSONObject(0);
				userId = user.opt("id").toString();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userId;
	}

	public JSONArray bayarAngsuran(SiswaBayar siswaBayar) throws JSONException  {
		JSONArray response = new JSONArray();
		ArrayList<Bayar> asd = siswaBayar.getPembayaran();
		String username = siswaBayar.getUsername();
		String kelas = siswaBayar.getKelas();
		String nisn = siswaBayar.getNisn();
		String userId = this.getUserId(username);
		System.out.println(userId);
		String siswaId = this.getSiswaId(nisn);
		System.out.println(siswaId);
		for(int i = 0 ; i< asd.size(); i++) {
			Bayar modelBayar = asd.get(i);
			String id = modelBayar.getId();
			String bayar = modelBayar.getBayar();
			String query ="INSERT INTO `angsuran` (`id`, `siswa_id`, `tipe_pembayaran_id`, `bayar`, `create_by`, `created_date`, `modfied_by`, `modified_date`) "
					+ "VALUES (NULL, '"+siswaId+"', '"+id+"', '"+bayar+"', '"+userId+"', now(), NULL, NULL)";
			System.out.println(query);
			JSONObject insertResponse = util.runQuery(query);
			if(insertResponse.get("status").equals("500")) {
				insertResponse.put("id_pembayaran", id);
				insertResponse.put("nisn", nisn);
				response.put(insertResponse);
			}
		}
		return response;
	}
}
