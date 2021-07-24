package kr.ac.kopo.account.vo;

public class TransferInfoVO {
	
	private String myAccNo;
	private String myName;
	private int transMoney;
	private String othersAccNo;
	private String otherAccOwner;
	private String othersBankName;
	private String othersBankCode;
	
	public TransferInfoVO() {
		
	}

	public TransferInfoVO(String myAccNo, String myName, int transMoney, String othersAccNo, String otherAccOwner,
			String othersBankName, String othersBankCode) {
		super();
		this.myAccNo = myAccNo;
		this.myName = myName;
		this.transMoney = transMoney;
		this.othersAccNo = othersAccNo;
		this.otherAccOwner = otherAccOwner;
		this.othersBankName = othersBankName;
		this.othersBankCode = othersBankCode;
	}

	public String getMyAccNo() {
		return myAccNo;
	}

	public void setMyAccNo(String myAccNo) {
		this.myAccNo = myAccNo;
	}

	public String getMyName() {
		return myName;
	}

	public void setMyName(String myName) {
		this.myName = myName;
	}

	public int getTransMoney() {
		return transMoney;
	}

	public void setTransMoney(int transMoney) {
		this.transMoney = transMoney;
	}

	public String getOthersAccNo() {
		return othersAccNo;
	}

	public void setOthersAccNo(String othersAccNo) {
		this.othersAccNo = othersAccNo;
	}

	public String getOtherAccOwner() {
		return otherAccOwner;
	}

	public void setOtherAccOwner(String otherAccOwner) {
		this.otherAccOwner = otherAccOwner;
	}

	public String getOthersBankName() {
		return othersBankName;
	}

	public void setOthersBankName(String othersBankName) {
		this.othersBankName = othersBankName;
	}

	public String getOthersBankCode() {
		return othersBankCode;
	}

	public void setOthersBankCode(String othersBankCode) {
		this.othersBankCode = othersBankCode;
	}

	@Override
	public String toString() {
		return "TransferInfoVO [myAccNo=" + myAccNo + ", myName=" + myName + ", transMoney=" + transMoney
				+ ", othersAccNo=" + othersAccNo + ", otherAccOwner=" + otherAccOwner + ", othersBankName="
				+ othersBankName + ", othersBankCode=" + othersBankCode + "]";
	}

	
	
	

	
}
