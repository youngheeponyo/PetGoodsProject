package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.service.Pwsha256;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class updatePwControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String upw = req.getParameter("upw");
		String uid = req.getParameter("uid");
		String encryPassword = Pwsha256.encrypt(upw);
		
		LoginService svc = new LoginServiceImpl();
		
		String result = "";
		if(svc.updatePw(encryPassword, uid)) {
			result = "{\"retCode\":\"OK\"}";
		}else {
			result = "{\"retCode\":\"NG\"}";
		}
		
		try {
			resp.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
