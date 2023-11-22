package com.yedamMiddle.myPage.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class MyInfoControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "myPage/myInfo.tiles";
		
		HttpSession session = req.getSession();
		Object userId = session.getAttribute("uid");
		String uid = (String)userId;
		LoginService svc = new LoginServiceImpl();
		UserVO vo = svc.userInfo(uid);
		
		if(vo!=null) {
			req.setAttribute("vo", vo);
		}else {
			try {
				resp.getWriter().print("<script>alert('다시 시도해주세요')</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
