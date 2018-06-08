package com.springboot.utillity;

import org.json.JSONArray;

import com.springboot.models.Users;
import com.springboot.util.DatabaseUtillity;

public class UserUtil {
	DatabaseUtillity util = new DatabaseUtillity();
	
	public String addUser(Users users) {
		String username = users.getUsername();
		String password = users.getPassword();
		String level = users.getLevel();
		String query = "INSERT INTO users (id, username, password, create_date, create_by, level) "
				+ "VALUES (NULL, '"+username+"', '"+password+"', NOW(), '0', '"+level+"');";
		return util.runQuery(query);
	}
	
	public String removeUser(Users users) {
		String username = users.getUsername();
		String query = "DELETE FROM users WHERE users.username ='"+username+"'";
		return util.runQuery(query);
	}

}
