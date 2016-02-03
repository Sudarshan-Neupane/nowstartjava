package com.nowstartjava.tutorials.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nowstartjava.tutorials.model.Menu;
import com.nowstartjava.tutorials.repository.MenuRepository;
import com.nowstartjava.tutorials.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuRepository menuRepository;

	@Override
	public void save(Menu menu) {
		menuRepository.save(menu);
	}

	@Override
	public List<Menu> findAll() {
		return menuRepository.findAll();
	}

	@Override
	public Menu findOne(Integer id) {
		return menuRepository.findOne(id);
	}

	@Override
	public void update(Menu menu) {
		Menu oldMenu = findOne(menu.getId());
		oldMenu.setTitle(menu.getTitle());
		oldMenu.setDescription(menu.getDescription());
		menuRepository.save(menu);
	}
	
	

}
