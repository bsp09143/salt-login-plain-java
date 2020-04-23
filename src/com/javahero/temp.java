package com.javahero;

import java.security.SecureRandom;

public class temp {

	public static void main(String[] args) throws Exception 
	{
		SecureRandom generator= new SecureRandom();
		float range = (99 - 10);
		int fraction = (int)((range) * generator.nextFloat());
		System.out.println(fraction);
		StringBuffer val = new StringBuffer("28740138040443138044389");
		System.out.println(convertToActual(val));
	}
	
	public static StringBuffer convertToActual(StringBuffer maskedData) throws Exception 
	{
	     StringBuffer data = new StringBuffer(maskedData.substring(0,96));
	     String key = maskedData.substring(96,maskedData.length());
	     int intKey = Integer.parseInt(key);
	     StringBuffer actual = new StringBuffer("");
	     for(int i=0;i<32;i++)
	     {
		     int split = Integer.parseInt(data.substring(i*3, (i*3)+3));
		     char ch = (char)((split-intKey)/3);
		     actual.append(ch);
	     }
	     return actual;
	}

}
