package com.yedamMiddle.review.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.review.service.ReviewVO;

public class AddReviewControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
	
		String productNo = req.getParameter("productNo");//상품번호
		String userNo = req.getParameter("userNo");//유저번호
		String productName= req.getParameter("productName");//상품이름
		String score=req.getParameter("score");//별점
		String nickName= req.getParameter("nickName");//작성자
		String img=req.getParameter("img");//사진
		String content= req.getParameter("content");//내용
		
		
		System.out.println("productNo = "+ productNo);
		System.out.println("userNo = "+ userNo);
		System.out.println("productName = "+productName );
		System.out.println("score = "+ score);
		System.out.println("nickName = "+ nickName);
		System.out.println("img = "+ img);
		System.out.println("content = "+ content);
		
		ReviewVO reviewVo = new ReviewVO();
		
		
		
		
		
	}

}
