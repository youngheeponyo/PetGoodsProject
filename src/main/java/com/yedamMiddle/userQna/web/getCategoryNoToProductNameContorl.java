package com.yedamMiddle.userQna.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class getCategoryNoToProductNameContorl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		resp.setContentType("text/json;charset=utf-8");
		
		UserQnaService svc = new UserQnaServiceImpl();
		CategoryVO categoryvo= new CategoryVO();
		String categoryNo = req.getParameter("categoryNo");
		categoryvo.setCategoryNo(Integer.parseInt(categoryNo));
		
		List<ProductVO> productNameList= svc.getCategoryNoToProductName(categoryvo);
		
		Map<String,Object> map = new HashMap<>();
		map.put("productNameList", productNameList);
		
		Gson gson = new GsonBuilder().create();
		String productNameListJson = gson.toJson(map);
		
		try {
			resp.getWriter().print(productNameListJson);
		} catch (IOException e) {
			e.printStackTrace();
		}

		

	}

}
