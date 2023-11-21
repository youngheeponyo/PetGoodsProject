package com.yedamMiddle.review.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.DispatcherType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;

public class ModifyReviewFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String reviewNo;
		if (req.getDispatcherType() == DispatcherType.FORWARD) {
		    reviewNo = (String) req.getAttribute("reviewNo");
		  
		} else {
			reviewNo = req.getParameter("reviewNo");
		
		}
		ReviewService svc = new ReviewServiceImpl();
		String path="review/modifyReviewForm.tiles";
;
		System.out.println("reviewNo : "+ reviewNo);
		ReviewVO reviewVo = svc.selectDetailReview(Integer.parseInt(reviewNo));
		System.out.println("reviewVo ="+reviewVo);
		
		req.setAttribute("reviewVo", reviewVo);
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	

	}

}
