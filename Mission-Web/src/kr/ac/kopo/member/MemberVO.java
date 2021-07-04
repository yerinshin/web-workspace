package kr.ac.kopo.member;

public class MemberVO {
	
	private String id;
	private String password;
	private String name;
	private String email;
	private String tel;
	private String post;
	private String address;
	
	public String getPost() {
		return post;
	}


	public void setPost(String post) {
		this.post = post;
	}
	
	public MemberVO() {
	}


	public MemberVO(String id, String password, String name, String email, String tel, String post, String address) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.post = post;
		this.address = address;
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


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	
}
