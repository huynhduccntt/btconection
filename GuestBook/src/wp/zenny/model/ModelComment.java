package wp.zenny.model;

import java.util.Date;

public class ModelComment {
	int id;
	String userName;
	String comment;
	Date dateCmt;
	public ModelComment() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDateCmt() {
		return dateCmt;
	}
	public void setDateCmt(Date dateCmt) {
		this.dateCmt = dateCmt;
	}

}
