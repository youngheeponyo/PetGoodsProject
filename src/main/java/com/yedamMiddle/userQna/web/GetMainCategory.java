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

public class GetMainCategory implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		UserQnaService svc = new UserQnaServiceImpl();
		resp.setContentType("text/json;charset=UTF-8");
		
		List<CategoryVO> mainCategory = svc.getMainCategory();
		
		Map<String, Object> map= new HashMap();
		
		map.put("mainCategory", mainCategory);
		
		Gson gson = new GsonBuilder().create();
		
		String mainCategoryJson = gson.toJson(map);
//		System.out.println("mainCategory ="+mainCategory);
//		System.out.println("map="+map);
//		System.out.println("mainCategoryJson="+mainCategoryJson);
		
		try {
			resp.getWriter().print(mainCategoryJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
