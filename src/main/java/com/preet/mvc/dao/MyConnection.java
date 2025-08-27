package com.preet.mvc.dao;
import java.sql.*;


public class MyConnection {
	
	private static Connection connection;
	private MyConnection() {
	}
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException  {
		String driverName = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://@localhost:3306/student_db";
		String userName = "root";
		String password = "Mind@1234";
		
		
		if (connection == null) {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url ,userName , password );
		}
		
		return connection;
	}
	
	

}
