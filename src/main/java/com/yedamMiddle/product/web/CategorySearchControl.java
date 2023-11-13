package com.yedamMiddle.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.PageDTO;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class CategorySearchControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String category = req.getParameter("categoryNo");
		String petType = req.getParameter("type");
		String page = req.getParameter("page");
		if(category == null || category.isEmpty())
			return;
		
		page = "1";
		int categoryNo = Integer.parseInt(category);
		int pageNo = Integer.parseInt(page);
		if(categoryNo <= 0 || pageNo <= 0)
			return;
		
		ProductService svc = new ProductServiceImpl();
		List<ProductVO> productList = svc.searchCategory(categoryNo, petType, pageNo);
		
		CategoryVO cateVO =  svc.getCategoryInfo(categoryNo);
		if(cateVO == null) {
			return;
		}
		
		int totalProductCnt =  svc.searchCategoryCount(categoryNo);
		PageDTO pageDto = new PageDTO(0, totalProductCnt, pageNo, 8);
		
		String query = cateVO.getCategoryName() + " 카테고리";
		String myActive = "category";
		req.setAttribute("query", query);
		req.setAttribute("searchList", productList);
		req.setAttribute("pagination", pageDto);
		req.setAttribute("active", myActive);
		req.setAttribute("categoryNo", categoryNo);
		req.setAttribute("curPage", page);
		try {
			req.getRequestDispatcher("product/productSearchPage.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
