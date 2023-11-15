package com.yedamMiddle.cart.web;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class updateCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String cnt = req.getParameter("cnt");
		
		MyCartVO vo = new MyCartVO();
		vo.setSelectCnt(Integer.parseInt(cnt));

		MyCartService svc = new MyCartServiceImpl();
		
		if(svc.modCart(vo)) {
			try {
				req.getRequestDispatcher("updateCartForm.do").forward(req, resp);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
	}
		
	}

}
