package com.yedamMiddle.cart.web;



import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class MyCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "cart/myCart.tiles";
		
		String uno = req.getParameter("uno");
		
//		
//		MyCartService svc = new MyCartServiceImpl();
//		MyCartVO vo = svc.myCartList(Integer.parseInt(uno));
//		req.setAttribute("uno", vo);
//		System.out.println(vo);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}

}
