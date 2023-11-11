package com.yedamMiddle.login.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class AddUserControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		UserVO vo = new UserVO();
		LoginService svc = new LoginServiceImpl();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		vo.setUserId(req.getParameter("uid"));
		vo.setUserPw(req.getParameter("upw"));
		vo.setNickName(req.getParameter("nick"));
		try {
			vo.setUserBirth(sdf.parse(req.getParameter("ubirth")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vo.setUserMail(req.getParameter("mail"));
		vo.setUserPhone(req.getParameter("phone"));
		
		if(svc.addUser(vo)) {
			try {
				resp.getWriter().print("{\"retCode\":\"OK\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.getWriter().print("{\"retCode\":\"NG\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
