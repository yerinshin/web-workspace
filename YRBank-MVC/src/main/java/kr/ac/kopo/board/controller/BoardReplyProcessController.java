package kr.ac.kopo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.controller.Controller;

public class BoardReplyProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String writer = request.getParameter("writer");
		int parentBoardNo = Integer.parseInt(request.getParameter("parentBoardNo"));
		String replyTitle = request.getParameter("title");
		String replyContent = request.getParameter("content");
		int boardGroupNo = Integer.parseInt(request.getParameter("groupNo"));
	
		System.out.println(parentBoardNo);
		
		BoardDAO dao = new BoardDAO();
		BoardVO replyBoard = new BoardVO();
		
		int boardNo = dao.selectNo();
		replyBoard.setNo(boardNo);
		replyBoard.setTitle(replyTitle);
		replyBoard.setContent(replyContent);
		replyBoard.setWriter(writer);
		replyBoard.setGroupNo(boardGroupNo);
		replyBoard.setParentNo(parentBoardNo);
		
		System.out.println(replyBoard);
		
		dao.insert(replyBoard);
		
		return "redirect:/board/boardList.do";
	}


}
