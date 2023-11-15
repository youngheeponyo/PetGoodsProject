package com.yedamMiddle.userQna.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class GetQnaListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path ="userQna/userQnaDetail.tiles";
		String qnaNo = req.getParameter("qnaNo");
		UserQnaVO userQnaVo = new UserQnaVO();
		userQnaVo.setQnaNo(Integer.parseInt(qnaNo));
		
		//문의번호랑 패스워드 넣으면 해당 상세정보 열어줌
		UserQnaService svc = new UserQnaServiceImpl();
		UserQnaVO vo = svc.userQnaSelect(userQnaVo);
		req.setAttribute("vo", vo);
		
		//유저 전체 정보
		UserVO userVo = svc.qnaToSelectUser(vo);
		System.out.println("vo ="+ vo);
//		System.out.println("userVo ="+ userVo);
		req.setAttribute("userVo", userVo);
		
		//상품페이지의 상품정보
		ProductVO productVo = svc.productNoToSelectProduct(vo);
//		System.out.println("productVo =" + productVo);
		req.setAttribute("productVo", productVo);
		
		
		if(vo != null) {
			try {
				req.getRequestDispatcher(path).forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("getUserQnaAllList.do");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
