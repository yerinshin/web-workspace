package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class AccountDeleteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		//session에서 로그인 회원 정보가져오기
			HttpSession session = request.getSession();
			MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
			String userSs1 = loginMember.getSs1();
			String userSs2 = loginMember.getSs2();
			
			request.setCharacterEncoding("utf-8");
			// parameter로 계좌 정보가져오기
			String accountNo = request.getParameter("accountNo");
			String accountPwd = request.getParameter("accountPwd");
			String ss1 = request.getParameter("ss1");
			String ss2 = request.getParameter("ss2");
			
			
			String msg="";
			String url = "";
			if(userSs1.equals(ss1) && userSs2.equals(ss2)) {
				
				AccountVO account = new AccountVO();
				account.setAccountNo(accountNo);
				account.setAccountPwd(accountPwd);
				
				AccountDAO dao = new AccountDAO();
				dao.deleteAccount(account);
				
				url = "redirect:/account/accountList.do";
			} else {
				msg="주민등록번호가 일치하지 않습니다.";
				url="redirect:/account/accountDeleteCheck.do";
			}
			
			
			
		return url;
	}

}
