package kr.ac.kopo.board;
/*
 * 자바빈즈 클래스
 * 1. package 포함
 * 2. 클래스의 접근제한자 public
 * 3. 멤버변수의 접근제한자 private
 * 4. getter/setter 포함
 * 5. 디폴트 생성자 선언
 */
public class BoardVO {
	
	private int no;
	private String title;
	private String writer;
	private String regDate;
	
	public BoardVO() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
