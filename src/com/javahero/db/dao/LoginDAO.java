package com.javahero.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import com.javahero.model.Login;
import com.javahero.util.DBConnection;

public class LoginDAO {

	public int insertSalt(Login login) {
		Connection con = DBConnection.getConnection();
		int id = 0;
		UUID uuid = UUID.randomUUID();
		String randomUUIDString = uuid.toString();
		try {
			PreparedStatement preparedStatement = con
					.prepareStatement("INSERT INTO loginExample.IRC_SALT_TEMP(SALTNO,GUID) VALUES(?,?)");
			preparedStatement.setString(1, login.getSalt());
			preparedStatement.setString(2, randomUUIDString);
			int returned = preparedStatement.executeUpdate();

			PreparedStatement preparedStatement2 = con
					.prepareStatement("select id from loginExample.IRC_SALT_TEMP where GUID=?");
			preparedStatement2.setString(1, randomUUIDString);
			ResultSet resultSet = preparedStatement2.executeQuery();
			if (resultSet.next())
				id = resultSet.getInt(1);

			login.setSeqPassword(Integer.toString(id));
			System.out.println(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	public void getSaltData(Login login) {
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement preparedStatement2 = con.prepareStatement("select SALTNO from loginExample.IRC_SALT_TEMP where id=?");
			preparedStatement2.setString(1,login.getSeqPassword());
			ResultSet resultSet = preparedStatement2.executeQuery();
			if (resultSet.next())
				login.setSalt(resultSet.getString(1));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deleteSaltFromDB(Login login) {
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("DELETE FROM loginExample.IRC_SALT_TEMP WHERE id=?");
			preparedStatement.setString(1, login.getSeqPassword());			
			int returned = preparedStatement.executeUpdate();
			System.out.println("No of Records Deleted : "+returned);			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
