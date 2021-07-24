package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.TransferInfoVO;
import kr.ac.kopo.controller.Controller;

public class AccountTransferProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		TransferInfoVO transInfo = (TransferInfoVO)session.getAttribute("transInfo");
		session.removeAttribute("transInfo");
		
		
		AccountDAO dao = new AccountDAO();
		int result = dao.accountTransfer(transInfo);
		
		if(result == 3) {
			System.out.println(result);
		}
		
		return "redirect:/account/accountList.do";
	}

}
