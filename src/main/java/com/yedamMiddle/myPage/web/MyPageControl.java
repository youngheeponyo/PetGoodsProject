package com.yedamMiddle.myPage.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.myPage.service.MyPageService;
import com.yedamMiddle.myPage.serviceImpl.MyPageServiceImpl;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.userQna.service.UserQnaVO;

public class MyPageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		Object userNoObj = req.getSession().getAttribute("uno");
		if (userNoObj == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		int userNo = (Integer) userNoObj;
		MyPageService svc = new MyPageServiceImpl();
		List<CouponVO> endList = svc.endCouponList(userNo);
		List<UserQnaVO> qnaList = svc.recentQnaList(userNo);
		List<ProductOrderJoinVO> orderList = svc.orderList(userNo);
		List<ReviewVO> recentReviewList = svc.recentReviewList(userNo);
		req.setAttribute("endList", endList);
		req.setAttribute("qnaList", qnaList);
		req.setAttribute("orderList", orderList);
		req.setAttribute("recentReviewList", recentReviewList);
		
		try {
			req.getRequestDispatcher("myPage/myPage.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
