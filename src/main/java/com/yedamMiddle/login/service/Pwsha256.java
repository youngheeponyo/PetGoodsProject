package com.yedamMiddle.login.service;

import java.security.MessageDigest;

public class Pwsha256 {
	public static String encrypt(String userPw) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(userPw.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userPw;
		
	}
}