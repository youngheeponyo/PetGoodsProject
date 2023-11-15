package com.yedamMiddle.userQna.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
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
//		userQnaVo = svc.userQnaSelect(userQnaVo);
		
		//userQnaVo의 userNo로 user_table에서 작성자 찾기
		
		
	}
}