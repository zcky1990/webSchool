package com.springboot.base;

import org.springframework.http.HttpHeaders;

public class BaseController {
	
	public HttpHeaders getResponseHeader() {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		return responseHeaders;
	}

}
