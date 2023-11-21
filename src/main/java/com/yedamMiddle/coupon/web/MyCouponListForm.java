package com.yedamMiddle.coupon.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.coupon.service.CouponService;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.coupon.serviceImpl.CouponServiceImpl;

public class MyCouponListForm implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path= "coupon/myCouponList.tiles";
		HttpSession session = req.getSession();
		CouponService svc = new CouponServiceImpl();
		
		if(session.getAttribute("uno") == null) {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
		
		int uno = (int) session.getAttribute("uno");
		List<CouponVO> list=svc.userCouponSelect(uno);
		req.setAttribute("list", list);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}

}
