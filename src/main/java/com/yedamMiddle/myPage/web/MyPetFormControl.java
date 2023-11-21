package com.yedamMiddle.myPage.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;

public class MyPetFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.getRequestDispatcher("/myPage/myPetForm.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
