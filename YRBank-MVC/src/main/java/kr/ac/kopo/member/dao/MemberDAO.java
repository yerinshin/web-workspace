package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {
	
	public void signUp(MemberVO member) {
			
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member_tbl(id, password, name, ss1, ss2, email, tel) ");
			sql.append(" values(?,?,?,?,?,?,?) ");
			
			try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
				int cnt = 1;
				pstmt.setString(cnt++, member.getId());
				pstmt.setString(cnt++, member.getPassword());
				pstmt.setString(cnt++, member.getName());
				pstmt.setString(cnt++, member.getSs1());
				pstmt.setString(cnt++, member.getSs2());
				pstmt.setString(cnt++, member.getEmail());
				pstmt.setString(cnt++, member.getTel());
		
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	public MemberVO login(MemberVO member) {
		
		MemberVO loginMember = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append(" from member_tbl ");
		sql.append(" where id = ? and password = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginMember = new MemberVO();
				loginMember.setId(rs.getString("id"));
				loginMember.setPassword(rs.getString("password"));
				loginMember.setName(rs.getString("name"));
				loginMember.setSs1(rs.getString("ss1"));
				loginMember.setSs2(rs.getString("ss2"));
				loginMember.setEmail(rs.getString("email"));
				loginMember.setTel(rs.getString("tel"));
				loginMember.setLastOpenAccDate(rs.getString("last_open_acc_date"));
				loginMember.setType(rs.getString("type"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return loginMember;
	}
	
	public MemberVO selectByEmail(String email) {
		MemberVO member = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append(" from member_tbl ");
		sql.append(" where email = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, email);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setSs1(rs.getString("ss1"));
				member.setSs2(rs.getString("ss2"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				member.setLastOpenAccDate(rs.getString("last_open_acc_date"));
				member.setType(rs.getString("type"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}
	
}
