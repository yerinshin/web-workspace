package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class SignUpProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//id, password1, password2, name, ss1, ss2, email, tel
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password1");
		//String password2 = request.getParameter("password2");
		String name = request.getParameter("name");
		String ss1 = request.getParameter("ss1");
		String ss2 = request.getParameter("ss2");
		String email = request.getParameter("email");
		String tel =  request.getParameter("tel");
		
	
		MemberVO member = new MemberVO(id, password, name, ss1, ss2, email, tel);
		//System.out.println(member);
		
		MemberDAO dao = new MemberDAO();
		dao.signUp(member);
		
		/*
		String password = null;
		if(password1.equals(password2)) {
			password = password1;
		}
		
		String msg = "";
		String url = "";
		if(password == null) {
			//비밀번호 불일치
			msg = "비밀번호가 서로 일치하지 않습니다";
			url = "redirect:/member/signUp.do";
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
		} else {
			//회원가입 성공
			url = "redirect:/member/login.do";
		}
		
		*/
		
		return "redirect:/member/login.do";
	}

}
