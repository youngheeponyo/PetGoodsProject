package com.yedamMiddle.product.web;

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
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class ProductDetailControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "product/productDetail.tiles";
		
		String pno = req.getParameter("pno");
		
		ProductService svc = new ProductServiceImpl();
		ProductVO vo = svc.productDetail(Integer.parseInt(pno));
		req.setAttribute("pno", vo);
		
		
		UserQnaService usc = new UserQnaServiceImpl();
		List<UserQnaVO> qlist = usc.userQnaAllList();
		req.setAttribute("qlist", qlist);
		
		List<ProductVO> list = svc.productList();
		req.setAttribute("list", list);
		
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
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
