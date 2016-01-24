package com.nowstartjava.tutorials.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nowstartjava.tutorials.exceptions.UserAlreadyExistsException;
import com.nowstartjava.tutorials.model.User;
import com.nowstartjava.tutorials.repository.UserRepository;
import com.nowstartjava.tutorials.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;
	
	@Override
	public User findOne(int id) {
		return userRepo.findOne(id);
	}

	@Override
	public List<User> findAll() {
		return userRepo.findAll();
	}

	@Override
	public void save(User user) {
		User userIfExist = userRepo.findUserByEmail(user.getEmail());
		if(userIfExist != null){
			throw new UserAlreadyExistsException();
		}
		userRepo.save(user);
	}

	
	@Override
	public User loginUser(String username, String password) {
		return userRepo.loginUser(username, password);
	}

	@Override
	public User delete(Integer userId) {
		User userToDelete = userRepo.findOne(userId);
		userRepo.delete(userId);
		return userToDelete;
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User update(Integer userId) {
		User userToUpdate = userRepo.findOne(userId);
		userRepo.save(userToUpdate);
		return userToUpdate;
	}
}
