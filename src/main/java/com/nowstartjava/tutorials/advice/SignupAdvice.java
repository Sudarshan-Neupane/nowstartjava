package com.nowstartjava.tutorials.advice;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nowstartjava.tutorials.email.EmailService;
import com.nowstartjava.tutorials.model.User;

@Aspect
@Component
public class SignupAdvice {
	@Autowired
	private EmailService emailService;

	@AfterReturning("execution(* com.nowstartjava.tutorials.serviceImpl.UserServiceImpl.save(..))")
	public void aopEmail(JoinPoint jp) {
		System.out.println("hello sabin");
		User user = (User) jp.getArgs()[0];
		emailService.sendEmail(user.getEmail(), "Registration info","Registered Sucessfully to Programming discussion forum!! "+
				"Your username is: "+user.getEmail()+" and password is: "+
				user.getPassword()+". Share your idea in Tutorials Java...");
//		
	}
	
	@After("execution(* com.nowstartjava.tutorials.serviceImpl.UserServiceImpl.update(..))")
	public void updateAopEmail(JoinPoint jp) {
		System.out.println("hello sabin");
		User user = (User) jp.getArgs()[0];
		emailService.sendEmail(user.getEmail(), "Update Registration info","Updated Registered Sucessfully to Programming discussion forum!! "+
				"Your username is: "+user.getEmail()+" and password is: "+
				user.getPassword()+". Share your idea in Tutorials Java...");
//		
	}
}
