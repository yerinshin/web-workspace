package kr.ac.kopo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.controller.Controller;

public class BoardUpdateProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardVO board = new BoardVO();
		board.setNo(boardNo);
		board.setTitle(title);
		board.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		dao.update(board);
		
		
		/*
		 * String msg= Integer.toString(boardNo) + "번 게시물이 수정되었습니다.";
		 * request.setAttribute("msg", msg);
		 */
		
		
		return "redirect:/board/boardDetail.do?no="+boardNo;
	}

}
