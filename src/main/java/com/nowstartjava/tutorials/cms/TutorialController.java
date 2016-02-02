package com.nowstartjava.tutorials.cms;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nowstartjava.tutorials.exceptions.AddTutorialExistsException;
import com.nowstartjava.tutorials.model.Category;
import com.nowstartjava.tutorials.model.Tutorials;
import com.nowstartjava.tutorials.model.User;
import com.nowstartjava.tutorials.service.CategoryService;
import com.nowstartjava.tutorials.service.TutorialService;

@Controller
@RequestMapping("/cms/tutorials")
public class TutorialController {

	@Autowired
	private TutorialService tutorialService;
	
	@Autowired
	private CategoryService categoryService;

	// retrieve the tutorials for a particular writer
	@RequestMapping(value = "/{writerId}", method = RequestMethod.GET)
	public String getTutorialsByWriterId(@PathVariable("writerId") Integer id,@ModelAttribute("tutorial") Tutorials tutorial, Model model) {
		/*List<Tutorials> tutorials = tutorialService.findAllByWriterId(id);
		if (tutorials == null) {
			model.addAttribute("message", "No tutorial found for writer with id " + id);
		}
		model.addAttribute("tutorials",tutorials);*/
		return "cms/tutorial-list";
	}

	@RequestMapping(value="/delete/{tutorialId}",method=RequestMethod.GET)
	public ResponseEntity<Tutorials> deleteTutorial(@PathVariable("tutorialId")Integer id){
		System.out.println(id);
		
		tutorialService.delete(id);
		
		return new ResponseEntity<Tutorials>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateTutorial(Tutorials tutorial,RedirectAttributes ra, HttpServletRequest request){
		System.out.println(tutorial.getId());
		
		tutorialService.update(tutorial);
		ra.addFlashAttribute("message","Updated Successfully");
		return "redirect:/cms/tutorials/"+((User)request.getSession().getAttribute("loginUser")).getId();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addTutorialForm(@ModelAttribute("tutorial") Tutorials tutorial){
//		User currentUser = (User) request.getSession().getAttribute("loginUser");
//		System.out.println(currentUser);
		System.out.println(tutorial.getCategory());
		
		return "cms/addTutorial";
	}
	
	/*@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResponseEntity<Tutorials> addTutorial(@ModelAttribute("tutorial") Tutorials tutorial){
		System.out.println(tutorial);
		tutorial.setDateCreated(new Date());
		tutorial.setDisplayOrder(1);
		tutorial.setSlug(tutorial.getTitle());
		
		try {
			tutorialService.save(tutorial);
		} catch (AddTutorialExistsException e) {
			return new ResponseEntity<Tutorials>(HttpStatus.CONFLICT);
		}
		return new ResponseEntity<Tutorials>(HttpStatus.OK);
	}*/
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addTutorial(@ModelAttribute("tutorial") Tutorials tutorial,RedirectAttributes ra,HttpServletRequest request){
		System.out.println(tutorial);
		tutorial.setDateCreated(new Date());
		tutorial.setDisplayOrder(1);
		tutorial.setSlug(tutorial.getTitle());
		Category category=categoryService.findOne(tutorial.getCategory().getId());
		System.out.println(category);
		tutorial.setCategory(category);
		try {
			tutorialService.save(tutorial);
			ra.addFlashAttribute("message","Added Successfully.");
		} catch (AddTutorialExistsException e) {
			System.out.println(e.getMessage());
			ra.addFlashAttribute("message","Added Unsuccessful.");
			return "cms/addTutorial";
		}
		return "redirect:/cms/tutorials/"+((User)request.getSession().getAttribute("loginUser")).getId();
	}
}
