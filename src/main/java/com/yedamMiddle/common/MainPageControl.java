package com.yedamMiddle.common;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddlle.product.service.ProductService;
import com.yedamMiddlle.product.serviceImpl.ProductServiceImpl;

public class MainPageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		ProductService svc = new ProductServiceImpl();
		List<CategoryJoinVO> result = svc.getCategoryList();
		
		Map<Integer, List<CategoryJoinVO>> categoryMap = result.stream().collect(Collectors.groupingBy(CategoryJoinVO::getMainCateNo));
		
		req.getSession().setAttribute("categoryMap", categoryMap);
		
		try {
			req.setAttribute("main", 1); // main페이지 구분용도(배너슬라이드)
			req.getRequestDispatcher("main/mainPage.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
