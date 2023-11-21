package com.yedamMiddle.myPage.web;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.myPage.service.MyPageService;
import com.yedamMiddle.myPage.serviceImpl.MyPageServiceImpl;

public class UpdateInfoControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		UserVO vo = new UserVO();
		MyPageService svc = new MyPageServiceImpl();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String uid = req.getParameter("uid");
		String ubirth = req.getParameter("ubirth");
		String mail = req.getParameter("mail");
		String phone = req.getParameter("phone");
		String addr = req.getParameter("addr");
		String detailAddr = req.getParameter("addr_detail");
		
		
		vo.setUserId(uid);
		try {
			vo.setUserBirth(sdf.parse(ubirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vo.setUserMail(mail);
		vo.setUserPhone(phone);
		vo.setUserAddr(addr+" "+detailAddr);
		
		String result = "";
		if(svc.updateUser(vo)) {
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
