package com.yedamMiddle.review.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;

public class deleteReviewControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String reviewNo = req.getParameter("reviewNo");
		System.out.println("deleteReviewControl reviewNo : "+ reviewNo);
		ReviewVO reviewVo = new ReviewVO();
		reviewVo.setReviewNo(Integer.parseInt(reviewNo));
		ReviewService svc = new ReviewServiceImpl();

		int deleteCheck = svc.deleteReview(reviewVo);
		
		if(deleteCheck == 1) {
			try {
				resp.sendRedirect("myReviewDetailForm.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

	}

}
