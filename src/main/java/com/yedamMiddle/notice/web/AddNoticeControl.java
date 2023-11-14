package com.yedamMiddle.notice.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.notice.service.NoticeService;
import com.yedamMiddle.notice.service.NoticeVO;
import com.yedamMiddle.notice.serviceImpl.NoticeServiceImpl;

public class AddNoticeControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		NoticeVO vo = new NoticeVO();
		NoticeService svc = new NoticeServiceImpl();
		
		vo.setNoticeTitle(req.getParameter("title"));
		vo.setNoticeContent(req.getParameter("content"));
		
		if(svc.addNotice(vo)) {
			try {
				resp.sendRedirect("noticeList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("noticeForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}

}
