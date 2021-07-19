package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		// forward			--일반적
	//	return "/login/logout.jsp";		
	
		//redirect			--unique하게 표시
		return "redirect:/";			//"redirect:/index.jsp"랑 똑같
	}

}
