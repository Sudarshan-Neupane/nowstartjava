package com.nowstartjava.tutorials.cms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/error-forbidden")
	public String errorForbidden(){
		return "error-forbidden";
	}
}
