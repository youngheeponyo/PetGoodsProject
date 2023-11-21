package com.yedamMiddle.myPage.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.PetVO;
import com.yedamMiddle.myPage.service.MyPageService;
import com.yedamMiddle.myPage.serviceImpl.MyPageServiceImpl;

public class AddMyPetControl implements Command {

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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int userNo = (Integer) userNoObj;
		String petName = req.getParameter("petName");
		String petType = req.getParameter("petType");
		String petBirth = req.getParameter("petBirth");
		String petGender = req.getParameter("petGender");
		
		PetVO vo = new PetVO();
		vo.setUserNo(userNo);
		vo.setPetName(petName);
		vo.setPetType(petType);
		try {
			vo.setPetBirth(sdf.parse(petBirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vo.setPetGender(petGender);
		
		MyPageService svc = new MyPageServiceImpl();
		
		if(svc.addMyPet(vo)) {
			try {
				resp.sendRedirect("myPetInfo.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("myPetForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}

}
