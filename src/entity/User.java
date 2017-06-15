package entity;

public class User {
    private int id;           //=1;
	private String name;      //
	private String password;  //
	private int Member_sign;	//用户级别标记位
	private String User_TureName;	//用户真实姓名
	
	
	public String getName() {
		return name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getMember_sign() {
		return Member_sign;
	}
	public void setMember_sign(int member_sign) {
		this.Member_sign = member_sign;
	}
	public String getUser_TureName() {
		return User_TureName;
	}
	public void setUser_TureName(String user_TureName) {
		this.User_TureName = user_TureName;
	}
}
