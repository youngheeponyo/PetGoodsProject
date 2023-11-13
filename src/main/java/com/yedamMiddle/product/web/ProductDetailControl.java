package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class ProductDetailControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "product/productDetail.tiles";
		
		String pno = req.getParameter("pno");
		String cno = req.getParameter("cno");
		String type = req.getParameter("type");
		
		ProductService svc = new ProductServiceImpl();
		ProductVO vo = svc.productDetail(Integer.parseInt(pno));
		req.setAttribute("pno", vo);
		
		
		UserQnaService usc = new UserQnaServiceImpl();
		List<UserQnaVO> qlist = usc.userQnaAllList();
		req.setAttribute("qlist", qlist);
		
		List<ProductVO> list = svc.productList();
		req.setAttribute("list", list);
		
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}
