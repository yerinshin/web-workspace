package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPassword(password);
		
		MemberDAO dao = new MemberDAO();
		MemberVO loginMember = dao.login(member);
		
		String msg = "";
		String url = "";
		if(loginMember == null) {
			//로그인 실패
			msg = "아이디 또는 패스워드를 잘못입력하셨습니다";
			url = "redirect:/member/login.do";
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
		} else {
			//로그인 성공
			url = "redirect:/";
			//System.out.println(loginMember);
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
		}
		
		return url;
	}

}
