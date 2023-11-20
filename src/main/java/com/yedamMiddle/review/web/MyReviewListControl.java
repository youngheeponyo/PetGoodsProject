package com.yedamMiddle.review.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;

public class MyReviewListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path="review/myReviewList.tiles";
		HttpSession session = req.getSession();
		ReviewService rvc = new ReviewServiceImpl();
		
		int uno = (int) session.getAttribute("uno");
		List<ReviewVO> list= rvc.selectMyReview(uno);
		req.setAttribute("list", list);
		System.out.println("uno =" + uno);
		System.out.println("list =" + list);
		
		
		
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
