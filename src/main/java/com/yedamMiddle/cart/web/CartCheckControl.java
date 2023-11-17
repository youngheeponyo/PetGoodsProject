package com.yedamMiddle.cart.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class CartCheckControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String pno = req.getParameter("pno");
		String uno = req.getParameter("uno"); 
		
		MyCartService svc = new MyCartServiceImpl();
		String result = "";
		if(svc.cartCheck(Integer.parseInt(pno), Integer.parseInt(uno))!=null) {
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
