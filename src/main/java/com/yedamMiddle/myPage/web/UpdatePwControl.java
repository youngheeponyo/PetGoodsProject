package com.yedamMiddle.myPage.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.login.service.Pwsha256;
import com.yedamMiddle.myPage.service.MyPageService;
import com.yedamMiddle.myPage.serviceImpl.MyPageServiceImpl;

public class UpdatePwControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		String encryPassword = Pwsha256.encrypt(upw);
		String newPw = req.getParameter("newPw");
		String encryNew = Pwsha256.encrypt(newPw);
		
		MyPageService svc = new MyPageServiceImpl();
		
		String result = "";
		if(svc.updatePw(encryNew, uid, encryPassword)) {
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
