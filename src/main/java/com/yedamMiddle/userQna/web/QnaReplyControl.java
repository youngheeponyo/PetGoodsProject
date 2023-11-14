package com.yedamMiddle.userQna.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class QnaReplyControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path="userQna/getUserQnaList.tiles";
		String qnaNo= req.getParameter("qnaNo");
		String reply= req.getParameter("reply");
		System.out.println("qnaNo = "+qnaNo+"   reply = "+ reply);
		
		UserQnaService svc = new UserQnaServiceImpl();
		UserQnaVO vo = new UserQnaVO();
		vo.setQnaNo(Integer.parseInt(qnaNo));
		vo.setQnaReply(reply);
		int check = svc.replyUpdate(vo);
		if(check==0 ) {
			System.out.println("실패");
		}else {
			System.out.println("성공");
			try {
				req.getRequestDispatcher(path).forward(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
