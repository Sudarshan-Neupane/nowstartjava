package com.nowstartjava.tutorials.cms;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nowstartjava.tutorials.exceptions.AddTutorialExistsException;
import com.nowstartjava.tutorials.model.Category;
import com.nowstartjava.tutorials.model.Tutorials;
import com.nowstartjava.tutorials.service.TutorialService;

@Controller
@RequestMapping("/cms/tutorials")
public class TutorialController {

	@Autowired
	private TutorialService tutorialService;

	// retrieve the tutorials for a particular writer
	@RequestMapping(value = "/by_writer/{writerId}", method = RequestMethod.GET)
	public String getTutorialsByWriterId(@PathVariable("writerId") Integer id, Model model) {
		List<Tutorials> tutorials = tutorialService.findAllByWriterId(id);
		if (tutorials == null) {
			model.addAttribute("message", "No tutorial found for writer with id " + id);
		}
		model.addAttribute("tutorials",tutorials);
		return "cms/tutorial-list";
	}

	@RequestMapping(value="/delete/{tutorialId}",method=RequestMethod.GET)
	public ResponseEntity<Tutorials> deleteTutorial(@PathVariable("tutorialId")Integer id){
		System.out.println(id);
		
		tutorialService.delete(id);
		
		return new ResponseEntity<Tutorials>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ResponseEntity<Tutorials> updateTutorial(@RequestBody Tutorials tutorial){
		System.out.println(tutorial.getId());
		
		tutorialService.update(tutorial);
		
		return new ResponseEntity<Tutorials>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResponseEntity<Tutorials> addTutorial(@RequestBody Tutorials tutorial){
		tutorial.setDateCreated(new Date());
		tutorial.setDisplayOrder(1);
		tutorial.setSlug(tutorial.getTitle());
		
		try {
			tutorialService.save(tutorial);
		} catch (AddTutorialExistsException e) {
			return new ResponseEntity<Tutorials>(HttpStatus.CONFLICT);
		}
		return new ResponseEntity<Tutorials>(HttpStatus.OK);
	}
}
