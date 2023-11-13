package com.yedamMiddle.userQna.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class GetQnaListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path ="userQna/userQnaList.tiles";
		String qnaNo = req.getParameter("pnaNo");
		String pw = req.getParameter("password");
		System.out.println("qnaNo=" + qnaNo +" pw="+ pw);
		
		UserQnaService svc = new UserQnaServiceImpl();
		UserQnaVO vo = svc.userQnaSelect(Integer.parseInt(qnaNo), Integer.parseInt(pw));
		if(vo != null) {
			try {
				List<UserQnaVO> list = svc.userQnaAllList();
				req.setAttribute("list", list);
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
