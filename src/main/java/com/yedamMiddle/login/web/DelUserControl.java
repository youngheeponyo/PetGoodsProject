package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class DelUserControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/html; charset=utf-8");
		
		String uid = req.getParameter("userId");
		String upw = req.getParameter("userPw");
		
		LoginService svc = new LoginServiceImpl();
		if(svc.deleteUser(uid, upw)) {
			try {
				resp.getWriter().print("<script>alert('탈퇴되었습니다!')</script>");
				resp.sendRedirect("logout.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.getWriter().print("<script>alert('아이디나 비밀번호가 다릅니다')</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
