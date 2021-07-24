package kr.ac.kopo.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.controller.Controller;

public class AccountDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String accountNo = request.getParameter("accountNo");
		
		AccountDAO dao = new AccountDAO();
		AccountVO account = dao.selectByAccountNo(accountNo);	
	//	System.out.println(account);
		request.setAttribute("account", account);
	
		
		List<TransactionHistoryVO> transHistoryList = dao.selectTransHistory(accountNo);
	//	System.out.println(transHistoryList);
		request.setAttribute("transHistoryList", transHistoryList);
		
		return "/account/accountDetail.jsp";
	}

}
