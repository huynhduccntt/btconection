package wp.zenny.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import wp.zenny.model.ModelComment;

public class CmtDAO {

	public String error;

	public CmtDAO() {
		error = "";
	}
	
	public int InsertCmt(String username, String cmt) {
		CallableStatement stsm;
		int result = 0;
		Connection conn = DataAccess.getConnection();
		if(conn == null) {
			error = DataAccess.err;
			return 0;
		}
		try {
			stsm = conn.prepareCall("call spInsertCmt(?,?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stsm.setString(1, username);
			stsm.setString(2, cmt);
			
			result = stsm.executeUpdate();
		} catch (SQLException e) {
			error = e.getMessage();
		}
		return result;
	}
	
	public int UpdateCmt(String username, String cmt, int id) {
		CallableStatement stsm;
		int result = 0;
		Connection conn = DataAccess.getConnection();
		if(conn == null) {
			error = DataAccess.err;
			return 0;
		}
		try {
			stsm = conn.prepareCall("call spUpdateCmt(?,?,?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stsm.setString(1, username);
			stsm.setString(2, cmt);
			stsm.setInt(3, id);
			
			result = stsm.executeUpdate();
		} catch (SQLException e) {
			error = e.getMessage();
		}
		return result;
	}
	
	public int DeleteCmt(int id) {
		CallableStatement stsm;
		int result = 0;
		Connection conn = DataAccess.getConnection();
		if(conn == null) {
			error = DataAccess.err;
			return 0;
		}
		try {
			stsm = conn.prepareCall("call spDeleteCmt(?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stsm.setInt(1, id);
			result = stsm.executeUpdate();
		} catch (SQLException e) {
			error = e.getMessage();
		}
		return result;
	}
	
}
