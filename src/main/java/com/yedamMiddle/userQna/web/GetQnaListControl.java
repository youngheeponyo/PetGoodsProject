package com.yedamMiddle.userQna.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class GetQnaListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path ="userQna/userQnaDetail.tiles";
		String qnaNo = req.getParameter("qnaNo");
		String pw = req.getParameter("password");
		
		//문의번호랑 패스워드 넣으면 해당 상세정보 열어줌
		UserQnaService svc = new UserQnaServiceImpl();
		UserQnaVO vo = svc.userQnaSelect(Integer.parseInt(qnaNo), Integer.parseInt(pw));
		
		//유저 전체 정보
		UserVO userVo = svc.qnaToSelectUser(vo);//아마 게시글 전체 정보 중 유저번호만 따와서 넣을 예정인듯
		System.out.println(vo);
		
		req.setAttribute("vo", vo);
		req.setAttribute("userVo", userVo);
		
		
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
