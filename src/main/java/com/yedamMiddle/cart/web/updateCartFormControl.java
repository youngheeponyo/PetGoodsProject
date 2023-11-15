package com.yedamMiddle.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class updateCartFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "cart/myCart.tiles";
		
		String pno = req.getParameter("pno");
		String uno = req.getParameter("uno");
		
		MyCartService svc = new MyCartServiceImpl();
	}

}
