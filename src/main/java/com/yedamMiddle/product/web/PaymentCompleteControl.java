package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductOrderVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class PaymentCompleteControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		Object userNoObj = req.getSession().getAttribute("uno");
		if(userNoObj == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		int userNo = (Integer)userNoObj;
		
		// 가격검증먼저해야함.
		String[] proNos = req.getParameterValues("productNo");
		String payAmount = req.getParameter("payAmount");
		
		
		String imp = req.getParameter("impUid");
		String merUid = req.getParameter("merUid");

		List<ProductOrderVO> orderVOList = new ArrayList<ProductOrderVO>();
		for(String productNo : proNos) {
			ProductOrderVO vo = new ProductOrderVO();
			int pNo = Integer.parseInt(productNo);
			vo.setProductNo(pNo);
			vo.setUserNo(userNo);
			vo.setImpUid(imp);
			vo.setMerUid(Long.parseLong(merUid));
			
			orderVOList.add(vo);
		}
		
		ProductService svc = new ProductServiceImpl();
		svc.addPaymentInfo(orderVOList);
	}

}
