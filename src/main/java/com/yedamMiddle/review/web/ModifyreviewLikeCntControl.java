package com.yedamMiddle.review.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;

public class ModifyreviewLikeCntControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		ReviewService svc = new ReviewServiceImpl();
		HttpSession session = req.getSession();
		
		
		String reviewno = req.getParameter("reviewno");
		String userno = req.getParameter("userno");
		String reviewLikeCnt = req.getParameter("reviewLikeCnt");
		System.out.println("reviewLikeCnt L "+reviewLikeCnt);
		ReviewVO reviewVo = new ReviewVO();
		reviewVo.setReviewNo(Integer.parseInt(reviewno));
		reviewVo.setUserNo(Integer.parseInt(userno));
		reviewVo.setReviewLikeCnt(Integer.parseInt(reviewLikeCnt));
		
		int update = svc.updateReviewLikeCnt(reviewVo);
		
		Gson gson = new GsonBuilder().create();
		String likeUpdateJson = gson.toJson(update);
		System.out.println("likeUpdateJson : "+ likeUpdateJson);
		try {
			resp.getWriter().print(likeUpdateJson);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
