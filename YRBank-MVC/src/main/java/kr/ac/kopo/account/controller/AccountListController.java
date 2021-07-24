package kr.ac.kopo.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class AccountListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String userId = ((MemberVO)session.getAttribute("loginMember")).getId();
		
		//System.out.println(userId);
		
		 AccountDAO dao = new AccountDAO(); 
		 List<AccountVO> accountList = dao.selectAll(userId);
		
		 request.setAttribute("accountList", accountList);
		 
		return "/account/accountList.jsp";
	}

}
