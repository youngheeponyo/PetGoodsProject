package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class LoginControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uid = req.getParameter("userId");
		String upw = req.getParameter("userPw");
		
		LoginService svc = new LoginServiceImpl();
		UserVO vo = svc.loginUser(uid, upw);
		if(svc.loginUser(uid, upw)!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("uid", uid);
			session.setAttribute("upw", upw);
			session.setAttribute("permission", vo.getUserPermission());
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
