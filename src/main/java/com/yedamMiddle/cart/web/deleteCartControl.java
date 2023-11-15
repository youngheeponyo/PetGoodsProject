package com.yedamMiddle.cart.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class deleteCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uno = req.getParameter("uno");
		String[] pno = req.getParameterValues("pno");
		
		MyCartService svc = new MyCartServiceImpl();

	}

}
