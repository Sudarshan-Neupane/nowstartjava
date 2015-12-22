package com.nowstartjava.tutorials.service;

import java.util.List;

import com.nowstartjava.tutorials.model.Category;

public interface CategoryService {
	public Category findOne(int itemId);

	public List<Category> findAll();

	public void save(Category item);

	public void delete(Category category);

}
