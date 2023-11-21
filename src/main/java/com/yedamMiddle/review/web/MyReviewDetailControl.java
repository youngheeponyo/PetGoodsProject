package com.yedamMiddle.review.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;

public class MyReviewDetailControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path="review/myReviewDetail.tiles";
		ReviewService svc = new ReviewServiceImpl();
		String reviewNo = req.getParameter("rNo");
//		System.out.println("reviewNo ="+reviewNo);
		ReviewVO reviewVo = svc.selectDetailReview(Integer.parseInt(reviewNo));
		req.setAttribute("reviewVo", reviewVo);
		System.out.println("reviewVo=" + reviewVo);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
