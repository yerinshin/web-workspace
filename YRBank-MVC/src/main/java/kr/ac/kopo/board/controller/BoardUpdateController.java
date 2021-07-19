package kr.ac.kopo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.controller.Controller;

public class BoardUpdateController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//int boardNo = Integer.parseInt(request.getParameter("no"));
		HttpSession session = request.getSession();
		BoardVO board= (BoardVO)session.getAttribute("board");
		session.removeAttribute("board");		//session에서 지우고
			
		request.setAttribute("board", board);	//request에 등록
		
		
		return "/board/boardUpdate.jsp";
	}

}
