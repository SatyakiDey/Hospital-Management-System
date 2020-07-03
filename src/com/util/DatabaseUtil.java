package com.util;

//Establishing connectivity to the database

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DatabaseUtil {
	
	private static final String URL="jdbc:mysql://localhost:3306/userdb";
	private static final String DRIVER_NAME="com.mysql.cj.jdbc.Driver";
	private static final String USERNAME="root";
	private static final String PASSWORD="1234";
	
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName(DRIVER_NAME);
			con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	
	public static void closeConnection(Connection con) {
		if(con!=null) {
			try {
				con.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public static void closeStatement(PreparedStatement ps) {
		if(ps!=null) {
			try {
				ps.close();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
