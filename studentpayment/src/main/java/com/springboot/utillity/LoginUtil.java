package com.springboot.utillity;

import java.sql.SQLException;

import org.json.JSONArray;

import com.springboot.models.Login;
import com.springboot.util.DatabaseUtillity;

public class LoginUtil {
	
	DatabaseUtillity util = new DatabaseUtillity();
	
	public JSONArray doLogin(Login login) {
		JSONArray result = new JSONArray();
		String username = login.getUsername();
		String password = login.getPassword();
		
		String query = "SELECT ud.id,u.username,u.access_level FROM users u INNER JOIN user_detail ud"
				+ "	ON u.user_id = ud.id where u.username = '"+username+"' and u.password = '"+password+"'";
		try {
			result = util.readDataDB(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
