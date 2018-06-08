package com.springboot.models;

public class Siswa {
	private Integer id;
	private String nisn;
	private String firstname;
	private String lastname;
	private String tempatLahir;
	private String tanggalLahir;
	private Boolean isActive;
	private String alamat;
	private String jenisKelamin;

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Boolean getIsActive() {
		return isActive;
	}
	
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	public String getNisn() {
		return nisn;
	}
	
	public void setNisn(String nisn) {
		this.nisn = nisn;
	}
	
	public String getFirstname() {
		return firstname;
	}
	
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	public String getLastname() {
		return lastname;
	}
	
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public String getTempatLahir() {
		return tempatLahir;
	}
	
	public void setTempatLahir(String tempatLahir) {
		this.tempatLahir = tempatLahir;
	}
	
	public String getTanggalLahir() {
		return tanggalLahir;
	}
	
	public void setTanggalLahir(String tanggalLahir) {
		this.tanggalLahir = tanggalLahir;
	}
	
	public String getAlamat() {
		return alamat;
	}
	
	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}
	
	public String getJenisKelamin() {
		return jenisKelamin;
	}
	
	public void setJenisKelamin(String jenisKelamin) {
		this.jenisKelamin = jenisKelamin;
	}
}
