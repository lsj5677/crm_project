package com.crm.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public class datePicker {

	
	public static String[] getDate(String dateVal, int count) throws Exception {
		String[] dates = new String[count];
		dates[0] = dateVal;
		
		SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd");
//		String date = formatter.format(dateVal);
		Date setDate = formatter.parse(dateVal);
		
		dates[0] = dateVal;
		
		for(int i = 1; i < count; i++){
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.setTime(setDate);
			cal.add(Calendar.DATE, -1);
			String y_date = formatter.format(cal.getTime());
			
			dates[i] = y_date;
//			System.out.println(dates[i]);
			
			setDate = formatter.parse(y_date);
		};
		
		for(String x : dates){
		System.out.println(x);}
		return dates;
	}
	
	public static String[] getMonth(String monthVal) throws Exception {
		String[] month = {"/01", "/02", "/03", "/04", "/05", "/06", "/07", "/08", "/09", "/10", "/11", "/12"};
		for(int i=0; i<month.length; i++){
			System.out.println(month[i]);
		}
		monthVal = monthVal.substring(2);
		System.out.println("monthVal >> : "+ monthVal);
		return null;
	}
	
	
	public static void main(String[] args) {
		
		try {
			getMonth("2019");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
