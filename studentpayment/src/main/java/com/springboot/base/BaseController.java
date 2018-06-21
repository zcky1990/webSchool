package com.springboot.base;

import org.springframework.http.HttpHeaders;

public class BaseController {
	protected static String STATUS = "status";
	protected static String DETAILS = "details";
	protected static String STATUS_SUCCESS = "success";
	protected static String STATUS_FAILED = "failed";
	protected static String OK = "200";
	protected static String FAILED = "500";
	protected static String LIST_SISWA = "ListSiswa";
	
	public HttpHeaders getResponseHeader() {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return responseHeaders;
	}
	

}
