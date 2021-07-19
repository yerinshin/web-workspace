package kr.ac.kopo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.HandlerMapping;

public class FrontControllerServlet extends HttpServlet {
	//  servlet lifeCycle : init - service - destroy
	
	private HandlerMapping mappings;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String propLoc = config.getInitParameter("propertyLocation");	//web.xml에 정의
		if(propLoc != null)
			mappings = new HandlerMapping(propLoc);		//한번만 만들고 요청이 들어오면 접근하여 사용
		else
			mappings = new HandlerMapping();
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String context = request.getContextPath();	//context : /Mission-Web-MVC01
		
		String uri = request.getRequestURI();		//frontControllerServlet으로 요청들어온 uri를 가져옴
		uri = uri.substring(context.length());
		
	//	System.out.println("요청 URI : " + uri); 	//요청 URI : /board/writeForm.do	
		
		try {
			Controller control = mappings.getController(uri);
			
			//request, response는 servlet만 알고있으므로 단순 .java파일인 BoardListController의 handleRequest 메소드에서도
			// request, response를 사용할 수 있도록 인자로 넘겨줌
				
			String callPage = control.handleRequest(request, response);		//forward시킬 주소값 알아오기
				
			
			if(callPage.startsWith("redirect:")) {
				//callPage = "redirect:index.jsp"
				callPage = callPage.substring("redirect:".length());
				response.sendRedirect(request.getContextPath() + callPage);
			
			} else {
				//<jsp:forward page="">		: 이건 jsp문법이라 사용 불가
				//servlet 에서 forward를 쓸수 있게 하는 메소드를 가진 객체 : RequestDispatcher
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);   //forward : 내가 요청받은 일을 callPage에게 떠넘기는 것
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
