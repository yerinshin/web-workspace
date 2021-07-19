package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {
	
	public void insert(MemberVO member) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_member(id, name, password, email_id, email_domain ");
		sql.append("	, tel1, tel2, tel3, post, basic_addr, detail_addr) ");
		sql.append(" values(?,?,?,?,?,?,?,?,?,?,?)");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			String[] email = member.getEmail().split("@");
			String[] tel = member.getTel().split("-");
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, email[0]);
			pstmt.setString(5, email[1]);
			pstmt.setString(6, tel[0]);
			pstmt.setString(7, tel[1]);
			pstmt.setString(8, tel[2]);
			pstmt.setString(9, member.getPost());
			pstmt.setString(10, member.getBasicAddr());
			pstmt.setString(11, member.getDetailAddr());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberVO> selectAll(){
		
		List<MemberVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, name, email_id, email_domain, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append(" from t_member "); 
		sql.append(" order by reg_date desc ");
			
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String id = rs.getString("id");
				String name = rs.getString("name");
				String email = rs.getString("email_id")+"@"+rs.getString("email_domain");
				String regDate = rs.getString("reg_date");
				
				MemberVO member = new MemberVO();
				member.setId(id);
				member.setName(name);
				member.setEmail(email);
				member.setRegDate(regDate);
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

}
