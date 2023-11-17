package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
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
		
		String[] selectProductNo = req.getParameterValues("pno");
		if(selectProductNo == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		int[] selProductNo = Stream.of(selectProductNo).mapToInt(Integer::parseInt).toArray();
		
		ProductService pSvc = new ProductServiceImpl();
		LoginService lsvc = new LoginServiceImpl();
		MyCartService svc = new MyCartServiceImpl();
		
		// 여기서 흠ㅋㅋ 재고확인해서 유효검사 한번하깅 ㅎㅎ
		
		int userNo = (Integer)req.getSession().getAttribute("uno");
		UserVO userVO = lsvc.getUserInfo(userNo);
		
		List<CartJoinVO> list = svc.getCartFromPayment(userNo,selProductNo);
		if(list == null || list.size() <= 0) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		int allAmount = 0;
		for(CartJoinVO vo : list) {
			allAmount += vo.getSelCnt();
		}
		
		int sumPrice = 0;
		for(CartJoinVO vo : list) {
			int totalPrice = vo.getProductPrice() * vo.getSelCnt(); 
			sumPrice += totalPrice;
		}
		
		if(sumPrice < 30000) {
			sumPrice += 2500; // 배송비..
			req.setAttribute("addrFee", "1");		
		}
		
		req.setAttribute("cartList", list);
		req.setAttribute("sumPrice", sumPrice);
		req.setAttribute("userInfo", userVO);
		req.setAttribute("allAmount", allAmount);
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
