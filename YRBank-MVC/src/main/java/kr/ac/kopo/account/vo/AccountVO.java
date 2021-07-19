package kr.ac.kopo.account.vo;

public class AccountVO {
	
	private String accountNo;
	private String accountPwd;
	private String accountOwner;
	private String bankCode;
	private String accountNickName;
	private String openAccDate; //계좌 개설일
	private int balance;
//	private String userId;
	
	
	public AccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public AccountVO(String accountNo, String accountPwd, String accountOwner, String bankCode, String accountNickName,
			String openAccDate, int balance) {
		super();
		this.accountNo = accountNo;
		this.accountPwd = accountPwd;
		this.accountOwner = accountOwner;
		this.bankCode = bankCode;
		this.accountNickName = accountNickName;
		this.openAccDate = openAccDate;
		this.balance = balance;
	}


	public String getAccountNo() {
		return accountNo;
	}


	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}


	public String getAccountPwd() {
		return accountPwd;
	}


	public void setAccountPwd(String accountPwd) {
		this.accountPwd = accountPwd;
	}


	public String getAccountOwner() {
		return accountOwner;
	}


	public void setAccountOwner(String accountOwner) {
		this.accountOwner = accountOwner;
	}


	public String getBankCode() {
		return bankCode;
	}


	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}


	public String getAccountNickName() {
		return accountNickName;
	}


	public void setAccountNickName(String accountNickName) {
		this.accountNickName = accountNickName;
	}


	public String getOpenAccDate() {
		return openAccDate;
	}


	public void setOpenAccDate(String openAccDate) {
		this.openAccDate = openAccDate;
	}


	public int getBalance() {
		return balance;
	}


	public void setBalance(int balance) {
		this.balance = balance;
	}


	@Override
	public String toString() {
		return "AccountVO [accountNo=" + accountNo + ", accountPwd=" + accountPwd + ", accountOwner=" + accountOwner
				+ ", bankCode=" + bankCode + ", accountNickName=" + accountNickName + ", openAccDate=" + openAccDate
				+ ", balance=" + balance + "]";
	}
	

}
