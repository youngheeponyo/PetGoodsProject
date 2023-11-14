package com.yedamMiddle.notice.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;

public class NoticeFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
			try {
				req.getRequestDispatcher("/notice/noticeForm.tiles").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

}
