package com.yedamMiddle.userQna.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class ModifyUserQnaControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "getUserQnaList.do";
		String qnaNo = req.getParameter("qnaNo");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String registDate = req.getParameter("registDate");
		
		System.out.println("qnaNo :" + qnaNo);
		System.out.println("title :" + title);
		System.out.println("contents :" + contents);
		System.out.println("registDate :" + registDate);//Tue Nov 14 16:07:07 KST 2023
		
		UserQnaVO userQnaVo = new UserQnaVO();
	
		
		userQnaVo.setQnaNo(Integer.parseInt(qnaNo) );
		userQnaVo.setTitle(title);
		userQnaVo.setContents(contents);
		
		
		try {//String을 Date형식으로 변경(들어가는 자료도 format의 형태와 같아야 오류 안뜸)
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = format.parse(registDate);
			
			userQnaVo.setRegistDate(date);
			System.out.println("date : " + date);
			
		} catch (Exception e) {
			e.printStackTrace();
		}   
		
		
		UserQnaService svc = new UserQnaServiceImpl();
		int upDateCheck = svc.userQnaUpdate(userQnaVo);
		
		if(upDateCheck == 1) {
			try {
				System.out.println("성공");
				req.getRequestDispatcher(path).forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("실패");
		}
	}

}