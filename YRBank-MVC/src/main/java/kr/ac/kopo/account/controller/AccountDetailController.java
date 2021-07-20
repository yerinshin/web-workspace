package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;

public class AccountDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String accountNo = request.getParameter("accountNo");
		
		AccountDAO dao = new AccountDAO();
		AccountVO account = dao.selectByAccountNo(accountNo);
		
	//	System.out.println(account);
		request.setAttribute("account", account);
		
		return "/account/accountDetail.jsp";
	}

}
