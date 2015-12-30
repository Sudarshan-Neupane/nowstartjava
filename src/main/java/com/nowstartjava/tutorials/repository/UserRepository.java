package com.nowstartjava.tutorials.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nowstartjava.tutorials.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	@Query("SELECT u FROM User u where u.email =?1 AND u.password =?2")
	public User loginUser(String username, String password);

}
