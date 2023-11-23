package com.yedamMiddle.admin.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;

public class AdminDeleteReviewControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));
		AdminService svc = new AdminServiceImpl();
		
		if(svc.removeReview(reviewNo)) {
			try {
				resp.sendRedirect("adminPage.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("adminPage.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
