package kr.ac.kopo.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	
	//t_board의 sequence 추출
	public int selectNo() {
		
		int no = 0;
		StringBuilder sql = new StringBuilder();
		sql.append(" select seq_t_board_no.nextval from dual ");
		
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
		
		sql.append("insert into t_board(no, title, writer, content) ");
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
		
		List<BoardVO> list = new ArrayList<>();
		
		// 데이터베이스 t_board 테이블에서 해당 게시물 조회
		StringBuilder sql = new StringBuilder();
		sql.append(" select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("  from t_board ");
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
				
				board.setRegDate(regDate);
				
				list.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public BoardVO selectOne(int boardNo) {
		
		BoardVO board = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt ");
		sql.append("      , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append(" from t_board ");
		sql.append(" where no = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			
			/*
			rs.next();		//rs가 추출한 하나의 행을 가리킴
			
			int no 			= rs.getInt("no");
			String title	= rs.getString("title");
			String writer 	= rs.getString("writer");
			String content 	= rs.getString("content");
			int viewCnt		= rs.getInt("view_cnt");
			String regDate = rs.getString("reg_date");
			
			board = new BoardVO(no, title, writer, content, viewCnt, regDate);
			*/
			
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
		
		sql.append(" update t_board ");
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
		sql.append(" delete from t_board ");
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
		sql.append(" update t_board ");
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
	
	/////////////////////////////////////////////////////////////////////////////
	////						t_board_file 테이블의 CRUD
	/////////////////////////////////////////////////////////////////////////////
	public void insertFile(BoardFileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into t_board_file(no, board_no, file_ori_name ");
		sql.append("   , file_save_name, file_size) ");
		sql.append(" values(seq_t_board_file_no.nextval, ?, ?, ?, ?) ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			int loc = 1;
			pstmt.setInt(loc++, fileVO.getBoardNo());
			pstmt.setString(loc++, fileVO.getFileOriName());
			pstmt.setString(loc++, fileVO.getFileSaveName());
			pstmt.setInt(loc++, fileVO.getFileSize());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardFileVO> selectFileByNo(int boardNo) {
		
		List<BoardFileVO> fileList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, file_ori_name, file_save_name, file_size ");
		sql.append(" from t_board_file ");
		sql.append(" where board_no= ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
				pstmt.setInt(1, boardNo);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardFileVO fileVO = new BoardFileVO();
					fileVO.setNo(rs.getInt("no"));
					fileVO.setFileOriName(rs.getString("file_ori_name"));
					fileVO.setFileSaveName(rs.getString("file_save_name"));
					fileVO.setFileSize(rs.getInt("file_size"));
					
					fileList.add(fileVO);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return fileList;
		
	}
}
