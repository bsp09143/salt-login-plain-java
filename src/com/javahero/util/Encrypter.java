package com.javahero.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encrypter {

	public static StringBuffer convertToActual(StringBuffer maskedData) throws Exception {

		StringBuffer data = new StringBuffer(maskedData.substring(0, 96));
		String key = maskedData.substring(96, maskedData.length());
		int intKey = Integer.parseInt(key);
		StringBuffer actual = new StringBuffer("");

		for (int i = 0; i < 32; i++) {
			int split = Integer.parseInt(data.substring(i * 3, (i * 3) + 3));
			char ch = (char) ((split - intKey) / 3);
			actual.append(ch);
		}
		return actual;

	}

	public static String convertToHash(String input, String hashType) {
		try {
			MessageDigest md = MessageDigest.getInstance(hashType);
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger no = new BigInteger(1, messageDigest);
			String hashtext = no.toString(16);
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void main (String args[])
	{
		System.out.println(convertToHash("admin","MD5"));
		System.out.println(convertToHash("admin","SHA-512"));
	}
}
