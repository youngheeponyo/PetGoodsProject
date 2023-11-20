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
import com.yedamMiddle.common.service.CartJoinVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.coupon.service.CouponService;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.coupon.serviceImpl.CouponServiceImpl;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;
import com.yedamMiddle.product.service.ProductOrderVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class PaymentCompleteControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		Object userNoObj = req.getSession().getAttribute("uno");
		if (userNoObj == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}

		int userNo = (Integer) userNoObj;
		LoginService loginsvc = new LoginServiceImpl();
		UserVO userInfo = loginsvc.getUserInfo(userNo);
		if (userInfo == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Map<String, Object> retJson = new HashMap<>();
		retJson.put("retCode", "OK");

		// 가격검증
		List<Integer> productList = verifyPrice(req, userInfo);
		if (productList == null) {
			retJson.put("retCode", "invalidPrice");
			try {
				resp.getWriter().print(gson.toJson(retJson));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}

		// 상품결제 DB삽입
		if(!insertProductOrder(req,productList,userInfo)) {
			retJson.put("retCode", "serverError");
			try {
				resp.getWriter().print(gson.toJson(retJson));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		if(!otherAction(req, userInfo)) {
			retJson.put("retCode", "serverError");
			try {
				resp.getWriter().print(gson.toJson(retJson));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}

		try {
			resp.getWriter().print(gson.toJson(retJson));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private List<Integer> verifyPrice(HttpServletRequest req, UserVO userInfo) {
		String imp = req.getParameter("impUid");
		String[] proNos = req.getParameterValues("productNo");
		String[] proSel = req.getParameterValues("productSelCnt");

		String fee = req.getParameter("fee");
		String deliveryReq = req.getParameter("deliveryReq");
		String coupon = req.getParameter("couponNo");
		
		int couponNo = -1;
		if(coupon != null) {
			couponNo = Integer.parseInt(coupon);
		}

		int[] productNos = Arrays.stream(proNos).mapToInt(Integer::parseInt).toArray();
		ProductService svc = new ProductServiceImpl();

		IamportResponse<Payment> portResp = IamPort.paymentByImpUID(imp);
		int portPrice = portResp.getResponse().getAmount().intValue();

		int realAllProductPrice = 0;
		List<ProductVO> priceResult = svc.getProductPrice(productNos);
		List<Integer> realProductNo = new ArrayList<>();
		for (int i = 0; i < productNos.length; ++i) {
			ProductVO findVO = null;
			for(int j = 0; j < priceResult.size(); ++j) {
				if(productNos[i] == priceResult.get(j).getProductNo()) {
					findVO = priceResult.get(j);
					break;
				}
			}
			
			if(findVO == null) {
				System.out.println("findVO == null");
				return null;
			}
			
			int count = Integer.parseInt(proSel[i]);
			realAllProductPrice += (findVO.getProductPrice() * count);
			for (int j = 0; j < count; ++j) {
				realProductNo.add(productNos[i]);
			}
		}
		
		int addrFee = 0;
		if (fee != null) {
			addrFee = Integer.parseInt(fee);
		}
		
		// 할인된 금액 적용.
		if(couponNo >= 0 ) {
			CouponService cSvc = new CouponServiceImpl();
			List<CouponVO> couponList = cSvc.userCouponSelect(userInfo.getUserNo());
			CouponVO findCoupon = null;
			for(CouponVO vo : couponList) {
				if(couponNo == vo.getCouponNo()) {
					findCoupon = vo;
					break;
				}
			}
			
			if(findCoupon == null || !findCoupon.getCouponState().equals("미사용")) {
				System.out.println("쿠폰데이터가 없거나, 이미 사용한 쿠폰");
				return null;
			}
			
			int discount = (int)((realAllProductPrice) * ((double)findCoupon.getDiscountPct() / 100));
			System.out.println("할인금액 : " + discount);
			realAllProductPrice -= discount;
			
			int a = cSvc.userUseCoupon(findCoupon);
		}

		realAllProductPrice += addrFee; // 배송비 추가.
		// 실제상품과 사용자가 결제한 금액을 비교
		if (portPrice != realAllProductPrice) {
			IamPort.paymentCancle(imp);
			return null;
		}
		
		return realProductNo;
	}
	
	// 상품결제 리스트 DB에삽입
	private boolean insertProductOrder(HttpServletRequest req, List<Integer> productList, UserVO userInfo) {
		String imp = req.getParameter("impUid");
		String merUid = req.getParameter("merUid");

		ProductService svc = new ProductServiceImpl();
		List<ProductOrderVO> orderVOList = new ArrayList<ProductOrderVO>();
		for (int productNo : productList) {
			ProductOrderVO vo = new ProductOrderVO();
			vo.setProductNo(productNo);
			vo.setUserNo(userInfo.getUserNo());
			vo.setImpUid(imp);
			vo.setMerUid(Long.parseLong(merUid));

			orderVOList.add(vo);
		}

		if (!svc.addPaymentInfo(orderVOList)) {
			IamPort.paymentCancle(imp);
			return false;
		}
		
		return true;
	}
	
	private boolean otherAction(HttpServletRequest req, UserVO userInfo) {
		String merUid = req.getParameter("merUid");
		String[] proNos = req.getParameterValues("productNo");
		String[] proSel = req.getParameterValues("productSelCnt");

		int[] productNos = Arrays.stream(proNos).mapToInt(Integer::parseInt).toArray();

		String fee = req.getParameter("fee");
		String deliveryReq = req.getParameter("deliveryReq");

		int addrFee = 0;
		if (fee != null) {
			addrFee = Integer.parseInt(fee);
		}
		
		ProductService svc = new ProductServiceImpl();
		AddrService svc3 = new AddrServiceImpl();
		List<AddrVO> addrList = new ArrayList<AddrVO>();
		// productOrderNo정보를 가져오기 위해..
		List<ProductOrderVO> productOrderNo = svc.getProductOrder(productNos, Long.parseLong(merUid), userInfo.getUserNo());
		for (ProductOrderVO vo : productOrderNo) {
			int prOrderNo = vo.getProductOrderNo();
			AddrVO addrVO = new AddrVO();
			addrVO.setProductOrderNo(prOrderNo);
			addrVO.setAddrFee(addrFee);
			addrVO.setAddrAddress(userInfo.getUserAddr());
			addrVO.setAddrRequest(deliveryReq);
			addrVO.setAddrState("0");

			addrList.add(addrVO);
		}

		for (AddrVO vo : addrList) {
			svc3.saveProductAddr(vo);
		}

		// 선택한 장바구니 상품들이 결제완료시 삭제. (만약 삭제가 안되더라도 일단넘어감.)
		MyCartService svc2 = new MyCartServiceImpl();
		svc2.delCartFromPayment(userInfo.getUserNo(), productNos);

		// 재고 감소처리(나중에.. 다중 update처리로 바꿔보자)
		ProductService svct = new ProductServiceImpl();
		for (int i = 0; i < productNos.length; ++i) {
			int count = Integer.parseInt(proSel[i]);
			svct.reduceProductStock(count, productNos[i]);
		}
		
		// session에 저장된 cartList최신화
		Object cartObj = req.getSession().getAttribute("cl");
		if(cartObj != null) {
			List<CartJoinVO> cartList = ((List<CartJoinVO>)cartObj);
			if(cartList != null && cartList.size() > 0) {
				List<CartJoinVO> newCartList = new ArrayList<CartJoinVO>(cartList.size());
				for(CartJoinVO vo : cartList) {
					newCartList.add(vo.clone());
				}
				
				for(int pNo : productNos) {
					for(int i = 0; i < newCartList.size(); ++i) {
						if(newCartList.get(i).getProductNo() == pNo) {
							newCartList.remove(i);
							break;
						}
					}
				}
				req.getSession().setAttribute("cl", newCartList);
			}
		}
		return true;
	}
}
