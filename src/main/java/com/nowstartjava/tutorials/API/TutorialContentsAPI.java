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

import com.nowstartjava.tutorials.model.TutorialsContent;
import com.nowstartjava.tutorials.service.TutorialContentService;

@RestController
@RequestMapping(value = "/api/content")
public class TutorialContentsAPI {
	@Autowired
	private TutorialContentService tutscontentservice;

	@RequestMapping(value = "/display/{slugToId}", method = RequestMethod.GET)
	public List<TutorialsContent> displayContent(@PathVariable("slugToId") Integer id) {
		//find tutorialcontent By tutorial
		return tutscontentservice.tutorialContentByTutorial(id);
//		return tutscontentservice.findAll();
	}

	@RequestMapping(value = "/details", method = RequestMethod.POST)
	public ResponseEntity<String> postContent(
			@RequestBody TutorialsContent tutscontent, Model model) {
		tutscontentservice.save(tutscontent);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
