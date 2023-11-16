package com.yedamMiddle.userQna.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class AddQnaFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		UserQnaService svc = new UserQnaServiceImpl();

		
	
		
		
		String pName = req.getParameter("pName");//상품이름
		req.setAttribute("pName", pName);
//		System.out.println(pName);
		
		
		int maxQnaNO = svc.getMaxQnaNo();
		req.setAttribute("maxQnaNO", maxQnaNO);//시퀀스 최대넘버 +1=문의글 번호
		
		
		int uno = (int) session.getAttribute("uno");
		UserVO userVo = svc.unoToSelectUser(uno);//user정보
		req.setAttribute("userVo", userVo);
		System.out.println("userVo = "+ userVo);
		
		List<CategoryVO> categoryNoList = svc.categoryNoList();
		List<ProductVO> productNameList = svc.productNameList();
//		System.out.println("categoryNoList = "+categoryNoList);//전체 카테고리 번호
//		System.out.println("productNameList = "+productNameList);//전체 상품 이름
		req.setAttribute("categoryNoList", categoryNoList);
		req.setAttribute("productNameList", productNameList);
		
		//AddQnaControl에서 등록할때 시간으로 넣어주기
//		LocalDateTime now = LocalDateTime.now();
//		String fomatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm"));
//		System.out.println(fomatedNow);
		
		
		//로그인되어있는지 확인
		if(session.getAttribute("uno") == null) {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				
				req.getRequestDispatcher("userQna/addQnaForm.tiles").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
		
		
		
	}

}
