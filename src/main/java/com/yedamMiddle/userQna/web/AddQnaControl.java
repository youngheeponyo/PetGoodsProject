package com.yedamMiddle.userQna.web;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class AddQnaControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		
		String userNoObj = String.valueOf(session.getAttribute("uno")); 
//		LocalDateTime now = LocalDateTime.now();
		Date dateNow= new Date();
		UserQnaService svc = new UserQnaServiceImpl();
		UserQnaVO vo = new UserQnaVO();
		String path="getUserQnaList.do";

		
		String qnaNo=req.getParameter("maxQnaNO");//1.글번호
		String nickName=req.getParameter("nickName");//2.작성자
//		String fomatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm"));//3.작성일시
		String title=req.getParameter("title");//4.제목
		String qnaType=req.getParameter("qnaType");//5.문의종류
		String contents=req.getParameter("contents");//6.내용
		String pName=req.getParameter("pName");//상세페이지에서 가져온 상품명
//		int detailProductNo = svc.productNameToSelectProductNo(pName);//7.위의 상품명으로 찾은 번호
		String productNo=req.getParameter("productNo");//리스트에서 고른 상품명
//		int productNo = svc.productNameToSelectProductNo(productName);//8.위의 상품명으로 찾은 번호
		String password = req.getParameter("password");
		
		System.out.println("qnaNo : " +qnaNo);
		System.out.println("nickName : " +nickName);
		System.out.println("title : " +title);
		System.out.println("qnaType : " +qnaType);
		System.out.println("contents : " +contents);
		System.out.println("pName : " +pName);
//		System.out.println("detailProductNo : " +detailProductNo);
		System.out.println("productNo : " +productNo);
//		System.out.println("productNo : " +productNo);
		System.out.println("uno =" + userNoObj);
		
//		vo.setQnaNo(Integer.parseInt(qnaNo));
		vo.setUserNo(Integer.parseInt(userNoObj));
		vo.setProductNo(0);
//		vo.setNickName(nickName);
		vo.setRegistDate(dateNow);
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setPassword(Integer.parseInt(password));
		vo.setQnaState(0);
		vo.setQnaReply("");
		vo.setQnaType(qnaType);
		
		if(pName != "") {//만약 상세페이지에서 받아온 상품명 정보가 없다면
//			vo.setProductNo(productNo);//홈페이지
		}else {
//			vo.setProductNo(detailProductNo);//상품상세페이지
		}
		
		
		int insertCheck = svc.userQnaInsert(vo);
		if(insertCheck == 1) {
			try {
				System.out.println("성공");
				req.getRequestDispatcher(path).forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("실패");
		}
	}

}
