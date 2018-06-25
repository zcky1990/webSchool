package com.springboot.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Util {
	public static final String DATABASE_CONFIG = "config/database_config.json";
	public static final String  DATABASENAME = "databaseName";
	public static final String  CONFIG = "config";
	public static final String  USERNAME = "userName";
	public static final String  PASSWORD = "password";
	public static final String  HOST = "ip";
	
	public String requestFileResource() {
		InputStream is = this.getClass().getClassLoader().getResourceAsStream(DATABASE_CONFIG);
		BufferedReader br = new BufferedReader(new InputStreamReader(is));

		String line;
		String textStr = "";
		try {
			while ((line = br.readLine()) != null) {
				textStr = textStr + line;
			}

			br.close();
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}

		try {
			is.close();
			br.close();
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
		return textStr;
	}
	
	public String requestFileResource(String path) {
		InputStream is = this.getClass().getClassLoader().getResourceAsStream(path);
		BufferedReader br = new BufferedReader(new InputStreamReader(is));

		String line;
		String textStr = "";
		try {
			while ((line = br.readLine()) != null) {
				textStr = textStr + line;
			}

			br.close();
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}

		try {
			is.close();
			br.close();
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
		return textStr;
	}

}
