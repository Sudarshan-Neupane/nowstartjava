package com.nowstartjava.tutorials.cms;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nowstartjava.tutorials.exceptions.UserAlreadyExistsException;
import com.nowstartjava.tutorials.model.Category;
import com.nowstartjava.tutorials.model.Role;
import com.nowstartjava.tutorials.model.User;
import com.nowstartjava.tutorials.service.CategoryService;
import com.nowstartjava.tutorials.service.UserService;

@Controller
@RequestMapping(value = "/cms")
public class CmsController {
	
	@RequestMapping(value="/category",method=RequestMethod.GET)
	public String category(HttpSession session){
		if(session.getAttribute("loginUser")==null){
			return "redirect:/cms";
		}
		return "cms/category";
	}
	
}
