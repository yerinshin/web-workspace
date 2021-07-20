package kr.ac.kopo.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.util.ConnectionFactory;

public class AccountDAO {
	
	public void openAccount(AccountVO account, String userId) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into account_tbl(account_no, account_pwd, account_owner, balance, account_nickname, user_id) ");
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
			sql.append(" select account_no, account_nickname, balance ");
			sql.append("  from account_tbl ");
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
					account.setAccountNo(rs.getString("account_no"));
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
		sql.append("select * from account_tbl ");
		sql.append(" where account_no = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, accountNo);
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				account = new AccountVO();
				account.setAccountNo(rs.getString("account_no"));
				account.setAccountNickName(rs.getString("account_nickname"));
				account.setBalance(rs.getInt("balance"));
				account.setOpenAccDate(rs.getString("open_acc_date"));	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return account;
}
	
}
