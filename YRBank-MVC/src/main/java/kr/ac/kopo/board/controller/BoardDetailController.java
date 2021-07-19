package kr.ac.kopo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.controller.Controller;

public class BoardDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int boardNo = Integer.parseInt(request.getParameter("no"));
			
		/*
		 * HttpSession session = request.getSession(); String msg =
		 * (String)session.getAttribute("msg"); if( msg != null ) {
		 * session.removeAttribute("msg"); //session에서 지우고 request.setAttribute("msg",
		 * msg); }
		 */
			
			BoardDAO dao = new BoardDAO();
			
			dao.addViewCnt(boardNo);
			
			BoardVO board = dao.selectByNo(boardNo);
		//	System.out.println(board);
			
			HttpSession session = request.getSession();
			session.setAttribute("board", board);
			
			
			return "/board/boardDetail.jsp";
	}

}
