package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.account.vo.TransferInfoVO;
import kr.ac.kopo.controller.Controller;

public class AccountTransferCheckController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String myAccNo = request.getParameter("myAccNo");
		String myName = request.getParameter("myName");
		String othersBankCode = request.getParameter("bankCode");
		String othersAccNo = request.getParameter("accountNo");
		int transMoney = Integer.parseInt(request.getParameter("transMoney"));
		
		
		AccountDAO dao = new AccountDAO();
		AccountVO account = dao.transAccountCheck(othersBankCode, othersAccNo);
		
		
		String url ="";
		if(account != null) {
			
			TransferInfoVO transInfo = new TransferInfoVO();
			transInfo.setMyAccNo(myAccNo);
			transInfo.setMyName(myName);
			transInfo.setOthersAccNo(othersAccNo);
			transInfo.setOthersBankCode(othersBankCode);
			transInfo.setTransMoney(transMoney);
			transInfo.setOtherAccOwner(account.getAccountOwner());
			
			String bankName = "";
			switch(othersBankCode) {
			case "016" :
				bankName = "YR뱅크";
				break;
			case "111" :
				bankName = "JH뱅크";
				break;
			case "094" :
				bankName = "SJ뱅크";
				break;
			case "032" :
				bankName = "SW뱅크";
				break;
			}
			
			transInfo.setOthersBankName(bankName);
			System.out.println(transInfo);
			
			HttpSession session = request.getSession();
			session.setAttribute("transInfo", transInfo);
			
			url = "/account/accountTransferCheck.jsp";
			
			
		}else {
			String msg = "일치하는 계좌정보가 없습니다.";
			request.setAttribute("msg", msg);
			url = "/account/accountTransfer.jsp";
		}
		
		return url;
	}

}
