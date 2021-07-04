package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PInfoServletHW extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); 
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String[] mail = new String[3];
		mail = request.getParameterValues("mail");
		String job = request.getParameter("job"); 
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		out.println("이름 : " + name + "<br>");
		out.println("아이디 : " + id + "<br>");
		out.println("암호 : " + pwd + "<br>");
		out.println("성별 : " + sex + "<br>");
		
		boolean boolNotice = false;
		boolean boolAd = false;
		boolean boolDel = false;
		
		if(Arrays.asList(mail).contains("notice")) boolNotice=true;
		if(Arrays.asList(mail).contains("ad")) boolAd = true;
		if(Arrays.asList(mail).contains("delivery")) boolDel=true;
			
		out.print("공지메일 : " );
		out.println(boolNotice == true ? "받음" : "받지않음");
		out.println("<br>광고메일 : " );
		out.println(boolAd == true ? "받음" : "받지않음");
		out.println("<br>배송 확인 메일 : ");
		out.println(boolDel == true ? "받음" : "받지않음");
		out.println("<br>직업 : " + job +"<br>");
		out.println("</body>");
		
		out.flush();
		out.close();
	}
	
	
}
