package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class ShowNewProductControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String petType = (String)req.getSession().getAttribute("curShowPetType");
		if(petType == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		String page = req.getParameter("page");
		int pageNo = Integer.parseInt(page);
		ProductService svc = new ProductServiceImpl();
		List<ProductVO> productRegistDesc = svc.searchRegistDateDescFromMain(petType);
		
		req.setAttribute("", productRegistDesc);
	}

}
