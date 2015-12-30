package com.nowstartjava.tutorials.cms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/cms")
public class UserLogin {
	@RequestMapping(method=RequestMethod.GET)
	public String login(){
		return "cms/login";
	}
}
