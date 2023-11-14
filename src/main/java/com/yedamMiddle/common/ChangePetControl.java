package com.yedamMiddle.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePetControl implements Command {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String petType = req.getParameter("changeType");
		
		HttpSession session = req.getSession();
		if(petType.equals("0")) {
			session.setAttribute("curShowPetType", "0");
		}
		else {
			session.setAttribute("curShowPetType", "1");
		}
		
		try {
			resp.sendRedirect("main.do");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
}
