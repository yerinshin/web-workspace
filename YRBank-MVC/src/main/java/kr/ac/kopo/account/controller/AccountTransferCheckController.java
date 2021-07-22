package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;

public class AccountTransferCheckController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String othersBankCode = request.getParameter("bankCode");
		String othersAccNo = request.getParameter("accountNo");
		int transMoney = Integer.parseInt(request.getParameter("transMoney"));
		
		AccountVO othersAccount = new AccountVO();
		othersAccount.setBankCode(othersBankCode);
		othersAccount.setAccountNo(othersAccNo);
//되게이상함 balance아님
		othersAccount.setBalance(transMoney);
		
		HttpSession session = request.getSession();
		session.setAttribute("othersAccount", othersAccount);
		
		return "/account/accountTransferCheck.jsp";
	}

}
