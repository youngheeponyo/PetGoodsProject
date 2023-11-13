package com.yedamMiddle.userQna.web;


import java.util.List;

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
