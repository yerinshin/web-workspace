package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.BoardDAO;
import kr.ac.kopo.board.BoardVO;

public class BoardListController implements Controller {
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.selectAll();
		
		//list 를 list.jsp에서 보여줘야 하기 때문에 공유영역에 올려줘야함
		//한번 요청에서 응답올 때까지 공유하기 위한 공유영역 : request
		request.setAttribute("list", list);
		
		return "/board/list.jsp";
	}

}
