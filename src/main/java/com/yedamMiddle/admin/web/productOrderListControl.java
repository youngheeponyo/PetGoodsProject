package com.yedamMiddle.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductOrderVO;

public class productOrderListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		AdminService svc = new AdminServiceImpl();
		List<ProductOrderVO> list = svc.productOrder();
		
		req.setAttribute("orderList", list);
		
		try {
			req.getRequestDispatcher("admin/productOrderList.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
