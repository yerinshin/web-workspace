package kr.ac.kopo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.controller.Controller;

public class BoardWriteProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//title,writer,content
		
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		
		BoardDAO dao = new BoardDAO();
		
		//게시물 번호 추출
		int boardNo = dao.selectNo();
		
		BoardVO board = new BoardVO();
		board.setNo(boardNo);
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		
		System.out.println(board);
		
		dao.insert(board);
		
		return "redirect:/board/boardList.do";
	}

}
