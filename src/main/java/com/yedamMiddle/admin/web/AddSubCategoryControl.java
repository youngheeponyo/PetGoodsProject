package com.yedamMiddle.admin.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CategoryVO;

public class AddSubCategoryControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
//		CategoryVO vo = new CategoryVO();
		String subCategoryName = req.getParameter("subCategory");
		String catePreName = req.getParameter("categoryName");
		
		System.out.println(subCategoryName + "===" + catePreName);
		
		AdminService svc = new AdminServiceImpl();
		
		if(svc.addSubCate(subCategoryName, catePreName)) {
			try {
				resp.sendRedirect("categoryManage.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
