package com.yedamMiddle.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductVO;

public class GetProductControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String prodno = req.getParameter("prno");
		AdminService svc = new AdminServiceImpl();
		ProductVO vo = svc.getProduct(Integer.parseInt(prodno));
		System.out.println(prodno);
		System.out.println(vo);
		req.setAttribute("prno", vo);
		
		try {
			req.getRequestDispatcher("admin/getProduct.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
