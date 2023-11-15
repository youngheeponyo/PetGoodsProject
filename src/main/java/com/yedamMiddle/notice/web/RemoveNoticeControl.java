package com.yedamMiddle.notice.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.notice.service.NoticeService;
import com.yedamMiddle.notice.serviceImpl.NoticeServiceImpl;

public class RemoveNoticeControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String nno = req.getParameter("nno");
		int no = Integer.parseInt(nno);
		
		NoticeService svc = new NoticeServiceImpl();
		
		if(svc.removeNotice(no)) {
			try {
				resp.sendRedirect("noticeList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
