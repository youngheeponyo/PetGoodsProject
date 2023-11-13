package com.yedamMiddle.common.service;

import java.util.ArrayList;
import java.util.List;

public class GenCoupon {
	private static ArrayList<CouponVO> welcomCouponList;
	private static Object couponLock = new Object();
	private GenCoupon() { }
	
	@SuppressWarnings("unchecked")
	public static ArrayList<CouponVO> getCouponList() {
		if(welcomCouponList == null) {
			synchronized(couponLock) {
				if(welcomCouponList == null) {
					initCouponList();
				}
			}
		}
		
		return (ArrayList<CouponVO>)welcomCouponList.clone();
	}
	
	// 데이터 넣을 쿠폰 초기화 구현
	private static void initCouponList() {
		welcomCouponList = new ArrayList<CouponVO>();
		
	
	}
}
