package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	
	//t_board의 sequence 추출
	public int selectNo() {
		
		int no = 0;
		StringBuilder sql = new StringBuilder();
		sql.append(" select qna_no_seq.nextval from dual ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				no = rs.getInt(1);	//첫번째 컬럼
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return no;
	}

	public void insert(BoardVO board) {
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("insert into qna_tbl(no, title, writer, content) ");
		sql.append(" values(?, ?, ?, ?) ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());	
		){	
			int loc = 1;
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardVO> selectAll() {
	List<BoardVO> boardList = new ArrayList<>();
		
		// 데이터베이스 t_board 테이블에서 해당 게시물 조회
		StringBuilder sql = new StringBuilder();
		sql.append(" select no, title, writer, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("  from qna_tbl ");
		sql.append("  order by no desc ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no 			= rs.getInt("no");
				String title 	= rs.getString("title");
				String writer 	= rs.getString("writer");
				String regDate 	= rs. getString("reg_date");
				
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setViewCnt(rs.getInt("view_cnt"));
				board.setRegDate(regDate);
				
				boardList.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	
	
	public BoardVO selectByNo(int boardNo) {
		
			BoardVO board = null;
			
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt ");
			sql.append("      , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
			sql.append(" from qna_tbl ");
			sql.append(" where no = ? ");
			
			try(
					Connection conn = new ConnectionFactory().getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
				pstmt.setInt(1, boardNo);
				ResultSet rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
					board = new BoardVO();
					board.setNo(rs.getInt("no"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setWriter(rs.getString("writer"));
					board.setViewCnt(rs.getInt("view_cnt"));
					board.setRegDate(rs.getString("reg_date"));	
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return board;
	}
	
	public void update(BoardVO board) {
		
		StringBuilder sql = new StringBuilder();
		
		sql.append(" update qna_tbl ");
		sql.append("  set title= ?, content = ? ");
		sql.append(" where no= ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void delete(int boardNo) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" delete from qna_tbl ");
		sql.append(" where no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addViewCnt(int boardNo) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" update qna_tbl ");
		sql.append("   set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());	
		) {
			
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
