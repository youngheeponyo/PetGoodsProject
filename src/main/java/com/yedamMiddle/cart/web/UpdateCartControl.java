package com.yedamMiddle.cart.web;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class UpdateCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String cnt = req.getParameter("cnt");
		String uno = req.getParameter("uno"); 
		String pno = req.getParameter("pno");
		
		MyCartService svc = new MyCartServiceImpl();

		String result = "";
		if(svc.update(Integer.parseInt(cnt),Integer.parseInt(pno), Integer.parseInt(uno))) {
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
