package com.nowstartjava.tutorials.cms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nowstartjava.tutorials.model.User;
import com.nowstartjava.tutorials.service.UserService;

@Controller
@RequestMapping(value = "/cms")
public class UserLogin {
	@Autowired
	private UserService userservice;

	@RequestMapping(method = RequestMethod.GET)
	public String login() {
		return "cms/login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String verifylogin(@RequestParam String username,
			 @RequestParam String password) {
//		User user = userservice.loginUser(username, password);
		System.out.println(userservice.loginUser(username, password).getEmail());
		
		return null;
	}
}
