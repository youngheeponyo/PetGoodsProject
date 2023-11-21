package com.yedamMiddle.myPage.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.PageDTO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;
import com.yedamMiddle.myPage.service.MyPageService;
import com.yedamMiddle.myPage.serviceImpl.MyPageServiceImpl;
import com.yedamMiddle.review.service.ReviewVO;

public class MyReviewDetailFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		Object obj = req.getSession().getAttribute("uno");
		if(obj == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int userNo = (Integer)obj;
		LoginService svc = new LoginServiceImpl();
		UserVO userInfo = svc.getUserInfo(userNo);
		if(userInfo == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String page = req.getParameter("page");
		if(page == null)
			page = "1";
		int pageNo = Integer.parseInt(page);
		
		MyPageService msvc = new MyPageServiceImpl();
		List<ReviewVO> reviewList = msvc.reviewList(userNo);
		
		int startIdx = (pageNo - 1) * 10;
		int endIdx = (pageNo) * 10;
		
		List<ReviewVO> showList = new ArrayList<>(10);
		for(int sIdx = startIdx; sIdx < endIdx; ++sIdx) {
			if(sIdx >= reviewList.size())
				break;
			
			showList.add(reviewList.get(sIdx));
		}
		
		PageDTO paging = new PageDTO(0,reviewList.size(),pageNo, 10);
		req.setAttribute("pagination", paging);
		req.setAttribute("reviewList", showList);
		try {
			req.getRequestDispatcher("myPage/reviewDetail.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}

}
