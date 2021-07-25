package kr.ac.kopo.board.vo;

public class BoardVO {
	
	private int rowNum;		//rowNum 뒤집음
	private int no;			//게시글번호
	private String title;
	private String password;
	private String writer;
	private String content;
	private int viewCnt;
	private String regDate;
	private int level;
	private int groupNo;
	private int parentNo;
	
	public BoardVO() {
	}

	public BoardVO(int rowNum, int no, String title, String password, String writer, String content, int viewCnt,
			String regDate, int level, int groupNo, int parentNo) {
		super();
		this.rowNum = rowNum;
		this.no = no;
		this.title = title;
		this.password = password;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
		this.level = level;
		this.groupNo = groupNo;
		this.parentNo = parentNo;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	@Override
	public String toString() {
		return "BoardVO [rowNum=" + rowNum + ", no=" + no + ", title=" + title + ", password=" + password + ", writer="
				+ writer + ", content=" + content + ", viewCnt=" + viewCnt + ", regDate=" + regDate + ", level=" + level
				+ ", groupNo=" + groupNo + ", parentNo=" + parentNo + "]";
	}

	
}