package com.yedamMiddle.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;

public class CategorySearchControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String category = req.getParameter("categoryNo");
		if(category == null || category.isEmpty())
			return;
		
		int categoryNo = Integer.parseInt(category);
		if(categoryNo <= 0)
			return;
		
	}

}
