package com.springboot.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DatabaseUtillity extends Util{
	private Connection connect = null;
	private Statement statement = null;
	private String host ="";
	private String datbaseName = "";
	private String userName ="";
	private String passWord = "";
	private String OK = "200";
	private String FAILED = "500";
	
	public DatabaseUtillity() {
		super();
		setConfig();
	}

	public String getDatabaseUrl() {
		return "jdbc:mysql://"+host+"/"+datbaseName+"?user="+userName+"&password="+passWord+"";
	}

	public Connection getConnection() {
		Connection newConnection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			newConnection = DriverManager.getConnection(getDatabaseUrl());
		} catch (ClassNotFoundException e ) {
			System.err.println(e.getMessage());
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} catch (InstantiationException e) {
			System.err.println(e.getMessage());
		} catch (IllegalAccessException e) {
			System.err.println(e.getMessage());
		}
		return newConnection;
	}

	public Statement createConnection(){
		Statement newStatement = null;
		connect = getConnection();
		try {
			newStatement = connect.createStatement();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return newStatement;
	}

	public JSONArray readDataDB(String query) throws SQLException{
		ResultSet rs = null;
		statement = createConnection();
		JSONArray jsonArray = new JSONArray();
		try {
			rs = statement.executeQuery(query);
			int columnCount = rs.getMetaData().getColumnCount();
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				for (int i = 1; i <= columnCount; i++) {
					String columnName =  rs.getMetaData().getColumnLabel(i);
					obj.put(columnName, rs.getObject(i));
				}
				jsonArray.put(obj);
			}
			rs.close();
		} catch (Exception e) {
			if(rs != null){
				System.err.println(e.getMessage());
				try {
					rs.close();
				} catch (SQLException e1) {
					System.err.println(e1.getMessage());
				}
			}
		}finally {
			if (statement != null) {
				statement.close();
			}

			if (connect != null) {
				connect.close();
			}
		}
		return jsonArray;
	}
	
	public JSONObject runQuery(String query) throws JSONException {
		JSONObject status = new JSONObject();;
		statement = createConnection();
		try {
			statement.executeUpdate(query);
			status.put("status", OK);
		} catch (SQLException e) {
			status.put("status", FAILED);
			status.put("errorMessage", e.getMessage());
		}
		return status;
	}
		
	public void setConfig() {
		String configString = requestFileResource();
		try {
			JSONObject databaseConfigJson = new JSONObject(configString);
			JSONObject config = databaseConfigJson.getJSONObject(CONFIG);
			host = config.getString(HOST);
			datbaseName = config.getString(DATABASENAME);
			userName = config.getString(USERNAME);
			passWord = config.getString(PASSWORD);
		} catch (JSONException e) {
			System.err.println(e.getMessage());
		}
	}

}
