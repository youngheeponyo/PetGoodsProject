package com.yedamMiddle.cart.web;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CartJoinVO;

public class MyCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uno = req.getParameter("uno");
		MyCartService svc = new MyCartServiceImpl();
		List<CartJoinVO> list = svc.getCart(Integer.parseInt(uno));
		
		req.setAttribute("list", list);
		
		
		try {
			req.getRequestDispatcher("cart/myCart.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
