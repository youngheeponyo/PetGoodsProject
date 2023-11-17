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
import com.yedamMiddle.addr.service.AddrService;
import com.yedamMiddle.addr.service.AddrVO;
import com.yedamMiddle.addr.serviceImpl.AddrServiceImpl;
import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.IamPort;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;
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
		LoginService loginsvc = new LoginServiceImpl();
		UserVO userInfo = loginsvc.getUserInfo(userNo);
		if(userInfo == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		String imp = req.getParameter("impUid");
		String merUid = req.getParameter("merUid");
		String[] proNos = req.getParameterValues("productNo");
		String[] proSel = req.getParameterValues("productSelCnt");
		String payAmount = req.getParameter("payAmount"); // 클라이언트가 보낸 결제금액
		
		String fee = req.getParameter("fee");
		String deliveryReq = req.getParameter("deliveryReq");
		System.out.println(deliveryReq);
		String addr = userInfo.getUserAddr(); // 만약 주소지 변경할수있으면 바꿔야함.
		
		int addrFee = 0;
		if(fee != null) {
			addrFee = Integer.parseInt(fee);
		}
		
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
		List<Integer> realProductNo = new ArrayList<>();
		for(int i = 0; i < priceResult.size(); ++i) {
			int count = Integer.parseInt(proSel[i]);
			realAllProductPrice += (priceResult.get(i) * count);
			for(int j = 0; j < count; ++j) {
				realProductNo.add(Integer.parseInt(proNos[i]));
			}
		}
		
		realAllProductPrice += addrFee; // 배송비 추가.
		
		// 실제상품과 사용자가 결제한 금액을 비교
		if(portPrice != realAllProductPrice) {
			retJson.put("retCode", "invalidPrice");
			try {
				resp.getWriter().print(gson.toJson(retJson));
				IamPort.paymentCancle(imp);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		// 상품결제 리스트 DB에삽입
		List<ProductOrderVO> orderVOList = new ArrayList<ProductOrderVO>();
		for(int productNo : realProductNo) {
			ProductOrderVO vo = new ProductOrderVO();
			vo.setProductNo(productNo);
			vo.setUserNo(userNo);
			vo.setImpUid(imp);
			vo.setMerUid(Long.parseLong(merUid));
			
			orderVOList.add(vo);
		}

		if(!svc.addPaymentInfo(orderVOList)) {
			retJson.put("retCode", "serverError");
			try {
				resp.getWriter().print(gson.toJson(retJson));
				IamPort.paymentCancle(imp);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		// 배송지 정보삽입
		AddrService svc3 = new AddrServiceImpl();
		List<AddrVO> addrList = new ArrayList<AddrVO>();
		//productOrderNo정보를 가져오기 위해..
		List<ProductOrderVO> productOrderNo = svc.getProductOrder(productNos, Long.parseLong(merUid), userNo);
		for(ProductOrderVO vo : productOrderNo) {
			int prOrderNo = vo.getProductOrderNo();
			AddrVO addrVO = new AddrVO();
			addrVO.setProductOrderNo(prOrderNo);
			addrVO.setAddrFee(addrFee);
			addrVO.setAddrAddress(userInfo.getUserAddr());
			addrVO.setAddrRequest(deliveryReq);
			addrVO.setAddrState("0");
			
			addrList.add(addrVO);
		}
		
		for(AddrVO vo : addrList) {
			svc3.saveProductAddr(vo);
		}
		
		// 선택한 장바구니 상품들이 결제완료시 삭제. (만약 삭제가 안되더라도 일단넘어감.)
		MyCartService svc2 = new MyCartServiceImpl();
		svc2.delCartFromPayment(userNo, productNos); 
		
		// 재고 감소처리(나중에.. 다중 update처리로 바꿔보자)
		for(int productNo : realProductNo) {
			svc.reduceProductStock(productNo);
		}
		
		retJson.put("retCode", "OK");
		try {
			resp.getWriter().print(gson.toJson(retJson));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
