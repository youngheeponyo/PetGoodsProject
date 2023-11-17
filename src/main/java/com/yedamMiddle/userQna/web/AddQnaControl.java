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
//		Date dateNow= new Date();		
//		String qnaNo=req.getParameter("maxQnaNO");//1.글번호
//		String nickName=req.getParameter("nickName");//2.작성자
//		String fomatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm"));//3.작성일시
//		String pName=req.getParameter("pName");//상세페이지에서 가져온 상품명
		
		HttpSession session = req.getSession();
		UserQnaService svc = new UserQnaServiceImpl();
		UserQnaVO vo = new UserQnaVO();
		String path="getUserQnaAllList.do";

		String userNoObj = String.valueOf(session.getAttribute("uno")); //#{userNo}
		String title=req.getParameter("title");//#{title}
		String contents=req.getParameter("contents");//#{contents}
		String password = req.getParameter("password");//#{password}
		String qnaType=req.getParameter("qnaType");//#{qnaType})
		String productNo=req.getParameter("productNo");
		String pNo = req.getParameter("pNo");
		
	
		

		
		System.out.println("uno =" + userNoObj);
		System.out.println("title : " +title);
		System.out.println("contents : " +contents);
		System.out.println("password : " +password);
		System.out.println("qnaType : " +qnaType);
		System.out.println("pNo : " +pNo);
		System.out.println("productNo : " +productNo);
		
		vo.setUserNo(Integer.parseInt(userNoObj));//#{userNo}
		vo.setTitle(title);//#{title}
		vo.setContents(contents);//#{contents}
		if(password=="") {
			vo.setPassword(0);
		}else {
			vo.setPassword(Integer.parseInt(password));//#{password}
		}
		
		
		
		vo.setQnaType(qnaType);//#{qnaType})
		
		if(pNo ==null && productNo!=null) {//pno가 없고, product넘버가 있을때
			vo.setProductNo(Integer.parseInt(productNo));
		}else if(pNo !=null && productNo==null){//product넘버가 없고, pno가 있을때
			vo.setProductNo(Integer.parseInt(pNo));
		}else {//둘다 null일때
			vo.setProductNo(0);
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
