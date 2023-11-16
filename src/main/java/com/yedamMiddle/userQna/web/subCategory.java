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
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class subCategory implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		UserQnaService svc = new UserQnaServiceImpl();
		resp.setContentType("text/json;charset=utf-8");
		String categoryNo = req.getParameter("categoryNo");
		System.out.println("categoryNo= "+categoryNo);
		
		CategoryVO categoryVo = new CategoryVO();
		categoryVo.setCategoryNo(Integer.parseInt(categoryNo));
		
		List<CategoryVO> subCategory = svc.getSubCategory();
		
		Map<String, Object> map= new HashMap<>();
		
		map.put("subCategory", subCategory);
		
		Gson gson = new GsonBuilder().create();
		String subCategoryJson= gson.toJson(map);
		
		try {
			resp.getWriter().print(subCategoryJson);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
