package com.preet.mvc.dao;
import java.sql.Statement;

import com.preet.mvc.modal.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao{
  
	private Connection connection;

	private PreparedStatement preparedStatement;
	
	
	
	public UserDaoImpl() throws ClassNotFoundException , SQLException{
		connection = MyConnection.getConnection();	
	}


	@Override
//	public Boolean validate(User user) throws SQLException {
//		String sql = "select * from user1 where username=? and password=?";
//		preparedStatement = connection.prepareStatement(sql);
//		preparedStatement.setString(1, user.getUserName());
//		preparedStatement.setString(2, user.getUserPassword());
//		ResultSet resultSet = preparedStatement.executeQuery();   
//		 return resultSet.next();
//	}
	public String validate(User user) throws SQLException {
		String sql = "select * from students where name=? and email=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, user.getName());
		preparedStatement.setString(2, user.getEmail());
		ResultSet resultSet = preparedStatement.executeQuery();   
		if(resultSet.next()) {
			return "welcome";
			
		}
		else {
			return "error";
		}
	}
	
	
	
	
	
	

}
