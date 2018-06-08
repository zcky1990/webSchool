package com.springboot.utillity;

import com.springboot.models.Siswa;
import com.springboot.util.DatabaseUtillity;

public class SiswaUtil {
	DatabaseUtillity util = new DatabaseUtillity();

	public String addSiswa(Siswa siswa) {
		String nisn = siswa.getNisn();
		String firstname = siswa.getFirstname();
		String lastname = siswa.getLastname();
		String jeniKelamin = siswa.getJenisKelamin();
		String alamat = siswa.getAlamat();
		String tempatLahir = siswa.getTempatLahir();
		String tnglLahir = siswa.getTanggalLahir();
		String query = "INSERT INTO siswa ( nisn , firstname , lastname , tempat_lahir, tanggal_lahir, alamat,jenis_kelamin, is_active) "
				+ "VALUES ('"+nisn+"', '"+firstname+"', '"+lastname+"','"+tempatLahir+"','"+tnglLahir+"','"+alamat+"','"+jeniKelamin+"',1)";
		return util.runQuery(query);
	}

	public String updateSiswa(Siswa siswa) {
		String nisn = siswa.getNisn();
		String firstname = siswa.getFirstname();
		String lastname = siswa.getLastname();
		String jeniKelamin = siswa.getJenisKelamin();
		String alamat = siswa.getAlamat();
		String tempatLahir = siswa.getTempatLahir();
		String tnglLahir = siswa.getTanggalLahir();
		Boolean isActive = siswa.getIsActive();
		String query = "UPDATE siswa SET firstname = '"+firstname+"', lastname='"+lastname+"', "
				+ "tempat_lahir='"+tempatLahir+"',tanggal_lahir='"+tnglLahir+"', "
				+ "alamat='"+alamat+"',jenis_kelamin='"+jeniKelamin+"',is_active="+isActive+" "
				+ "WHERE nisn='"+nisn+"'";
		return util.runQuery(query);
	}
}
