package com.yedamMiddle.admin.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;

public class AddMainCategoryControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String mainCate = req.getParameter("mainCategory");
		AdminService svc = new AdminServiceImpl();
		
		if(svc.addMainCate(mainCate)) {
			try {
				resp.sendRedirect("categoryManage.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
