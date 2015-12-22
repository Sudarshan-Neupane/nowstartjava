package com.nowstartjava.tutorials.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nowstartjava.tutorials.model.Category;
import com.nowstartjava.tutorials.repository.CategoryRepository;
import com.nowstartjava.tutorials.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryRepository categoryRepo;
	@Override
	public Category findOne(int itemId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Category> findAll() {
		return categoryRepo.findAll();
	}

	@Override
	public void save(Category category) {
		categoryRepo.save(category);
		
	}

	@Override
	public void delete(Category category) {
		// TODO Auto-generated method stub
		
	}

}
