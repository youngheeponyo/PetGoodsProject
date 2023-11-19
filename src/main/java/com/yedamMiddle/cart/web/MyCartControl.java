package com.yedamMiddle.cart.web;


import java.io.IOException;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		System.out.println(list);
		
		HttpSession session = req.getSession();
		Object userNo = session.getAttribute("uno");
		System.out.println(userNo==null);	//로그인을 안하면 null이 뜨고 로그인을 하면 false가 뜬다
		if(userNo==null) {
			System.out.println("null임"+userNo);
		}else {
			int uNo = (Integer)userNo;
			MyCartService csv = new MyCartServiceImpl();
			List<CartJoinVO> cl = csv.getCart(uNo);
			session.setAttribute("cl", cl);
		}

		try {
			req.getRequestDispatcher("cart/myCart.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
