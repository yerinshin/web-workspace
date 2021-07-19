package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.controller.Controller;

public class BoardListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO dao = new BoardDAO();
		List<BoardVO> boardList = dao.selectAll();
		
		//한번 요청에서 응답올 때까지 공유하기 위한 공유영역 : request
		request.setAttribute("boardList", boardList);
				
		return "/board/boardList.jsp";
	}

}
