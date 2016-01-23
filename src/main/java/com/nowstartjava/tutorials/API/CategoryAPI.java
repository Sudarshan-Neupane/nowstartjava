package com.nowstartjava.tutorials.API;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping(value = "/category", method = RequestMethod.POST)
	public ResponseEntity<Category> postCategory1(@Valid @RequestBody Category category, Model model) {
		categoryService.save(category);
		return new ResponseEntity<Category>(HttpStatus.OK);
	}

	@RequestMapping(value = "/deleteCategory/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Category> deleteCategoryById(@PathVariable("id") Integer id) {
		Category cat = categoryService.findOne(id);
		if (cat == null) {
			System.out.println("Unable to delete. Category with id " + id + " not found");
			return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);
		}
		categoryService.deleteById(id);
		return new ResponseEntity<Category>(HttpStatus.NO_CONTENT);

	}

	@RequestMapping(value = "/updateCategory/{id}", method = RequestMethod.POST)
	public ResponseEntity<Category> updateCategory(@PathVariable("id") Integer id,
			@Valid @RequestBody Category category, Model model) {
		Category getCategory = categoryService.findOne(id);
		if (getCategory == null) {
			System.out.println("Unable to ubdate category " + id + " Not found ");
			return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);
		}
		getCategory.setName(category.getName());
		categoryService.save(getCategory);
		return new ResponseEntity<Category>(HttpStatus.OK);
	}

}