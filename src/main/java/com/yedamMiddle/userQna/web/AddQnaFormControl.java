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
//		int maxQnaNO = svc.getMaxQnaNo();
//		req.setAttribute("maxQnaNO", maxQnaNO);//시퀀스 최대넘버 +1=문의글 번호
//		System.out.println("maxQnaNO="+maxQnaNO);
		
		
		HttpSession session = req.getSession();
		UserQnaService svc = new UserQnaServiceImpl();
		
		//로그인되어있는지 확인
		if(session.getAttribute("uno") == null) {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			
			String pName = req.getParameter("pName");//상품이름
			req.setAttribute("pName", pName);
			System.out.println("pName=" +pName);
			
			int pNo=Integer.parseInt(req.getParameter("pNo"));
			if(pNo != 0) {//상세페이지의 상품넘버가 0(상품없음)이 아니면
				req.setAttribute("pNo", pNo);
				System.out.println("pNo="+ pNo);
			}
			
			
			
			

			
			int uno = (int) session.getAttribute("uno");
			System.out.println("uno =" + uno);
			UserVO userVo = svc.unoToSelectUser(uno);//user정보
			System.out.println("uno =" + uno);
			req.setAttribute("userVo", userVo);
			System.out.println("userVo = "+ userVo);
			
			
			List<CategoryVO> mainCategory = svc.getMainCategory();
			List<CategoryVO> subCategory = svc.getSubCategory();
			
			System.out.println("mainCategory="+ mainCategory);
			System.out.println("subCategory="+ subCategory);
			
			req.setAttribute("mainCategory", mainCategory);
			req.setAttribute("subCategory", subCategory);
			
			
			try {
				
				req.getRequestDispatcher("userQna/addQnaForm.tiles").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
