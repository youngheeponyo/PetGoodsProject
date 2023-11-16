package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;

public class AddUserFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		//카카오 아이디
		String kId = req.getParameter("kId");
		String kPw = req.getParameter("kPw");
		req.setAttribute("kId", kId);
		req.setAttribute("kPw", kPw);
		// 회원가입 페이지
		String path = "login/addUser.tiles";
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
