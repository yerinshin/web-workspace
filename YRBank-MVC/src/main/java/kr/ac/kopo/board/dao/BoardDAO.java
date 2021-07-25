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
/*
	public void insert(BoardVO board) {
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("insert into qna_tbl(no, title, writer, content, board_parent) ");
		sql.append(" values(?, ?, ?, ? ) ");
		
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
*/	
	public void insert(BoardVO board) {
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("insert into qna_tbl(no, title, writer, content, group_no, parent_no) ");
		sql.append(" values(?, ?, ?, ?, ?, ? ) ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());	
			){	
			
			int boardNo = board.getNo();
			int groupNo = board.getGroupNo();
			int parentNo = board.getParentNo();
		
			System.out.println(parentNo);
			if(parentNo == 0) groupNo = boardNo; 
			
			int loc = 1;
			pstmt.setInt(loc++, boardNo);
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());
			pstmt.setInt(loc++, groupNo);
			pstmt.setInt(loc++, parentNo);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardVO> selectAll() {
	List<BoardVO> boardList = new ArrayList<>();

	
		// 데이터베이스 t_board 테이블에서 해당 게시물 조회
		StringBuilder sql = new StringBuilder();
		
		
		sql.append(" select ROW_NUMBER() OVER (ORDER BY ROWNUM DESC) as rowNumber, board.* ");
		sql.append("  from (select level, no , title, content, ");
		sql.append(" 			 writer, to_char(reg_date, 'yy/mm/dd hh:mi') as reg_date, view_cnt, group_no, parent_no ");
		sql.append(" 		from qna_tbl ");
		sql.append(" 		start with parent_no = 0 ");
		sql.append(" 		connect by prior no = parent_no ");
		sql.append(" 		order siblings by REG_DATE desc) BOARD ");
		sql.append(" order by rowNumber desc ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			
				
				BoardVO board = new BoardVO();
				board.setRowNum(rs.getInt("rowNumber"));
				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWriter(rs.getString("writer"));
				board.setLevel(rs.getInt("level"));
				board.setRegDate(rs. getString("reg_date"));
				board.setViewCnt(rs.getInt("view_cnt"));
				board.setGroupNo(rs.getInt("group_no"));
				board.setParentNo(rs.getInt("parent_no"));
				
				boardList.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	
	/*
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
	*/
	public BoardVO selectByNo(int boardNo) {
		
		BoardVO board = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt ");
		sql.append("      , to_char(reg_date, 'yyyy-mm-dd') as reg_date, group_no, parent_no ");
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
				board.setGroupNo(rs.getInt("group_no"));
				board.setParentNo(rs.getInt("parent_no"));
				
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
