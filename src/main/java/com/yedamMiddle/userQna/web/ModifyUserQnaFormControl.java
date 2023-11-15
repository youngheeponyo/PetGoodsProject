package com.yedamMiddle.userQna.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class ModifyUserQnaFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "userQna/modifyUserQna.tiles";
		String qnaNo = req.getParameter("qnaNo");
		
		UserQnaVO userQnaVo = new UserQnaVO();
		userQnaVo.setQnaNo(Integer.parseInt(qnaNo));
		
		UserQnaService svc = new UserQnaServiceImpl();
		
		//qnaNo로 수정할 qna 전체 정보 찾기 
		userQnaVo = svc.userQnaSelect(userQnaVo);
		
		//userQnaVo의 userNo로 user_table에서 작성자 찾기
		UserVO userVo = svc.qnaToSelectUser(userQnaVo);
//		System.out.println("userVo : " + userVo); 정상적으로 나옴
		
		//prodcutNo로 product 정보 찾기
		ProductVO productVo = svc.productNoToSelectProduct(userQnaVo);
//		System.out.println("productVo : " + productVo);정상적으로 나옴
		
		req.setAttribute("productVo", productVo);
		req.setAttribute("userVo", userVo);
		req.setAttribute("userQnaVo", userQnaVo);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}