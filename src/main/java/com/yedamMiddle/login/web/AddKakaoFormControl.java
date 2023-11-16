package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.login.service.KakaoVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class AddKakaoFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String kId = req.getParameter("kId");
		
		KakaoVO vo = new KakaoVO();
		vo.setKakaoId(kId);
		req.setAttribute("kId", vo);
		
		LoginService svc= new LoginServiceImpl();
		if(svc.kakao(vo)) {
			try {
				resp.sendRedirect("addKakao.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
