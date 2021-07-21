package kr.ac.kopo.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.util.ConnectionFactory;


//local DB : SCOTT, TIGER 에 연결
public class AccountDAO_2 {
	
	public void openAccount(AccountVO account, String userId) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_account(accountNo, account_pwd, account_owner, balance, account_nickname, user_id) ");
		sql.append(" values(?,?,?,?,?,?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
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
}
