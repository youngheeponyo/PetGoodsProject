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
		if(petType == null)
			return;
		
		// 0과 1 두값이 아니면 사라져버려
		if(!petType.equals("0") && !petType.equals("1"))
			return;
		
		HttpSession session = req.getSession();
		session.setAttribute("curShowPetType", petType);
		
		try {
			resp.sendRedirect("main.do");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
}
