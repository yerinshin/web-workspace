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
	private HandlerMapping mappings;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String propLoc = config.getInitParameter("propertyLocation");
		
		//여기서 이미 properties의 key, value들 HandlerMapping의 Map객체에 put완료
		if(propLoc != null)
			mappings = new HandlerMapping(propLoc);
		else
			mappings = new HandlerMapping();
	}
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String context = request.getContextPath();
		
		String uri = request.getRequestURI();
		uri = uri.substring(context.length());
		
		try {
			Controller control = mappings.getController(uri);
			
			String callPage = control.handleRequest(request, response);
			
			if(callPage.startsWith("redirect:")) {
				callPage = callPage.substring("redirect:".length());
				response.sendRedirect(request.getContextPath() + callPage );
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}





















