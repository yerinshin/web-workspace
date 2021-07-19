package kr.ac.kopo.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.util.ConnectionFactory;

public class LoginDAO {
	
	/**
	 * 사용자가 입력한 ID, PASSWORD로 로그인 여부 판단
	 * @return 해당 LoginVO 객체
	 * @param loginVO 로그인시 입력한 id, password를 포함
	 */
	
	public LoginVO login(LoginVO loginVO) {
		
		LoginVO userVO = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, type ");
		sql.append(" from t_member ");
		sql.append(" where id = ? and password = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userVO = new LoginVO();
				userVO.setId(rs.getString("id"));
				userVO.setName(rs.getString("name"));
				userVO.setType(rs.getString("type"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return userVO;
	}
}
