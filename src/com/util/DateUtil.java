package com.util;

//Changing any date to the desired format 

import java.text.*;
import java.util.Date;

public class DateUtil{

	public static Date convertStringToDate(String dateInString, String format) {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		Date date=null;
		try {
			//System.out.println("Date String: "+dateInString);
			date=formatter.parse(dateInString);
			
		}
		catch(ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
}
