package com.yedamMiddle.common;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class IamPort {
	private static IamportClient api = null;
	private static Object apiLock = new Object();
	
	
	private static void init() {
		synchronized(apiLock) {
			if(api == null) {
				ProductService svc = new ProductServiceImpl();
				ApiInfoVO vo = svc.getApiInfo("IAMPORT");
				api = new IamportClient(vo.getRestKey(), vo.getRestSecretKey());
			}
		}
	}
	
	public static IamportResponse<Payment> paymentByImpUID(String impUid) {
		if(api == null) {
			init();
		}
		
		IamportResponse<Payment> ret = null;
		try {
			ret = api.paymentByImpUid(impUid);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public static void paymentCancle(String impUid) {
		if(api == null) {
			init();
		}

        CancelData cancelData = new CancelData(impUid, true); //imp_uid를 통한 전액취소
        try {
            IamportResponse<Payment> payment_response = api.cancelPaymentByImpUid(cancelData);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
        return;
	}
	
	
}
