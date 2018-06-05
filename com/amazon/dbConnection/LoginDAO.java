package com.amazon.dbConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sun.security.provider.MD5;



public class LoginDAO {
	ConnectionFactory connectionFactory = new ConnectionFactory();
	Connection con = connectionFactory.getConnection();

	public boolean validate(String admin_id, String password) throws SQLException {
		

		String password1 = null;
		Statement statement = con.createStatement();
		String query = "select password from User where voter_id ='" + admin_id + "'";
		String query1 = "SELECT MD5('" + password + "')";
		ResultSet resultSet = statement.executeQuery(query);
		
		if (resultSet.next()) {
			password1 = resultSet.getString(1);

		}
		resultSet.close();
		ResultSet resultSet2 = statement.executeQuery(query1);
		if (resultSet2.next()) {
			password = resultSet2.getString(1);

		}
		resultSet2.close();
		//System.out.println(password + " " + password1);
		//System.out.println(admin_id + " " +password);

		if ((password.equals(password1))) {

			return true;
		}

		return false;
	}
}

