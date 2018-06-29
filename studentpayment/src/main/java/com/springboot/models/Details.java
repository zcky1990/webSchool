package com.springboot.models;

public class Details {
	private String nisn;
	private String startMonth;
	private String endMonth;
	private String kelas;
	
	Details (String nisn, String startMonth, String endMonth ,String kelas){
		this.nisn = nisn;
		this.startMonth = startMonth;
		this.endMonth = endMonth;
		this.kelas = kelas;
	}
	
	public String getKelas() {
		return kelas;
	}
	public void setKelas(String kelas) {
		this.kelas = kelas;
	}
	public String getNisn() {
		return nisn;
	}
	public void setNisn(String nisn) {
		this.nisn = nisn;
	}
	public String getStartMonth() {
		return startMonth;
	}
	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}
	public String getEndMonth() {
		return endMonth;
	}
	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}
}
