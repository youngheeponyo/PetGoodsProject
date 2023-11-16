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
		
		//쿠폰데이터 초기화
		//userno x
		
		//회원가입 시 회원가입 쿠폰 서버에서 직접 넣어주기
		//쿠폰종류 3개정도(가입축하쿠폰 10,000원 할인(3만원 이상 구매시), 마이디어펫 생일축하 배송비무료 쿠폰, 플랙프라이데이 30%할인 쿠폰)
		//로그인했는데 그날이 쿠폰 만료날일 시 삭제
	}
}
