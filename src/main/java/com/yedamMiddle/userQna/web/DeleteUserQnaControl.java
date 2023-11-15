package com.yedamMiddle.userQna.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class DeleteUserQnaControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String qnaNo =req.getParameter("qnaNo");
//		System.out.println(qnaNo);제대로 가져옴
		UserQnaVO userQnaVo = new UserQnaVO();
		userQnaVo.setQnaNo(Integer.parseInt(qnaNo));
		
		UserQnaService svc = new UserQnaServiceImpl();
		int deletecheck = svc.userQnaDelete(userQnaVo);
		
		if(deletecheck == 1) {
			System.out.println("성공적인 삭제");
			try {
				resp.sendRedirect("getUserQnaAllList.do");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("절망적 삭제 실패");
		}
	}

}
