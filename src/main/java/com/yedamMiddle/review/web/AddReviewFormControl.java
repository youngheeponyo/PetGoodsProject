package com.yedamMiddle.review.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.review.service.ReviewService;
//import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class AddReviewFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		ReviewService svc = new ReviewServiceImpl();
		UserQnaService uvc = new UserQnaServiceImpl();
		
		String path="review/addReviewForm.tiles";
		String uno = String.valueOf(session.getAttribute("uno"));
		String pNo = req.getParameter("pNo");
		
		//mapper.xml에 파라미터 타입 고치면 다른것도 고쳐야 하는데 귀찮아서.. 이렇게 받음
		UserQnaVO userQnaVo = new UserQnaVO();
		userQnaVo.setProductNo(Integer.parseInt(pNo));
		
		//상품주문번호
		String merUid = req.getParameter("mUid");
		//상품 테이블 - 상품이름이랑 상품번호 필요
		ProductVO productVo = uvc.productNoToSelectProduct(userQnaVo);
		//유저정보 테이블 -닉네임이랑 유저번호 필요
		UserVO userVo = uvc.unoToSelectUser(Integer.parseInt(uno));
		
//		System.out.println("uno="+uno);
//		System.out.println("merUid =" + merUid);
//		System.out.println("productNo =" + pNo);
//		System.out.println("productVo="+ productVo);
//		System.out.println("userVo="+userVo);
		
		req.setAttribute("merUid", merUid);
		req.setAttribute("productVo", productVo);
		req.setAttribute("userVo", userVo);
		
		//아래꺼 사용하면 같은 물건 수량2개 구매하고 리뷰작성눌렀을때 오류남
//		ReviewVO reviewVo = svc.selectDetailReviewByProductNo(Long.parseLong(merUid), Integer.parseInt(productNo));
//		System.out.println("reviewVo =" + reviewVo);
//		req.setAttribute("reviewVo", reviewVo);
		
		
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
