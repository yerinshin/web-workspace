package kr.ac.kopo.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class HelloServlet extends HttpServlet{
	//init(), destroy()는 없어도 되지만 service()는 필수로 있어야함
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() : 최초 한번만 실행되는 메소드입니다.");
	}
	
	
}
