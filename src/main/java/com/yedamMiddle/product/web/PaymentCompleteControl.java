package com.yedamMiddle.product.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.IamPort;
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
		String imp = req.getParameter("impUid");
		String merUid = req.getParameter("merUid");
		String[] proNos = req.getParameterValues("productNo");
		String payAmount = req.getParameter("payAmount"); // 클라이언트가 보낸 결제금액
		
		int[] productNos = Arrays.stream(proNos).mapToInt(Integer::parseInt).toArray();
		
		// 가격검증먼저한다.
		ProductService svc = new ProductServiceImpl();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Map<String,Object> retJson = new HashMap<>();
		retJson.put("retCode", "FAIL");
		
		IamportResponse<Payment> portResp = IamPort.paymentByImpUID(imp);
		int portPrice = portResp.getResponse().getAmount().intValue();
		
		int realAllProductPrice = 0;
		List<Integer> priceResult = svc.getProductPrice(productNos);
		for(int price : priceResult) {
			realAllProductPrice += price;
		}
		
		if(portPrice != realAllProductPrice) {
			retJson.put("retCode", "invalidPrice");
			try {
				resp.getWriter().print(gson.toJson(retJson));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		
		
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
		

		svc.addPaymentInfo(orderVOList);
		retJson.put("retCode", "OK");
		
		try {
			resp.getWriter().print(gson.toJson(retJson));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
