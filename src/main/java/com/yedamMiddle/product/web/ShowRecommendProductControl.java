package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.PageDTO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class ShowRecommendProductControl implements Command {

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
		if(page == null)
			page = "1";
		
		int pageNo = Integer.parseInt(page);
		ProductService svc = new ProductServiceImpl();
		List<ProductVO> productHighStar = svc.searchHighStarProductFromTab(petType);
		String query = "추천상품";
		
		int startIdx = (pageNo - 1) * 8;
		int endIdx = (pageNo) * 8;
		
		List<ProductVO> showList = new ArrayList<>(8);
		for(int sIdx = startIdx; sIdx < endIdx; ++sIdx) {
			if(sIdx >= productHighStar.size())
				break;
			
			showList.add(productHighStar.get(sIdx));
		}
		
		PageDTO pageDto = new PageDTO(0, productHighStar.size(), pageNo, 8);
		//req.setAttribute("searchPage", "1");
		req.setAttribute("searchList", showList);
		req.setAttribute("query", query);
		req.setAttribute("curPage", page);
		req.setAttribute("pagination", pageDto);
		req.setAttribute("active", "highStar");
		try {
			req.getRequestDispatcher("product/productSearchPage.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
