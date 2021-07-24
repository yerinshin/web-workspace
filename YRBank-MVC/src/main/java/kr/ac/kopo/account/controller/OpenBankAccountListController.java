package kr.ac.kopo.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class OpenBankAccountListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		HttpSession session = request.getSession();
		String userTel = ((MemberVO)session.getAttribute("loginMember")).getTel();
		//System.out.println(userTel);
		
		 AccountDAO dao = new AccountDAO(); 
		 
		 List<AccountVO> JHAccountList = dao.selectAllJHBankAcc(userTel);
		 System.out.println(JHAccountList);
		
		 List<AccountVO> SWAccountList = dao.selectAllSWBankAcc(userTel);
		 System.out.println(SWAccountList);
		 	  
		 List<AccountVO> SJAccountList = dao.selectAllSJBankAcc(userTel);
		 System.out.println(SJAccountList);
			 

		 request.setAttribute("JHAccountList", JHAccountList);
		 request.setAttribute("SWAccountList", SWAccountList);
	     request.setAttribute("SJAccountList", SJAccountList);
			
		
		return "/account/openBankAccountList.jsp";
	}

}
