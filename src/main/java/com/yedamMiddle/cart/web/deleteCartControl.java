package com.yedamMiddle.cart.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class deleteCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String pno = req.getParameter("pno");
		String uno = req.getParameter("uno");
		
		MyCartService svc = new MyCartServiceImpl();
		
		if(svc.delCart(Integer.parseInt(pno), Integer.parseInt(uno))) {
				try {
					req.getRequestDispatcher("myCart.do?uno="+uno).forward(req, resp);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
		}
		
	}

}
