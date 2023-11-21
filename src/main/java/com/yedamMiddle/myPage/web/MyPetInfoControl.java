package com.yedamMiddle.myPage.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.PetVO;
import com.yedamMiddle.myPage.service.MyPageService;
import com.yedamMiddle.myPage.serviceImpl.MyPageServiceImpl;

public class MyPetInfoControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		Object userNoObj = req.getSession().getAttribute("uno");
		if (userNoObj == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		int userNo = (Integer) userNoObj;
		MyPageService svc = new MyPageServiceImpl();
		List<PetVO> vo = svc.petInfo(userNo);
		
		req.setAttribute("pet", vo);
		
		try {
			req.getRequestDispatcher("myPage/myPetInfo.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}

}
