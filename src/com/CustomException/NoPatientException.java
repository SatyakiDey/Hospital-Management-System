package com.CustomException;

public class NoPatientException extends Exception {
	public NoPatientException (String message) {
		super(message);
	}
	
	public String getMessage() {
		return super.getMessage();
	}
}
