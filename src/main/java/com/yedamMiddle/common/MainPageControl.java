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
		
		HttpSession session = req.getSession();
		if(session.getAttribute("categoryMap") == null) {
			List<CategoryJoinVO> result = svc.getCategoryList();
			Map<Integer, List<CategoryJoinVO>> categoryMap = result.stream().collect(Collectors.groupingBy(CategoryJoinVO::getMainCateNo));
		
			session.setAttribute("categoryMap", categoryMap);
		}
		
		// 현재 강아지 상품/고양이 상품 없으면 default로 0으로 설정한다(강아지)
		String petType = (String)req.getSession().getAttribute("curShowPetType");
		if(petType == null) {
			session.setAttribute("curShowPetType", "0");
		}
		
		List<ProductVO> productRegistDesc = svc.searchRegistDateDescFromMain(petType);
		List<ProductVO> productReviewDesc = svc.searchReviewDescFromMain(petType);
		List<ProductVO> productStarCntDesc = svc.searchStarCntDescFromMain(petType);
		
		req.setAttribute("registDesc", productRegistDesc);
		req.setAttribute("reviewDesc", productReviewDesc);
		req.setAttribute("starCntDesc", productStarCntDesc);
		
		try {
			req.setAttribute("main", 1); // main페이지 구분용도(배너슬라이드)
			req.getRequestDispatcher("main/mainPage.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
