
public class LoginBean {
	private int effectiveTime;
	private String userName;
	private String userPassword;
	public LoginBean(int effectiveTime, String userName, String userPassword) {
		super();
		this.effectiveTime = effectiveTime;
		this.userName = userName;
		this.userPassword = userPassword;
	}
	public int getEffectiveTime() {
		return effectiveTime;
	}
	public void setEffectiveTime(int effectiveTime) {
		this.effectiveTime = effectiveTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	
}
