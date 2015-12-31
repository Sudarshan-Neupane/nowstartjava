package com.nowstartjava.tutorials.cms;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			 @RequestParam String password,HttpSession session,Model model) {
		User user = userservice.loginUser(username, password);
		if(user ==null){
			model.addAttribute("loginError", "Invalid UserName or password.");
			return "cms/login";
		}
		session.setAttribute("loginUser", user);
		return "redirect:/cms/loginsuccess";
		
	}
	@RequestMapping(value="/loginsuccess" ,method=RequestMethod.GET)
	public String loginSuccess(HttpSession session){
		if(session.getAttribute("loginUser")==null){
			return "redirect:/cms";
		}
		System.out.println(session.getAttribute("loginUser"));
		return "cms/dashBoard";
	}
}
