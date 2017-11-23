package wp.zenny.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	public String error;
	public UserDAO() {
		error = "";
	}
	
	public int InsertUser(String username, String password, String fullname) {
		CallableStatement stsm;
		int result = 0;
		Connection conn = DataAccess.getConnection();
		if(conn == null) {
			error = DataAccess.err;
			return 0;
		}
		try {
			stsm = conn.prepareCall("call spInsertUser(?,?,?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stsm.setString(1, username);
			stsm.setString(2, password);
			stsm.setString(3, fullname);
			result = stsm.executeUpdate();
		} catch (SQLException e) {
			error = e.getMessage();
		}
		return result;
	}
	// return fullname
	public String CheckLogin(String username, String pwd) {
		CallableStatement stsm;
		String result = "";
		ResultSet rs = null;
		Connection conn = DataAccess.getConnection();
		if(conn == null) {
			error = DataAccess.err;
			return "";
		}
		try {
			stsm = conn.prepareCall("call spLogin(?,?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stsm.setString(1, username);
			stsm.setString(2, pwd);
			rs = stsm.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			error = e.getMessage();
		} catch(Exception ex) {
			error = ex.getMessage();
		}
		return result;
	}
}
