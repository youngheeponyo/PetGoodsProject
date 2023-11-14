package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CartJoinVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class PaymentFormControl implements Command {

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
		
		LoginService lsvc = new LoginServiceImpl();
		ProductService svc = new ProductServiceImpl();
		int userNo = (Integer)req.getSession().getAttribute("uno");
		UserVO userVO = lsvc.getUserInfo(userNo);
		
		List<CartJoinVO> list = svc.getCartList(userNo);
		if(list == null || list.size() <= 0) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		int sumPrice = 0;
		for(CartJoinVO vo : list) {
			int totalPrice = vo.getProductPrice() * vo.getSelCnt(); 
			sumPrice += totalPrice;
		}
		req.setAttribute("cartList", list);
		req.setAttribute("sumPrice", sumPrice);
		req.setAttribute("userInfo", userVO);
		try {
			req.getRequestDispatcher("payment/paymentForm.tiles").forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
