package com.yedamMiddle.myPage.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.service.Pwsha256;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class UpdateInfoFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "myPage/updateInfo.tiles";
		String uid = req.getParameter("uid");
		
		LoginService svc = new LoginServiceImpl();
		UserVO vo = svc.userInfo(uid);

		req.setAttribute("vo",vo);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}

}
