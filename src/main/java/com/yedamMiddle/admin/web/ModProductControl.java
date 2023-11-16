package com.yedamMiddle.admin.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductVO;

public class ModProductControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		ProductVO vo = new ProductVO();
		AdminService svc = new AdminServiceImpl();
		
		vo.setProductNo(Integer.parseInt(req.getParameter("productNo")));
		vo.setCategoryNo(Integer.parseInt(req.getParameter("categoryNo")));
		vo.setProductPrice(Integer.parseInt(req.getParameter("productPrice")));
		vo.setProductStock(Integer.parseInt(req.getParameter("productStock")));
		vo.setProductDesc(req.getParameter("productDesc"));
		
		if(svc.editProduct(vo)) {
			try {
				resp.sendRedirect("productList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("modProductForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
