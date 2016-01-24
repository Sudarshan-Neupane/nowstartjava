package com.nowstartjava.tutorials.service;

import java.util.List;

import com.nowstartjava.tutorials.model.User;

public interface UserService {
	public User findOne(int id);

	public List<User> findAll();

	public void save(User user);

	public User delete(Integer userId);
	
	public void delete(User user);
	
	User update(Integer userId);
	
	public User loginUser(String username, String password);
}
