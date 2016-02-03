package com.nowstartjava.tutorials.service;

import java.util.List;

import com.nowstartjava.tutorials.model.Menu;

public interface MenuService {
	public void save(Menu menu);

	public List<Menu> findAll();
	
	public Menu findOne(Integer id);
	
	public void update(Menu menu);
}
