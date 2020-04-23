package com.javahero.service;

import java.security.SecureRandom;

import com.javahero.db.dao.LoginDAO;
import com.javahero.db.dao.UserDAO;
import com.javahero.model.Login;
import com.javahero.util.DBConnection;
import com.javahero.util.Encrypter;


public class LoginService {

	public void getDBPassword(Login login) {
		String password = "";
		UserDAO userDao = new UserDAO();
		password = userDao.getDBPassword(login.getEncUserId());
		login.setDbPassword(Encrypter.convertToHash(password,"SHA-512"));
	}

	public void generateLoginDetails(Login login) {
		StringBuffer token = new StringBuffer();
		for (int i = 0; i < 5; i++) {			
			SecureRandom rand = new SecureRandom();
			float secRandom = rand.nextFloat();
			token.append(Math.round((secRandom < 0.0) ? (secRandom * -1) * 100 : secRandom * 100));
		}
		String token1 = token.toString();
		login.setSalt(token1);
		LoginDAO loginDao1 = new LoginDAO();
		loginDao1.insertSalt(login);
	}
	
	public void getSalt(Login login) {
		LoginDAO loginDao1 = new LoginDAO();
		loginDao1.getSaltData(login);
	}
	
	public void deleteSalt(Login login) {
		LoginDAO loginDao1 = new LoginDAO();
		loginDao1.deleteSaltFromDB(login);
	}
	
}
