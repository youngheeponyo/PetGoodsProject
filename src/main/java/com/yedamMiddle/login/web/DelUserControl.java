package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.service.Pwsha256;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class DelUserControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=utf-8");
		
		String uid = req.getParameter("userId");
		String upw = req.getParameter("userPw");
		String encryPassword = Pwsha256.encrypt(upw);
		
		LoginService svc = new LoginServiceImpl();
		if(svc.deleteUser(uid, encryPassword)) {
			try {
				resp.sendRedirect("logout.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("delUserForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
