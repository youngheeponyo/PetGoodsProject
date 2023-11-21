package com.yedamMiddle.myPage.service;

import java.util.List;

import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.userQna.service.UserQnaVO;

public interface MyPageService {
	List<CouponVO> endCouponList(int userNo);
	List<CouponVO> couponList(int userNo);
	List<UserQnaVO> recentQnaList(int userNo);
	List<UserQnaVO> qnaList(int userNo);
	public boolean updateUser(UserVO vo);
	List<ProductOrderJoinVO> orderList(int userNo);
	List<ReviewVO> recentReviewList(int userNo);
	List<ReviewVO> reviewList(int userNo);
}
