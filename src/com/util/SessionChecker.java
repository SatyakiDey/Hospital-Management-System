package com.util;

//Checking validity for any session

import javax.servlet.http.HttpSession;

public class SessionChecker {
	
	public static boolean isValidSession(HttpSession session)
			{
		if(session == null || session.isNew())
			return false;
		String username=(String) session.getAttribute("username");
		if(username == null)
			return false;
		else 
			return true;
		}
	}
