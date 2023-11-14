package com.yedamMiddle.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.service.CartJoinVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class TestCartFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		HttpSession session = req.getSession();
		Object userNoObj = session.getAttribute("uno");
		if(userNoObj == null) {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		
		ProductService svc = new ProductServiceImpl();
		int userNo = (Integer)req.getSession().getAttribute("uno");
		
		List<CartJoinVO> list = svc.getCartList(userNo);
		req.setAttribute("cartList", list);
		
		String path = "payment/testCartForm.tiles";
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
