package com.yedamMiddle.myPage.mapper;

import java.util.List;

import com.yedamMiddle.coupon.service.CouponVO;

public interface MyPageMapper {
	List<CouponVO> endCouponList(int userNo);
	List<CouponVO> couponList(int userNo);
}
