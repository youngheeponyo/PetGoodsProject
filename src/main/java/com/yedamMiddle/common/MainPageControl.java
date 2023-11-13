package com.yedamMiddle.common;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class MainPageControl implements Command {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		ProductService svc = new ProductServiceImpl();
		List<CategoryJoinVO> result = svc.getCategoryList();
		//전체리스트
		List<ProductVO> list = svc.productList();
		req.setAttribute("list", list);
		
		Map<Integer, List<CategoryJoinVO>> categoryMap = result.stream().collect(Collectors.groupingBy(CategoryJoinVO::getMainCateNo));
		
		HttpSession session = req.getSession();
		session.setAttribute("categoryMap", categoryMap);
		
		// 현재 강아지 상품/고양이 상품
		if(req.getSession().getAttribute("curShowPetType") == null) {
			session.setAttribute("curShowPetType", "0");
		}
		
		try {
			req.setAttribute("main", 1); // main페이지 구분용도(배너슬라이드)
			req.getRequestDispatcher("main/mainPage.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
