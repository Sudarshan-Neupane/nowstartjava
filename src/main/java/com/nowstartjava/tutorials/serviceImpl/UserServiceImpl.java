package com.nowstartjava.tutorials.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
		final User user= userRepo.loginUser(username, password) ;
		if(user != null){
			//set authorization
			List<GrantedAuthority> authority= new ArrayList<GrantedAuthority>();
			GrantedAuthority grantedAuthority= new GrantedAuthority() {

				public String getAuthority() {
					System.out.println("Awesome--------------- "+user.getRole().toString());
					return user.getRole().toString();
				}
			};
			authority.add(grantedAuthority);
			
			Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(), authority);

			SecurityContextHolder.getContext().setAuthentication(authentication);
			
		}
		return user;
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
	public User update(User userToUpdate) {
		userRepo.save(userToUpdate);
		return userToUpdate;
	}
}
