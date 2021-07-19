package kr.ac.kopo.member.vo;

public class MemberVO {
	
	private String id;
	private String password;
	private String name;
	private String email;
	private String tel;
	private String post;
	private String basicAddr;
	private String detailAddr;
	private String regDate;
	
	public MemberVO() {
	}

	public MemberVO(String id, String password, String name, String email, String tel, String post, String basicAddr,
			String detailAddr, String regDate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.post = post;
		this.basicAddr = basicAddr;
		this.detailAddr = detailAddr;
		this.regDate = regDate;
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

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getBasicAddr() {
		return basicAddr;
	}

	public void setBasicAddr(String basicAddr) {
		this.basicAddr = basicAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", tel=" + tel
				+ ", post=" + post + ", basicAddr=" + basicAddr + ", detailAddr=" + detailAddr + ", regDate=" + regDate
				+ "]";
	}
	
	
	
	

	
	
	
}
