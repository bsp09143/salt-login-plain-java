package com.javahero.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javahero.util.DBConnection;


public class UserDAO {

	public String getDBPassword(String userId) {
		Connection con = DBConnection.getConnection();		
		String password = null;
		try {
			PreparedStatement preparedStatement = con.prepareStatement("select Password from loginExample.User where encid=?");
			preparedStatement.setString(1, userId);			
			ResultSet resultSet = preparedStatement.executeQuery();	 
			
			if(resultSet.next())
			password = resultSet.getString(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return password;
	}
	
	

}
