package com.springboot.models;

import java.util.ArrayList;

public class SiswaBayar {
	public String nisn;
	public String kelas;
	public ArrayList<Bayar> pembayaran;
	public String username;
	
	public String getNisn() {
		return nisn;
	}
	
	public void setNisn(String nisn) {
		this.nisn = nisn;
	}
	
	public String getKelas() {
		return kelas;
	}
	
	public void setKelas(String kelas) {
		this.kelas = kelas;
	}
	
	public ArrayList<Bayar> getPembayaran() {
		return pembayaran;
	}
	
	public void setPembayaran(ArrayList<Bayar> pembayaran) {
		this.pembayaran = pembayaran;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
