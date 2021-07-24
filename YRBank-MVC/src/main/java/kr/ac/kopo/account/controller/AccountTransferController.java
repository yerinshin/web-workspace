package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;

public class AccountTransferController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String myAccNo = request.getParameter("accountNo");

		request.setAttribute("myAccNo", myAccNo);
		return "/account/accountTransfer.jsp";
	}

}
