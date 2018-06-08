package com.springboot.base;

import org.springframework.http.HttpHeaders;

public class BaseController {
	protected static String STATUS_SUCCESS= "success";
	protected static String STATUS_FAILED= "failed";
	
	public HttpHeaders getResponseHeader() {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return responseHeaders;
	}
	

}
