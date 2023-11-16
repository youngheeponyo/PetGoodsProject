package com.yedamMiddle.cart.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class deleteOneControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uno = req.getParameter("uno");
		String pno = req.getParameter("pno");
		
		MyCartService svc = new MyCartServiceImpl();
		MyCartVO vo = new MyCartVO();
		
		vo.setMemberNo(Integer.parseInt(uno));
		vo.setProductNo(Integer.parseInt(pno));
		
		if(svc.deleteOne(vo)) {
			try {
				req.getRequestDispatcher("myCart.do?uno="+uno).forward(req, resp);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}

}
