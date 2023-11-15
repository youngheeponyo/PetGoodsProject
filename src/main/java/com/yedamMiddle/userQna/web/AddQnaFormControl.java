package com.yedamMiddle.userQna.web;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class AddQnaFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		//AddQnaControl에서 등록할때 시간으로 넣어주기
//		LocalDateTime now = LocalDateTime.now();
//		String fomatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm"));
//		System.out.println(fomatedNow);

		UserQnaService svc = new UserQnaServiceImpl();
		int maxQnaNO = svc.getMaxQnaNo();
		req.setAttribute("maxQnaNO", maxQnaNO);
		
		HttpSession session = req.getSession();
		//로그인되어있는지 확인
		if(session.getAttribute("uno") == null) {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				
				req.getRequestDispatcher("userQna/addQnaForm.tiles").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
	}

}
