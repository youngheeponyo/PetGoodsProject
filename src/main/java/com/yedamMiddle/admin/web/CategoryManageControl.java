package com.yedamMiddle.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CategoryJoinVO;

public class CategoryManageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		AdminService svc = new AdminServiceImpl();
		List<CategoryJoinVO> cateList = svc.getJoinCateList();
		
		req.setAttribute("categoryList", cateList);
		
		try {
			req.getRequestDispatcher("admin/categoryManage.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
