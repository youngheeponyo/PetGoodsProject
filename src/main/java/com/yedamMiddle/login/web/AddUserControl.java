package com.yedamMiddle.login.web;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
		
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		String nick = req.getParameter("nick");
		String ubirth = req.getParameter("ubirth");
		String mail = req.getParameter("mail");
		String phone = req.getParameter("phone");
		
		
		vo.setUserId(uid);
		vo.setUserPw(upw);
		vo.setNickName(nick);
		try {
			vo.setUserBirth(sdf.parse(ubirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vo.setUserMail(mail);
		vo.setUserPhone(phone);
		
		if(svc.addUser(vo)) {
				try {
					resp.sendRedirect("login.do");
				} catch (IOException e) {
					e.printStackTrace();
				}
		}else {
			System.out.println("회원가입 실패");
			try {
				resp.sendRedirect("addUser.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

	}

}
