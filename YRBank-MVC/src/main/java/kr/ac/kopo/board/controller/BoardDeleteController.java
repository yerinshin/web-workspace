package kr.ac.kopo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.controller.Controller;

public class BoardDeleteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int boardNo = Integer.parseInt(request.getParameter("no"));
		
		BoardDAO dao = new BoardDAO();
		dao.delete(boardNo);
		
		//삭제되었습니다.
		
		return "redirect:/board/boardList.do";
	}

}
