package com.nowstartjava.tutorials.exceptions;

public class AddTutorialExistsException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public AddTutorialExistsException(){
		super();
	}
	public AddTutorialExistsException(String message){
		super(message);
	}
	public AddTutorialExistsException(String message,Throwable cause){
		super(message,cause);
	}

}
