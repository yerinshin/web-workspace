package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;

public class AccountTransferController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String myAccNo = request.getParameter("accountNo");
		
		HttpSession session = request.getSession();
		session.setAttribute("myAccNo", myAccNo);
		//request.setAttribute("accountNo", accountNo);
		return "/account/accountTransfer.jsp";
	}

}
