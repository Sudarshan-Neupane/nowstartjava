package com.nowstartjava.tutorials.cms;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.nowstartjava.tutorials.model.TutorialsContent;
import com.nowstartjava.tutorials.service.TutorialContentService;

@Controller
@RequestMapping("/cms/contents")
public class TutorialContentController {
	
	@Autowired
	private TutorialContentService tutorialContentService;
	
	@RequestMapping(value="/{tutorialId}",method=RequestMethod.GET)
	public String displayTutorialContent(@ModelAttribute("tutorialContent") TutorialsContent tutorialContent,@PathVariable("tutorialId") Integer id,Model model) {
		//find tutorialcontent By tutorial
		List<TutorialsContent> contents = tutorialContentService.tutorialContentByTutorial(id);
//		System.out.println(contents.size());
		model.addAttribute("contents", contents);
		model.addAttribute("tutorialId",id);
		return "cms/contents";
	}
	
	@RequestMapping(value="/delete/{tutorialId}",method=RequestMethod.GET)
	public ResponseEntity<TutorialsContent> deleteTutorialContent(@PathVariable("tutorialId") Integer id){
		tutorialContentService.delete(id);
		return new ResponseEntity<TutorialsContent>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String addTutorialContent(@ModelAttribute("tutorialContent") TutorialsContent tutorialContent){
		int tutorialId = tutorialContent.getTutorials().getId();
		
		tutorialContentService.update(tutorialContent);
		return "redirect:/cms/contents/"+tutorialId;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addTutorialContent(@Valid@ModelAttribute("tutorialContent") TutorialsContent tutorialContent,BindingResult result){
		if(result.hasErrors()){
			return "cms/contents";
		}
		tutorialContent.setDateCreated(new Date());
		tutorialContent.setNumberOfViewers(1);
		tutorialContent.setSlug(tutorialContent.getTitle());
		tutorialContent.setDisplayOrder(1);
		tutorialContentService.save(tutorialContent);
		
		System.out.println("Got here-----------------------------------");
		int tutorialId = tutorialContent.getTutorials().getId();
		System.out.println("id :"+tutorialId);
		return "redirect:/cms/contents/"+tutorialId;
	}

}
