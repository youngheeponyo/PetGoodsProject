package com.yedamMiddle.myPage.service;

import java.util.List;

import com.yedamMiddle.common.service.PetVO;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.userQna.service.UserQnaVO;

public interface MyPageService {
	public List<CouponVO> endCouponList(int userNo);
	public List<CouponVO> couponList(int userNo);
	public List<UserQnaVO> recentQnaList(int userNo);
	public List<UserQnaVO> qnaList(int userNo);
	public List<ProductOrderJoinVO> orderList(int userNo);
	public List<ReviewVO> recentReviewList(int userNo);
	public List<ReviewVO> reviewList(int userNo);
	public List<PetVO> petInfo(int userNo);
	public boolean addMyPet(PetVO vo);
}
