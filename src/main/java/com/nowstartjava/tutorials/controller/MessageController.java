package com.nowstartjava.tutorials.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nowstartjava.tutorials.model.Message;
import com.nowstartjava.tutorials.service.MessageService;

@Controller
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/submit",method=RequestMethod.POST)
	public String getMessage(@Valid @ModelAttribute("message")Message message,BindingResult result,RedirectAttributes model){
		
		if(result.hasErrors()){
			return "contactPage";
		}
//		System.out.println(message);
		messageService.saveMessage(message);
		model.addFlashAttribute("success_message","Thank you for you message. We'll get back to you asap.");
		return "redirect:/contact";
	}
	
}
