package com.nowstartjava.tutorials.exceptions;

public class UserAlreadyExistsException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public UserAlreadyExistsException(){
		super();
	}
	public UserAlreadyExistsException(String message){
		super(message);
	}
	public UserAlreadyExistsException(String message,Throwable cause){
		super(message,cause);
	}

}
