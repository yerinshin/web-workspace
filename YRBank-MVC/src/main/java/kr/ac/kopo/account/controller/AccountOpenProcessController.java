package kr.ac.kopo.account.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;

public class AccountOpenProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Random r = new Random();
		int num = r.nextInt(899999999) + 100000001;
		
		// 016 : YR Bank의 은행코드
		String accountNo = "016" + Integer.toString(num);
		
		//accountVO의 파라미터 받아오기
		request.setCharacterEncoding("utf-8");
		String accountOwner = request.getParameter("accountOwner");
		String accountPwd = request.getParameter("accountPwd1");
		String accountNickName = request.getParameter("accountNickName");
		int balance = Integer.parseInt(request.getParameter("balance"));
		
		String userId = request.getParameter("userId");
		
		
		AccountVO account = new AccountVO();
		account.setAccountNo(accountNo);
		account.setAccountOwner(accountOwner);
		account.setAccountPwd(accountPwd);
		account.setAccountNickName(accountNickName);
		account.setBalance(balance);
		
		
		System.out.println(account);
		System.out.println(userId);
		
		AccountDAO dao = new AccountDAO();
		dao.openAccount(account, userId);
		
		return "/";
	}

}
