package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductOrderVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class PayCompleteFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String path = "payment/paymentCompleteForm.tiles";
		
		String[] pNos = req.getParameterValues("pno");
		String merUid = req.getParameter("merUid");
		Object userNo = req.getSession().getAttribute("uno");
		if(pNos == null || merUid == null || userNo == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		int[] productNos = Arrays.stream(pNos).mapToInt(Integer::parseInt).toArray();
		
		ProductService svc = new ProductServiceImpl();
		List<ProductOrderVO> list = svc.getProductOrder(productNos, Long.parseLong(merUid), (Integer)userNo);
		
		req.setAttribute("orderList", list);
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
