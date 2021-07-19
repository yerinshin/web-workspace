package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.login.LoginDAO;
import kr.ac.kopo.login.LoginVO;

public class LoginProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);
		loginVO.setPassword(password);
		
		LoginDAO dao = new LoginDAO();
		LoginVO userVO = dao.login(loginVO);
		
		String msg = "";
		String url = "";
		if(userVO == null ) {
			//로그인 실패
			msg = "아이디 또는 패스워드를 잘못입력하셨습니다";
			url = "redirect:/login.do";
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
		} else {
			//로그인 성공
			url = "redirect:/";
			
			//jsp파일은 내부적으로 servlet으로 변환되기 때문에 내장객체 9개 자동 가지고 있음. 
			//그래서 session사용 가능, 그러나 controller는 그냥 java file -> session 모름
			//! request로부터 session객체를 얻어와야함 !
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
			
		//request.setAttribute("msg", msg);
		//request.setAttribute("url", url);
		
		return url;
	}
	
/*
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);
		loginVO.setPassword(password);
		
		LoginDAO dao = new LoginDAO();
		LoginVO userVO = dao.login(loginVO);
		
		String msg = "";
		String url = "";
		if(userVO == null ) {
			//로그인 실패
			msg = "아이디 또는 패스워드를 잘못입력하셨습니다";
			url = request.getContextPath() + "/login.do";
		} else {
			//로그인 성공
			msg = "로그인을 성공하였습니다";
			url = request.getContextPath();
			
			//jsp파일은 내부적으로 servlet으로 변환되기 때문에 내장객체 9개 자동 가지고 있음. 
			//그래서 session사용 가능, 그러나 controller는 그냥 java file -> session 모름
			//! request로부터 session객체를 얻어와야함 !
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
		}
			
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "login/loginProcess.jsp";
	}
*/

}
