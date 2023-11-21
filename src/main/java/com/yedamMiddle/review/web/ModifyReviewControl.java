package com.yedamMiddle.review.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;

public class ModifyReviewControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
			
	//파일 보내는 방법/.... 개어려움
			String saveDir = req.getServletContext().getRealPath("reviewImage");
			System.out.println("saveDir :: 0 + 0" + saveDir);
			int size = 10 * 1024 *1024;
			MultipartRequest mr = null;
			
			try {
				mr= new MultipartRequest(req, //요청정보
										saveDir,//저장경로
										size,//최대업로드 크기
										"UTF-8",//encoding
										new DefaultFileRenamePolicy());//리네임정책
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			String productNo = mr.getParameter("productNo");//상품번호
			String userNo = mr.getParameter("userNo");//유저번호
			String productName= mr.getParameter("productName");//상품이름
			String score=mr.getParameter("score");//별점
			String nickName= mr.getParameter("nickName");//작성자
			String img=mr.getFilesystemName("img");//사진
			String content= mr.getParameter("content");//내용
			String merUid = mr.getParameter("merUid");//구매번호
			String reviewNo = mr.getParameter("reviewNo");//구매번호
			
			System.out.println("productNo = "+ productNo);
			System.out.println("userNo = "+ userNo);
			System.out.println("productName = "+productName );
			System.out.println("score = "+ score);
			System.out.println("nickName = "+ nickName);
			System.out.println("img = "+ img);
			System.out.println("content = "+ content);
			System.out.println("merUid = "+ merUid);
			System.out.println("reviewNo = "+ reviewNo);
			
			ReviewVO reviewVo = new ReviewVO();
			
			reviewVo.setContent(content);
			reviewVo.setReviewImage(img);
			reviewVo.setNickName(nickName);
			reviewVo.setStarCnt(Integer.parseInt(score));
			reviewVo.setProductName(productName);
			reviewVo.setUserNo(Integer.parseInt(userNo));
			reviewVo.setProductNo(Integer.parseInt(productNo));
			reviewVo.setMerUid(Long.parseLong(merUid));
			reviewVo.setReviewNo(Integer.parseInt(reviewNo));
			ReviewService svc = new ReviewServiceImpl();

			if(svc.updateReview(reviewVo) == 1) {
					System.out.println("리뷰 수정 성공");
					
					try {
						
						req.setAttribute("rNo", reviewNo);
						String path="myReviewDetail.do";
						req.getRequestDispatcher(path).forward(req, resp);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}else {

					
					try {
						req.setAttribute("reviewNo", reviewNo);
						String path="modifyReviewForm.do";
						req.getRequestDispatcher(path).forward(req, resp);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
			
	}
	
}
			

	
