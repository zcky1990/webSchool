package com.springboot.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.base.BaseController;


@RestController
public class MainController extends BaseController {
	
    @RequestMapping(value = "/test", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<String> setEmailTest(@RequestParam("email") String email, @RequestHeader MultiValueMap<String,String> headers){
		String response="{ \"test\":1}";
		return new ResponseEntity<String>(response, getResponseHeader(), HttpStatus.OK);
	}
}
