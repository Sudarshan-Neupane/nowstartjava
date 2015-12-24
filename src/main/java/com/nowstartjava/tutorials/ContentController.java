package com.nowstartjava.tutorials;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContentController {
	@RequestMapping(value = "/content/{slug}", method = RequestMethod.GET)
	public String startTutorial(@PathVariable String slug) {
		System.out.println(slug);
		return "displayContent";
	}
}
