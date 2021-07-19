package kr.ac.kopo;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

}
