package com.yedamMiddle.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, Command> commandByURL = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		// map에 command추가할 때 옆에 기능 주석적어주세요.
		
		// 김은별
		
		// 김준성
		
		// 서영희
		
		// 전민교
	}
	
	//끼양
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String reqURL = uri.substring(contextPath.length());
		Command cmd = commandByURL.get(reqURL);
		if(cmd != null) {
			cmd.execute(req, resp);
		}
		else {
			// 에러
			System.out.println("없음");
		}
	}
}
