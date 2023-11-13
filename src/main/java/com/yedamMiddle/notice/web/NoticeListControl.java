package com.yedamMiddle.notice.web;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.notice.service.NoticeService;
import com.yedamMiddle.notice.service.NoticeVO;
import com.yedamMiddle.notice.serviceImpl.NoticeServiceImpl;

public class NoticeListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		NoticeService svc = new NoticeServiceImpl();
		List<NoticeVO> list = svc.noticeList();
		System.out.println(list);
		req.setAttribute("list", list);
		
		try {
			req.getRequestDispatcher("notice/noticeList.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
