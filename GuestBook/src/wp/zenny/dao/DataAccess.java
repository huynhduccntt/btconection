package wp.zenny.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataAccess {
	private final static String Driver = "com.mysql.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost/guestbook1";
	private final static String USERID = "root";
	private final static String PWD = "1234";
	static Connection conn;
	public static String err; 
	
	public DataAccess() {
	}
	
	public static Connection getConnection() {
		conn = null;
		err = "";
		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			err = e.getMessage();
		}
		try {
			conn = DriverManager.getConnection(URL, USERID, PWD);
		} catch (SQLException e) {
			err = e.getMessage();
		}
		
		return conn;
	}

}
