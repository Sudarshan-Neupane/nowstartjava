package com.nowstartjava.tutorials.cms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nowstartjava.tutorials.model.Tutorials;
import com.nowstartjava.tutorials.service.TutorialService;

@Controller
@RequestMapping("/cms/tutorials")
public class TutorialController {

	@Autowired
	private TutorialService tutorialService;
	
	@RequestMapping(value="/delete/{tutorialId}",method=RequestMethod.GET)
	public ResponseEntity<Tutorials> deleteTutorial(@PathVariable("tutorialId")Integer id){
		System.out.println(id);
		
		tutorialService.delete(id);
		
		return new ResponseEntity<Tutorials>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ResponseEntity<Tutorials> updateTutorial(@ModelAttribute("tutorial") Tutorials tutorial){
		System.out.println(tutorial.getId());
		
		tutorialService.update(tutorial);
		
		return new ResponseEntity<Tutorials>(HttpStatus.OK);
	}
}
