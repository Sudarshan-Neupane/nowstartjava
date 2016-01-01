package com.nowstartjava.tutorials.API;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.nowstartjava.tutorials.model.Category;
import com.nowstartjava.tutorials.service.CategoryService;

@RestController
public class CategoryAPI {
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public List<Category> getCategory() {
		return categoryService.findAll();
	}

	/*@RequestMapping(value = "/category", method = RequestMethod.POST)
	public ResponseEntity<String> postCategory(@RequestBody Category category,
			Model model) {
		categoryService.save(category);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}*/

	@RequestMapping(value = "/category", method = RequestMethod.POST)
	public ResponseEntity<Category> postCategory1(@Valid @RequestBody Category category,
			Model model) {
		categoryService.save(category);
		return new ResponseEntity<Category>(HttpStatus.OK);
	}

}
