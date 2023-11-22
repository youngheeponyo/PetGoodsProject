package com.yedamMiddle.coupon.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.coupon.service.CouponService;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.coupon.serviceImpl.CouponServiceImpl;

public class insertCouponControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uno = req.getParameter("uno");
		String cname = req.getParameter("cname");
		String pct = req.getParameter("pct");
		
		CouponService svc = new CouponServiceImpl();
		
		CouponVO vo = new CouponVO();
		vo.setUserNo(Integer.parseInt(uno));
		vo.setCouponName(cname);
		vo.setDiscountPct(Integer.parseInt(pct));
		
		if(svc.insertCoupon(vo)==1) {
			try {
				resp.sendRedirect("memberList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			
		}
		
	}

}
