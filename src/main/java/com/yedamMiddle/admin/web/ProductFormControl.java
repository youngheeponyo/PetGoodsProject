package com.yedamMiddle.admin.web;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class ProductFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		ProductService svc = new ProductServiceImpl();
		List<CategoryJoinVO> result = svc.getCategoryList();
		Map<Integer, List<CategoryJoinVO>> categoryMap = result.stream().collect(Collectors.groupingBy(CategoryJoinVO::getMainCateNo));
		HttpSession session = req.getSession();
		session.setAttribute("categoryMap", categoryMap);
		try {
			req.getRequestDispatcher("/admin/productForm.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
