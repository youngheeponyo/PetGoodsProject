package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class IdCheckControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uid = req.getParameter("uid");
		LoginService svc= new LoginServiceImpl();
		
		String result = "";
		if(svc.idCheck(uid) != null) {
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
