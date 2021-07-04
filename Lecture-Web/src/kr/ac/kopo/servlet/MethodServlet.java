package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet{
	
	// GET http://localhost:9999/Lecture-Web/method?id=aaa
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String id = request.getParameter("id");			//name이 id인 input의 value값
		String method = request.getMethod();
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		
		// client에게 응답
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();			//getWriter() return타입: PrintWriter
		out.println("<html>");
		out.println("	<head>");
		out.println("		<title>메소드 호출방식</title>");
		out.println("	</head>");
		out.println("	<body>");
		out.println("===============================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;요 청 결 과<br>");
		out.println("===============================================<br>");
		out.println("파라미터(id) : " + id + "<br>");
		out.println("요청방식 : " + method + "<br>");
		out.println("요청 uri : " + uri + "<br>");
		out.println("===============================================<br>");
		out.println("	</body>");
		out.println("</html>");
		
		out.flush();
		out.close();
		
		/*
		System.out.println("id : " + id);
		System.out.println("method : " + method);
		
		System.out.println("url : " + url.toString());
		System.out.println("uri : " + uri);
		*/
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String method = request.getMethod();
		String uri = request.getRequestURI();
		String id = request.getParameter("id");
		
		
//		System.out.println("method : " + method);
//		System.out.println("uri : " + uri);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>메소드 호출방식 - POST</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("=====================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;출 력 결 과<br>");
		out.println("=====================================<br>");
		out.println("요청 URI : " + uri + "<br>");
		out.println("요청 메소드 : " + method + "<br>");
		out.println("파라미터(id) : " + id + "<br>");
		out.println("=====================================<br>");
		out.println("</body>");
		out.println("</html>");
		
		out.flush();
		out.close();
	}
}
