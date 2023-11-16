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
		int prodno = Integer.parseInt(req.getParameter("prno"));
		AdminService svc = new AdminServiceImpl();
		ProductVO vo = svc.getProduct(prodno);
		String categoryName = svc.cateName(prodno);
		System.out.println(vo);
		String petType;
		if(vo.getPetType().equals("0")) {
			petType = "dog";
		}else {
			petType = "cat";
		}
		req.setAttribute("prno", vo);
		req.setAttribute("categoryName", categoryName);
		req.setAttribute("petType", petType);
		try {
			req.getRequestDispatcher("admin/getProduct.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
