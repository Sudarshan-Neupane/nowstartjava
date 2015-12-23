package com.nowstartjava.tutorials.API;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.nowstartjava.tutorials.model.Tutorials;
import com.nowstartjava.tutorials.service.TutorialService;

@RestController
public class TutorialAPI {
	@Autowired
	private TutorialService tutorialservice;

	@RequestMapping(value = "/tutorial", method = RequestMethod.GET)
	public List<Tutorials> getTutorials() {
		return tutorialservice.findAll();
	}

	@RequestMapping(value = "/tutorial", method = RequestMethod.POST)
	public ResponseEntity<String> postTutorils(
			@RequestBody Tutorials tutorials, Model model) {
		tutorialservice.save(tutorials);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	//Retrieve the category data
	@RequestMapping(value="/tutorial/{catId}", method= RequestMethod.GET)
	public List<Tutorials> getTutorialsByCategory(@PathVariable int catId){
		System.out.println(catId);
		return tutorialservice.findAllByCategoryId(catId);
	}
}
