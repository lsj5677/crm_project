package com.crm.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Chaebun {
	
public static String chaebun(String sVal, String sVal2){
		
		String s = sVal;
		String d = date();
		s = sLen(s);
		s = sVal2 + d + s;
		
		System.out.println("s > : "+ s);
		
		return s;
	}
	
	public static String date(){
		
		Date d = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
		
		String sz = sdf.format(d);
//		System.out.println("sz >> : "+ sz);
		return sz;
	}
	
	public static String sLen(String sVal){
		
		String s = sVal;
		int sLen = s.length();
		if(sLen == 1){
			s = "000" + s;
		}
		if(sLen == 2){
			s = "00" + s;
		}
		if(sLen == 3){
			s = "0" + s;
		}
//		System.out.println("s >> : "+ s);
	
		return s;
	}
	
	public static String sPlus(String sVal,String sVal2){
		String name = sVal;
		String namePlus = sVal2;
		String lastName ="";
		
		lastName = sVal2 + sVal;
		return lastName;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Chaebun d = new Chaebun();
		String s = "s";
		d.chaebun("1", "s");
	}
}
