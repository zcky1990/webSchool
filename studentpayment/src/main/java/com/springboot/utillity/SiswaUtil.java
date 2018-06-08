package com.springboot.utillity;

import org.json.JSONException;
import org.json.JSONObject;
import com.springboot.models.Siswa;
import com.springboot.util.DatabaseUtillity;

public class SiswaUtil {
	DatabaseUtillity util = new DatabaseUtillity();

	public JSONObject addSiswa(Siswa siswa) throws JSONException {
		JSONObject result = new JSONObject();
		String nisn = siswa.getNisn();
		String firstname = siswa.getFirstname();
		String lastname = siswa.getLastname();
		String jeniKelamin = siswa.getJenisKelamin();
		String alamat = siswa.getAlamat();
		String tempatLahir = siswa.getTempatLahir();
		String tnglLahir = siswa.getTanggalLahir();
		String query = "INSERT INTO siswa ( nisn, firstname, lastname, tempat_lahir, tanggal_lahir, alamat, jenis_kelamin, is_active) "
				+ "VALUES ('"+nisn+"', '"+firstname+"', '"+lastname+"','"+tempatLahir+"','"+tnglLahir+"','"+alamat+"','"+jeniKelamin+"',1)";
		try {
			result = util.runQuery(query);
		} catch (JSONException e) {
			result.put("status", "500");
			result.put("errorMessage", e.getMessage());
		}
		return result;
	}

	public JSONObject updateSiswa(Siswa siswa) throws JSONException {
		JSONObject result = new JSONObject();
		Integer id = siswa.getId();
		String nisn = siswa.getNisn();
		String firstname = siswa.getFirstname();
		String lastname = siswa.getLastname();
		String jeniKelamin = siswa.getJenisKelamin();
		String alamat = siswa.getAlamat();
		String tempatLahir = siswa.getTempatLahir();
		String tnglLahir = siswa.getTanggalLahir();
		Boolean isActive = siswa.getIsActive();
		String query = "UPDATE siswa SET nisn ='"+nisn+"', firstname = '"+firstname+"', lastname ='"+lastname+"', "
				+ "tempat_lahir = '"+tempatLahir+"',tanggal_lahir = '"+tnglLahir+"', "
				+ "alamat = '"+alamat+"',jenis_kelamin = '"+jeniKelamin+"',is_active ="+isActive+" "
				+ "WHERE id ="+id+"";
		try {
			result = util.runQuery(query);
		} catch (JSONException e) {
			result.put("status", "500");
			result.put("errorMessage", e.getMessage());
		}
		return result;
	}
}
