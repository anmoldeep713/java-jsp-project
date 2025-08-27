package com.preet.mvc.dao;
import java.sql.SQLException;
import com.preet.mvc.modal.User;

public interface UserDao {
	
	
//	Boolean validate(User user) throws SQLException;
	String validate(User user) throws SQLException;

}
