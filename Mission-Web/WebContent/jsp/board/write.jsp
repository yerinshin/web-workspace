<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.login.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	작업순서
	1. 파라미터(제목, 작성자, 내용) 추출
	2. 추출된 데이터를 DB(t_board)에 삽입
	3. 목록페이지 이동
--%>
<%
	request.setCharacterEncoding("utf-8");
	
	//실제 저장 위치
	String saveDirectory = "C:/Users/HP/Desktop/java/web-workspace/Mission-Web/WebContent/upload";
	//서버가 보는 위치 : "C:/Users/HP/Desktop/java/eclipse-work/wtpwebapps/Mission-Web/upload"
	// deploy 한다면 무조건 밑의 경로로 설정해야함
	
	MultipartRequest multiRequest = new MultipartRequest(
																request,
																saveDirectory,
																1024 * 1024 * 3,
																"utf-8",
																new KopoFileNamePolicy()
									);	
	
	// 1. 게시글 저장(t_board)
	String title = multiRequest.getParameter("title");
	String writer = multiRequest.getParameter("writer");
	String content = multiRequest.getParameter("content");
	
	BoardDAO dao = new BoardDAO();
	//게시물 번호 추출
	int boardNo = dao.selectNo();
	
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setNo(boardNo);
	
	dao.insert(board);
	
	//2. 첨부파일 저장 (t_board_file)
	Enumeration files = multiRequest.getFileNames();
	
	while(files.hasMoreElements()){
		String fileName = (String)files.nextElement();
		File f = multiRequest.getFile(fileName);
		
		if(f != null) {	 //파일이 있는 만큼만 실행
			String fileOriName = multiRequest.getOriginalFileName(fileName);
			String fileSaveName = multiRequest.getFilesystemName(fileName);
			int fileSize = (int)f.length();			//파일.length()의 return형 : long 
			
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			fileVO.setBoardNo(boardNo);
			
			dao.insertFile(fileVO);
			
			System.out.println(fileOriName + " : " + fileSaveName);
		}
	}
	

%>
<script>
	alert("새 글 등록이 완료되었습니다.")
	location.href = "list.jsp"
</script>