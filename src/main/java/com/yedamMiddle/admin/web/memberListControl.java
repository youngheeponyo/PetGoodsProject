package com.yedamMiddle.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.UserService;
import com.yedamMiddle.admin.serviceImpl.UserServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;

public class memberListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		UserService svc = new UserServiceImpl();
		List<UserVO> list = svc.userList();
		req.setAttribute("userlist", list);
		
		try {
			req.getRequestDispatcher("admin/memberList.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
