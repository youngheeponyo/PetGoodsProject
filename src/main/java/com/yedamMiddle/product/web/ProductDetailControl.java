package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CartJoinVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;
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
		
		String cno = req.getParameter("cno");
		String type = req.getParameter("type");
		
		List<ProductVO> clist = null;
		if(cno != null) {
			clist = svc.categoryList(Integer.parseInt(cno),Integer.parseInt(pno),type);
		}
		else {
			clist = svc.categoryList(vo.getCategoryNo(), Integer.parseInt(pno), type);
		}
			
		req.setAttribute("clist", clist);
		//리뷰자료
		ReviewService rvc = new ReviewServiceImpl();
		List<ReviewVO> Rlist = rvc.selectProductReview(Integer.parseInt(pno));
		req.setAttribute("Rlist", Rlist);

		
		MyCartService csv = new MyCartServiceImpl();
		HttpSession session = req.getSession();
		Object userNo = session.getAttribute("uno");
		
		if(userNo==null) {
			System.out.println("null임"+userNo);
		}else {
			int uNo = (Integer)userNo;
			List<CartJoinVO> cl = csv.getCart(uNo);
			session.setAttribute("cl", cl);
			MyCartVO mvo = csv.cntInCart(Integer.parseInt(pno), uNo);
			req.setAttribute("mvo", mvo);

		}
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
