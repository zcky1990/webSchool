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
import com.springboot.models.Siswa;
import com.springboot.models.Users;
import com.springboot.utillity.LoginUtil;
import com.springboot.utillity.SiswaUtil;
import com.springboot.utillity.UserUtil;

@RestController
public class MainController extends BaseController {
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> login(@RequestBody Login login,@RequestHeader MultiValueMap<String,String> headers) throws JSONException{
		LoginUtil loginUtil = new LoginUtil();
		JSONObject response = new JSONObject();
		JSONArray users = loginUtil.doLogin(login);
		if(users.length() > 0) {
			response.put(STATUS, STATUS_SUCCESS );
			response.put(DETAILS, users);
		}else {
			response.put(STATUS, STATUS_FAILED );
		}
		/*JSONArray users = new JSONArray();
		JSONObject asd = new JSONObject();
		asd.put("username","admin");
		asd.put("level","1");
		users.put(asd);
		response.put(STATUS, STATUS_SUCCESS );
		response.put(DETAILS, users);*/
		return new ResponseEntity<String>(response.toString(), getResponseHeader(), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> addUser(@RequestBody Users users,@RequestHeader MultiValueMap<String,String> headers) throws JSONException{
		UserUtil util = new UserUtil();
		JSONObject result = util.addUser(users);
		JSONObject response = new JSONObject();
		if(result.get(STATUS).equals(OK)) {
			response.put(STATUS, STATUS_SUCCESS );
			response.put(DETAILS, result);
		}else {
			response.put(STATUS, STATUS_FAILED );
		}
		return new ResponseEntity<String>(response.toString(), getResponseHeader(), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/removeuser", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> removeUser(@RequestBody Users users,@RequestHeader MultiValueMap<String,String> headers) throws JSONException{
		UserUtil util = new UserUtil();
		JSONObject result = util.removeUser(users);
		JSONObject response = new JSONObject();
		if(result.get(STATUS).equals(OK)) {
			response.put(STATUS, STATUS_SUCCESS );
			response.put(DETAILS, result);
		}else {
			response.put(STATUS, STATUS_FAILED );
		}
		return new ResponseEntity<String>(response.toString(), getResponseHeader(), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/addsiswa", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> addSiswa(@RequestBody Siswa siswa,@RequestHeader MultiValueMap<String,String> headers) throws JSONException{
		SiswaUtil util = new SiswaUtil();
		JSONObject result = util.addSiswa(siswa);
		JSONObject response = new JSONObject();
		if(result.get(STATUS).equals(OK)) {
			response.put(STATUS, STATUS_SUCCESS );
			response.put(DETAILS, result);
		}else {
			response.put(STATUS, STATUS_FAILED );
		}
		return new ResponseEntity<String>(response.toString(), getResponseHeader(), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updatesiswa", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> updateSiswa(@RequestBody Siswa siswa,@RequestHeader MultiValueMap<String,String> headers) throws JSONException{
		SiswaUtil util = new SiswaUtil();
		JSONObject result = util.updateSiswa(siswa);
		JSONObject response = new JSONObject();
		if(result.get(STATUS).equals(OK)) {
			response.put(STATUS, STATUS_SUCCESS );
			response.put(DETAILS, result);
		}else {
			response.put(STATUS, STATUS_FAILED );
		}
		return new ResponseEntity<String>(response.toString(), getResponseHeader(), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getSiswaList", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<String> getSiswaList(@RequestParam("username") String username, @RequestHeader MultiValueMap<String,String> headers) throws JSONException{
		SiswaUtil util = new SiswaUtil();
		JSONArray result = util.getSiswaList();
		JSONObject response = new JSONObject();
		if(result.length()> 0 ) {
			response.put(STATUS, STATUS_SUCCESS );
			response.put(LIST_SISWA, result);
		}else {
			response.put(STATUS, STATUS_FAILED );
		}
		return new ResponseEntity<String>(response.toString(), getResponseHeader(), HttpStatus.OK);
	}
	
}
