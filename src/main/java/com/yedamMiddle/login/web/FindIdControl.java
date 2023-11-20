package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class FindIdControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String name = req.getParameter("nickname");
		String phone = req.getParameter("phone");
		LoginService svc = new LoginServiceImpl();
		UserVO vo = svc.findId(name, phone);
		
		req.setAttribute("ivo", vo);
		
		String path = "login/find.tiles";
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
