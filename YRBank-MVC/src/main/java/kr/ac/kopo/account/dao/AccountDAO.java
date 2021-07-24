package kr.ac.kopo.account.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.account.vo.TransferInfoVO;
import kr.ac.kopo.util.ConnectionFactory;

public class AccountDAO {
	
	public void openAccount(AccountVO account, String userId) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_account(accountno, account_pwd, account_owner, balance, account_nickname, user_id) ");
		sql.append(" values(?,?,?,?,?,?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			System.out.println("dao");
			int cnt = 1;
			pstmt.setString(cnt++, account.getAccountNo());
			pstmt.setString(cnt++, account.getAccountPwd());
			pstmt.setString(cnt++, account.getAccountOwner());
			pstmt.setInt(cnt++, account.getBalance());
			pstmt.setString(cnt++, account.getAccountNickName());
			pstmt.setString(cnt++, userId);
	
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public List<AccountVO> selectAll(String userId) {
		List<AccountVO> accountList = new ArrayList<>();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" select accountNo, account_nickname, balance ");
			sql.append("  from t_account ");
			sql.append("  where user_id = ? ");
			sql.append(" order by open_acc_date desc ");
			
			try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
				pstmt.setString(1, userId);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					AccountVO account = new AccountVO();
					account.setAccountNo(rs.getString("accountNo"));
					account.setAccountNickName(rs.getString("account_nickname"));
					account.setBalance(rs.getInt("balance"));
					accountList.add(account);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return accountList;
		}
	
	public AccountVO selectByAccountNo(String accountNo) {
		
		AccountVO account = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * from t_account ");
		sql.append(" where accountNo = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, accountNo);
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				account = new AccountVO();
				account.setAccountNo(rs.getString("accountNo"));
				account.setAccountNickName(rs.getString("account_nickname"));
				account.setBalance(rs.getInt("balance"));
				account.setOpenAccDate(rs.getString("open_acc_date"));	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return account;
}
	
	public void deleteAccount(AccountVO account) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" delete from t_account ");
		sql.append(" where accountNo = ? and account_pwd = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, account.getAccountNo());
			pstmt.setString(2, account.getAccountPwd());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	//----------------------------------------------------------------------------
	//------------------------ Transaction(Transfer)관련 dao ----------------------
	//----------------------------------------------------------------------------

	public int accountTransfer(TransferInfoVO transInfo) {
	
		
		StringBuilder sql = new StringBuilder();
		
		//상대방계좌번호, 거래금액, 상대계좌은행,상대계좌예금주, 내계좌번호(보내는) 오류출력변수
		sql.append(" {call exec_transfer(?, ?, ?, ?, ?, ?)} ");
		
		int result =0;
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
		//	CallableStatement sPstmt = conn.prepareCall(sSql.toString());
		//	CallableStatement rPstmt = conn.prepareCall(rSql.toString());
				
			CallableStatement cstmt = conn.prepareCall(sql.toString());
			){	
			
			int cnt = 1;
			cstmt.setString(cnt++, transInfo.getOthersAccNo());
			cstmt.setInt(cnt++, transInfo.getTransMoney());
			cstmt.setString(cnt++, transInfo.getOthersBankName());
			cstmt.setString(cnt++, transInfo.getOtherAccOwner());
			cstmt.setString(cnt++, transInfo.getMyAccNo());
			cstmt.registerOutParameter(cnt, java.sql.Types.INTEGER);
			
			cstmt.executeUpdate();
			
			result = cstmt.getInt(cnt);
			//3이면 성공
			System.out.println(result);
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public AccountVO transAccountCheck(String othersBankCode, String othersAccNo) {
		
		AccountVO account = null;
		
		Map<String, String> sqlMap = new HashMap<>();

		String JHBankSQL = "select accountNo, name as account_owner  from t_account@jh_bank_link where accountNo = ? ";
		String SWBankSQL = "select accountNo, holder as account_owner from t_account@sw_bank_link where accountNo = ? ";
		String SJBankSQL = "select t.accountno as accountNo, b.name as account_owner from banking_login@sj_bank_link b , t_account@sj_bank_link t where b.banking_id = t.banking_id ";
		
		sqlMap.put("111", JHBankSQL);
		sqlMap.put("032", SWBankSQL);
		sqlMap.put("094", SJBankSQL);
		
		StringBuilder sql = new StringBuilder();
		sql.append(sqlMap.get(othersBankCode));
		System.out.println(sql);
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, othersAccNo);
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				account = new AccountVO();
				account.setAccountNo(rs.getString("accountNo"));
				account.setAccountOwner(rs.getString("account_owner"));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return account;
		
		
	}
	
	public List<TransactionHistoryVO> selectTransHistory(String accountNo) {
		
		List<TransactionHistoryVO> transHistoryList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select to_char(transaction_date,'mm/dd hh:mi') as trans_date, others_name, ");
		sql.append("  	trans_money, balance from transaction_history ");
		sql.append(" where my_acc_no = ? ");
		sql.append(" order by transaction_date desc ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, accountNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				TransactionHistoryVO transHistory = new TransactionHistoryVO();
				transHistory.setTransDate(rs.getString("trans_date"));
				transHistory.setOthersName(rs.getString("others_name"));
				transHistory.setTransMoney(rs.getInt("trans_money"));
				transHistory.setBalance(rs.getInt("balance"));
				transHistoryList.add(transHistory);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return transHistoryList;
	}
	
	//---------------------------------------------------------------------
	//---------------------------- 통합계좌관련 dao --------------------------
	//---------------------------------------------------------------------
	
	public List<AccountVO> selectAllJHBankAcc(String userTel) {
		List<AccountVO> JHBankAccList = new ArrayList<>();
			//select b.accounNo from t_member a, t_account b where a.id = b.id and a.tel = '본인전화번호';
			
			Map<String, String> sqlMap = new HashMap<>();
			
			
		//	sqlMap.put("111", " select b.accountNo, alias , balance from t_member@jh_bank_link a, t_account@jh_bank_link b and a.tel = ? ");
			
			StringBuilder sql = new StringBuilder();
			sql.append(" select b.accountNo, alias , balance ");
			sql.append("  from t_member@jh_bank_link a, t_account@jh_bank_link b ");
			sql.append("  where a.id = b.id ");
			sql.append(" and a.tel = ? ");
			
			try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
				pstmt.setString(1, userTel);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					//타행계좌
					AccountVO account = new AccountVO();
					account.setAccountNo(rs.getString("accountNo"));
					account.setAccountNickName(rs.getString("alias"));
					account.setBalance(rs.getInt("balance"));
					JHBankAccList.add(account);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return JHBankAccList;
		}
	
	public List<AccountVO> selectAllSWBankAcc(String userTel) {
		
		List<AccountVO> SWBankAccList = new ArrayList<>();
	
		/*
		 * select t.accountno, t.password, t.holder, t.balance, t.account_nickname,
		 * t.reg_date, t.id from account_member@sw_bank_link m , t_account@sw_bank_link
		 * t where m.id = t.id and m.phone = '01047520453' ;
		 */
		
			StringBuilder sql = new StringBuilder();
			sql.append(" select accountno, account_nickname, balance ");
			sql.append(" from account_member@sw_bank_link m , t_account@sw_bank_link t ");
			sql.append("  where m.id = t.id ");
			sql.append(" and m.phone = ? ");
			
			try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
				pstmt.setString(1, userTel);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					//타행계좌
					AccountVO account = new AccountVO();
					account.setAccountNo(rs.getString("accountNo"));
					account.setAccountNickName(rs.getString("account_nickname"));
					account.setBalance(rs.getInt("balance"));
					SWBankAccList.add(account);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return SWBankAccList;
		}
	
	public List<AccountVO> selectAllSJBankAcc(String userTel) {
			
			List<AccountVO> SJBankAccList = new ArrayList<>();
			
				StringBuilder sql = new StringBuilder();
	
				sql.append(" select accountno from t_account@sj_bank_link ");
				sql.append(" where banking_id = ? ");
				
			//	System.out.println(sql);
				
				try(
						Connection conn = new ConnectionFactory().getConnection();
						PreparedStatement pstmt = conn.prepareStatement(sql.toString());
					) {
						pstmt.setString(1, "yryr");
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()) {
					//		System.out.println("dDD");
							
							//타행계좌
							AccountVO account = new AccountVO();
							account.setAccountNo(rs.getString("accountno"));
							/*
							 * account.setAccountNickName(rs.getString("alias"));
							 * account.setBalance(rs.getInt("balance"));
							 */
							SJBankAccList.add(account);
							System.out.println(SJBankAccList);
						}
					
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				return SJBankAccList;
			}
	
	public AccountVO selectOpenBankAccDetail(String bankCode ,String accountNo) {
		
		AccountVO account = null;
		
		Map<String, String> sqlMap = new HashMap<>();
		
		String JHBankSQL = "select accountNo as accountNo, alias as account_nickname , balance, opendate as open_acc_date from t_account@jh_bank_link where accountNo = ? ";
		String SWBankSQL = "select accountno as accountNo, account_nickname, balance, reg_date as open_acc_date from t_account@sw_bank_link where accountNo= ? ";
		String SJBankSQL = "select accountNo as accountNo, alias as account_nickname, balance, reg_date as open_acc_date from t_account@sj_bank_link where accountNo= ? ";
		
		sqlMap.put("111", JHBankSQL);
		sqlMap.put("032", SWBankSQL);
		sqlMap.put("094", SJBankSQL);
		
		
		StringBuilder sql = new StringBuilder();
		sql.append(sqlMap.get(bankCode));
		System.out.println(sql);

		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, accountNo);
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				account = new AccountVO();
				account.setAccountNo(rs.getString("accountNo"));
				account.setAccountNickName(rs.getString("account_nickname"));
				account.setBalance(rs.getInt("balance"));
				account.setOpenAccDate(rs.getString("open_acc_date"));
				System.out.println(account);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return account;
	}
	
public List<TransactionHistoryVO> selectOpenBankTransHistory(String bankCode, String accountNo) {
				
		List<TransactionHistoryVO> transHistoryList = new ArrayList<>();
		
		Map<String, String> sqlMap = new HashMap<>();

		String JHBankSQL = "select to_char(transDate, 'mm/dd hh:mi') as trans_date, mydesc as others_name, amount as trans_money, balance from t_statement@jh_bank_link where accountNo = ? ";
		String SWBankSQL = "select to_char(tran_date, 'mm/dd hh:mi') as trans_date, tran_type as others_name, tran_amount as trans_money, tran_mybalance as balance from transaction_history@sw_bank_link where tran_myaccount = ? ";
		String SJBankSQL = "select to_char(trans_date, 'mm/dd hh:mi') as trans_date, to_name as others_name, amount as trans_money, my_balance as balance from transaction_details@sj_bank_link where my_account_no = ? ";
		
		sqlMap.put("111", JHBankSQL);
		sqlMap.put("032", SWBankSQL);
		sqlMap.put("094", SJBankSQL);
		
		StringBuilder sql = new StringBuilder();
		sql.append(sqlMap.get(bankCode));
		System.out.println(sql);


		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, accountNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				TransactionHistoryVO transHistory = new TransactionHistoryVO();
				transHistory.setTransDate(rs.getString("trans_date"));
				transHistory.setOthersName(rs.getString("others_name"));
				transHistory.setTransMoney(rs.getInt("trans_money"));
				transHistory.setBalance(rs.getInt("balance"));
				transHistoryList.add(transHistory);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return transHistoryList;
	}
	
}
