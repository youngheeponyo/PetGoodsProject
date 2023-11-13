package com.yedamMiddle.notice.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.notice.service.NoticeService;
import com.yedamMiddle.notice.service.NoticeVO;
import com.yedamMiddle.notice.serviceImpl.NoticeServiceImpl;

public class GetNoticeControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String nno = req.getParameter("nno");
		NoticeService svc = new NoticeServiceImpl();
		NoticeVO vo = svc.getNotice(Integer.parseInt(nno));
		System.out.println(nno);
		req.setAttribute("nno", vo);
		
		try {
			req.getRequestDispatcher("notice/getNotice.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
