package com.amazon.dbConnection;
import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectionFactory {
		public static Connection getConnection() {
			Connection connection = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1234");
				//

			} catch (Exception e) {
				System.out.println("Exception: " + e.getMessage());
			}

			return connection;
		}
}


