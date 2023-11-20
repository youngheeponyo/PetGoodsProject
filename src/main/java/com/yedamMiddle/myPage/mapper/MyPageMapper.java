package com.yedamMiddle.myPage.mapper;

import java.util.List;

import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.userQna.service.UserQnaVO;

public interface MyPageMapper {
	List<CouponVO> endCouponList(int userNo);
	List<CouponVO> couponList(int userNo);
	List<UserQnaVO> recentQnaList(int userNo);
	List<UserQnaVO> qnaList(int userNo);
}
