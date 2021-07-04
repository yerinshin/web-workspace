package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
// http://localhost:9999/Lecture-web/servlet/table?row=4&col=3 요청 시
	
	-------------------------------------
	| cell(0,0) | cell(0,1) | cell(0,2) |
	-------------------------------------
	| cell(1,0) | cell(1,1) | cell(1,2) |
	-------------------------------------
	| cell(2,0) | cell(2,1) | cell(2,2) |
	-------------------------------------
	| cell(3,0) | cell(3,1) | cell(3,2) |
	-------------------------------------
	
//http://localhost:9998/Lecture-Web/servlet/table 요청시
   5 x 5 테이블 생성
   
//http://localhost:9998/Lecture-Web/servlet/table?row=2 요청시
   2 x 5 테이블 생성 
  
*/

@WebServlet("/servlet/tableExam")
public class TableServlet extends HttpServlet {
	

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	
		
		int row = 5;
		int col = 5;
		
		String rowStr = request.getParameter("row");
		String colStr = request.getParameter("col");
		if(rowStr != null)
			row = Integer.parseInt(rowStr);
		col = colStr == null ? 5 : Integer.parseInt(colStr);
		
		response.setContentType("text=html; charset=utf-8");
		PrintWriter out = response.getWriter();
		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<title>테이블 생성</title>");
		sb.append("<style>");
		sb.append("	td { ");
		sb.append("		padding : 0 10px;");
		sb.append(" } ");
		sb.append("</style>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("		<table border='1'>");
		for(int i =0; i <row; i ++) {
			sb.append(" <tr>");
			for(int j =0 ; j < col; j ++) {
				sb.append("<td>");
				sb.append("cell( " + i + "," + j + ")");
				sb.append("</td>");
			}
			sb.append("    </ tr>");
		}
	
		
		sb.append(" </table>");
		sb.append("</body>");
		sb.append("</html>");
		
		out.println(sb.toString());
		out.flush();
		out.close();
		
		
	/*
		 String row = request.getParameter("row"); 
		 int colNum = 5;
		 int rowNum = 0;
		 
		 if(row != null) {
			 rowNum = Integer.parseInt(row);
		 } else {
			 rowNum = 5;
		 }
		 String cell = null;
		  
		  response.setContentType("text/html; charset=utf-8"); 
		  PrintWriter out = response.getWriter(); 
		  out.println("<html>"); 
		  out.println("	<head>");
		  out.println("		<title>메소드 호출방식</title>"); out.println("	</head>");
		  out.println("	<body>");
		  out.println("--------------------------------------------------------<br>");
		  
		  for(int j = 0; j<rowNum; j++) { 
			  	out.println("  | ");
			  for(int i = 0; i < colNum; i++) { 
				  cell = "cell(" + j + "," + i + ")";
				  out.println(cell);
				  out.println(" |");
			  } 
			  out.println("<br>");
			  out.println("--------------------------------------------------------<br>");
		 } 
		  
		 
		  out.flush();
		  out.close();
	 */
			
	}
}
