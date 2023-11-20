package com.yedamMiddle.myPage.service;

import java.util.List;

import com.yedamMiddle.coupon.service.CouponVO;

public interface MyPageService {
	List<CouponVO> endCouponList(int userNo);
	List<CouponVO> couponList(int userNo);
}
