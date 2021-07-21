package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class KakaoLoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String kakaoEmail = request.getParameter("email");
		System.out.println(kakaoEmail);
		
		MemberVO member = new MemberVO();
		MemberDAO dao = new MemberDAO();
		member = dao.selectByEmail(kakaoEmail);
		System.out.println(member);
		String url="";
		if( member == null ) {
			//가입한 이메일이 없으면
			//msg ="가입되지 않은 계정입니다."
			request.setAttribute("kakaoEmail", kakaoEmail);
			url = "/member/signUp.do";
		} else {
			url = "redirect:/";
			//System.out.println(member);
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);
		
		}
		
		return url;
	}

}
