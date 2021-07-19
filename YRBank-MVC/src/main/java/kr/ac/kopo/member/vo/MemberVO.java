package kr.ac.kopo.member.vo;

public class MemberVO {
	
	private String id;
	private String password;
	private String name;
	private String ss1;
	private String ss2;
	private String email;
	private String tel;
	private String lastOpenAccDate;
	private String type;
	
	public MemberVO() {
	}

	public MemberVO(String id, String password, String name, String ss1, String ss2, String email, String tel) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.ss1 = ss1;
		this.ss2 = ss2;
		this.email = email;
		this.tel = tel;
	}
	

	public MemberVO(String id, String password, String name, String ss1, String ss2, String email, String tel,
			String lastOpenAccDate, String type) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.ss1 = ss1;
		this.ss2 = ss2;
		this.email = email;
		this.tel = tel;
		this.lastOpenAccDate = lastOpenAccDate;
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSs1() {
		return ss1;
	}

	public void setSs1(String ss1) {
		this.ss1 = ss1;
	}

	public String getSs2() {
		return ss2;
	}

	public void setSs2(String ss2) {
		this.ss2 = ss2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLastOpenAccDate() {
		return lastOpenAccDate;
	}

	public void setLastOpenAccDate(String lastOpenAccDate) {
		this.lastOpenAccDate = lastOpenAccDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", ss1=" + ss1 + ", ss2=" + ss2
				+ ", email=" + email + ", tel=" + tel + "]";
	}

	
	
}
