package com.yedamMiddle.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.review.service.ReviewVO;

public class AdminPageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		AdminService svc = new AdminServiceImpl();
//		List<SalesRateVO> vo = svc.getSalesRate();
//		System.out.println(vo);
//		
//		List<String> prNames = new ArrayList<>();
//		List<Integer> prCnts = new ArrayList<>();
//		
//		for(SalesRateVO vos : vo) {
//			prNames.add(vos.getProductName());
//			prCnts.add(vos.getSellCnt());
//		}
//		System.out.println(prNames);
//		System.out.println(prCnts);
//		req.setAttribute("prNames", prNames);
//		req.setAttribute("prCnts", prCnts);
		
		List<ReviewVO> vo = svc.getAllReview();
		req.setAttribute("vo", vo);
		
		
		try {
			req.getRequestDispatcher("admin/adminPage.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
