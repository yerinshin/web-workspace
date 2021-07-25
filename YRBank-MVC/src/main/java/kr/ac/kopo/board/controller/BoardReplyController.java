package kr.ac.kopo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.controller.Controller;

public class BoardReplyController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int parentBoardNo = Integer.parseInt(request.getParameter("no"));
		
		request.setAttribute("parentBoardNo", parentBoardNo);
		BoardDAO dao = new BoardDAO();
		BoardVO parentBoard = dao.selectByNo(parentBoardNo);
		
		request.setAttribute("parentBoard", parentBoard);
		
		return "/board/boardReply.jsp";
	}

}
