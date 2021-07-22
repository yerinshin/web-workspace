package kr.ac.kopo.account.vo;

public class TransactionHistoryVO {
	
	private String transHistoryNo;
	private String transCode;
	private String myAccNo;
	private String othersAccNo;
	private String othersName;
	private String othersBankName;
	private int transMoney;
	private int balance;
	private String transDate;
	
	public TransactionHistoryVO() {

	}

	public TransactionHistoryVO(String transHistoryNo, String transCode, String myAccNo, String othersAccNo,
			String othersName, String othersBankName, int transMoney, int balance, String transDate) {
		super();
		this.transHistoryNo = transHistoryNo;
		this.transCode = transCode;
		this.myAccNo = myAccNo;
		this.othersAccNo = othersAccNo;
		this.othersName = othersName;
		this.othersBankName = othersBankName;
		this.transMoney = transMoney;
		this.balance = balance;
		this.transDate = transDate;
	}

	public String getTransHistoryNo() {
		return transHistoryNo;
	}

	public void setTransHistoryNo(String transHistoryNo) {
		this.transHistoryNo = transHistoryNo;
	}

	public String getTransCode() {
		return transCode;
	}

	public void setTransCode(String transCode) {
		this.transCode = transCode;
	}

	public String getMyAccNo() {
		return myAccNo;
	}

	public void setMyAccNo(String myAccNo) {
		this.myAccNo = myAccNo;
	}

	public String getOthersAccNo() {
		return othersAccNo;
	}

	public void setOthersAccNo(String othersAccNo) {
		this.othersAccNo = othersAccNo;
	}

	public String getOthersName() {
		return othersName;
	}

	public void setOthersName(String othersName) {
		this.othersName = othersName;
	}

	public String getOthersBankName() {
		return othersBankName;
	}

	public void setOthersBankName(String othersBankName) {
		this.othersBankName = othersBankName;
	}

	public int getTransMoney() {
		return transMoney;
	}

	public void setTransMoney(int transMoney) {
		this.transMoney = transMoney;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getTransDate() {
		return transDate;
	}

	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}

	@Override
	public String toString() {
		return "TransactionHistory [transHistoryNo=" + transHistoryNo + ", transCode=" + transCode + ", myAccNo="
				+ myAccNo + ", othersAccNo=" + othersAccNo + ", othersName=" + othersName + ", othersBankName="
				+ othersBankName + ", transMoney=" + transMoney + ", balance=" + balance + ", transDate=" + transDate
				+ "]";
	}
	
	
}
