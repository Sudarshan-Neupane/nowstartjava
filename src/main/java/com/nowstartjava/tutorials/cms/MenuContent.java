package com.nowstartjava.tutorials.cms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/cms")
public class MenuContent {
	@RequestMapping(value="/category",method=RequestMethod.GET)
	public String category(){
		return "cms/category";
	}

	
}
