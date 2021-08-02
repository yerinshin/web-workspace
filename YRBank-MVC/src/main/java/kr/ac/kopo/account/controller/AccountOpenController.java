package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class AccountOpenController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		String sex = loginMember.getSs2().substring(0, 1);
		
		request.setAttribute("sex", sex);
		
		
		
		return "/account/accountOpen.jsp";
	}

}
