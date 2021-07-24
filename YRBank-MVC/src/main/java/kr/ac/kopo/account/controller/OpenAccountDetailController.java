package kr.ac.kopo.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.account.vo.TransactionHistoryVO;
import kr.ac.kopo.controller.Controller;

public class OpenAccountDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String accountNo = request.getParameter("accountNo");
		System.out.println(accountNo);
		String bankCode = accountNo.substring(0, 3);
		
		AccountDAO dao = new AccountDAO();
		AccountVO account = new AccountVO();
		account = dao. selectOpenBankAccDetail(bankCode, accountNo);
		
		System.out.println(account);
		request.setAttribute("account", account);
		
		
		//거래내역
		List<TransactionHistoryVO> transHistoryList = dao.selectOpenBankTransHistory(bankCode, accountNo);
		System.out.println(transHistoryList);
		request.setAttribute("transHistoryList", transHistoryList);
		
		/*
		switch(bankCode) {
		case "111" :
			account = dao.selectByJHBankAccNo(accountNo);
			break;

		case "032" :
			account = dao.selectBySWBankAccNo(accountNo);
			break;
			
		case "094" :
			account = dao.selectBySJBankAccNo(accountNo);
			break;
		
		}
	*/

		
		return "/account/accountDetail.jsp";
	}

}
