package com.springboot.controller;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.base.BaseController;
import com.springboot.models.Login;
import com.springboot.utillity.LoginUtil;

@RestController
public class MainController extends BaseController {
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> login(@RequestBody Login login,@RequestHeader MultiValueMap<String,String> headers) throws JSONException{
		LoginUtil util = new LoginUtil();
		JSONArray users = util.doLogin(login);
		JSONObject response = new JSONObject();
		if(users.length() > 0) {
			response.put("status", STATUS_SUCCESS );
			response.put("details", users);
		}else {
			response.put("status", STATUS_FAILED );
		}
		return new ResponseEntity<String>(response.toString(), getResponseHeader(), HttpStatus.OK);
	}
	
    @RequestMapping(value = "/test", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<String> setEmailTest(@RequestParam("email") String email, @RequestHeader MultiValueMap<String,String> headers){
		String response="{ \"test\":1}";
		return new ResponseEntity<String>(response, getResponseHeader(), HttpStatus.OK);
	}
}
