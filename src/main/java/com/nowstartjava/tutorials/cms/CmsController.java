package com.nowstartjava.tutorials.cms;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/cms")
public class CmsController {
	
	@RequestMapping(value="/category",method=RequestMethod.GET)
	public String category(HttpSession session){
		if(session.getAttribute("loginUser")==null){
			return "redirect:/cms";
		}
		return "cms/category";
	}
	@RequestMapping(value="/tutorial" , method=RequestMethod.GET)
	public String tutorial(HttpSession session){
		if(session.getAttribute("loginUser")==null){
			return "redirect:/cms";
		}
		return "cms/tutorial";
	}
	
	
}