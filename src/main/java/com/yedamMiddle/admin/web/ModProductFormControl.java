package com.yedamMiddle.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductVO;

public class ModProductFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String prno = req.getParameter("prno");
		AdminService svc = new AdminServiceImpl();
		ProductVO vo = svc.getProduct(Integer.parseInt(prno));
		req.setAttribute("prod", vo);
		
		try {
			req.getRequestDispatcher("/admin/modProductForm.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
