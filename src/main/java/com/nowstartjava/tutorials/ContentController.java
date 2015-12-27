package com.nowstartjava.tutorials;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nowstartjava.tutorials.service.TutorialService;

@Controller
public class ContentController {
	@Autowired
	private TutorialService tutorialServece;

	@RequestMapping(value = "/content/{slug}", method = RequestMethod.GET)
	public String startTutorial(@PathVariable String slug, Model model) {
		model.addAttribute("slugToid", tutorialServece.findOneBySlug(slug).getId());
		return "displayContent";
	}
}
