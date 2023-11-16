package com.yedamMiddle.admin.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;

public class RemoveProductControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String prno = req.getParameter("prno");
		AdminService svc = new AdminServiceImpl();
		
		if(svc.removeProduct(Integer.parseInt(prno))) {
			try {
				resp.sendRedirect("productList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("getProduct.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
