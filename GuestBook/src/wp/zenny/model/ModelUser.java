package wp.zenny.model;

public class ModelUser {

	String username;
	String fullname;
	public ModelUser(String userName, String fullName) {
		super();
		this.username = userName;
		this.fullname = fullName;
	}
	public String getUserName() {
		return username;
	}
	public void setUserName(String userName) {
		this.username = userName;
	}
	public String getFullName() {
		return fullname;
	}
	public void setFullName(String fullName) {
		this.fullname = fullName;
	}
	public ModelUser() {
	}

}
