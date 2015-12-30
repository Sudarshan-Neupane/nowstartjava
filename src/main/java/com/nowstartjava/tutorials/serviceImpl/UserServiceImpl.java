package com.nowstartjava.tutorials.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nowstartjava.tutorials.model.User;
import com.nowstartjava.tutorials.repository.UserRepository;
import com.nowstartjava.tutorials.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;
	
	@Override
	public User findOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User loginUser(String username, String password) {
		// TODO Auto-generated method stub
		return userRepo.loginUser(username, password);
	}

}
