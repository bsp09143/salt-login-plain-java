package com.javahero.util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnection 
{
	
	public static Connection getConnection()
	{
		Connection con = null;
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");  
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/loginExample?useSSL=false","root","vasudev@9869");			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return con;
	}
}
