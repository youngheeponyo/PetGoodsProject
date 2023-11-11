package com.yedamMiddle.common;

import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.login.web.AddUserControl;
import com.yedamMiddle.login.web.AddUserFormControl;
import com.yedamMiddle.login.web.DelUserControl;
import com.yedamMiddle.login.web.LoginControl;
import com.yedamMiddle.login.web.LoginFormControl;
import com.yedamMiddle.login.web.LogoutControl;


public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, Command> commandByURL = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		// map에 command추가할 때 옆에 기능 주석적어주세요.
		
		// 김은별
		
		// 김준성
		
		// 서영희
		//회원가입
		commandByURL.put("/addUserForm.do", new AddUserFormControl());
		commandByURL.put("/addUser.do", new AddUserControl());
		//로그인
		commandByURL.put("/loginForm.do", new LoginFormControl());
		commandByURL.put("/login.do", new LoginControl());
		//로그아웃
		commandByURL.put("/logout.do", new LogoutControl());
		//회원탈퇴
		commandByURL.put("/delUser.do", new DelUserControl());
		
		// 전민교
		commandByURL.put("/main.do", new MainPageControl());
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
