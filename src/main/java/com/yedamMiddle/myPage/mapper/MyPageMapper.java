package com.yedamMiddle.myPage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.service.PetVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.userQna.service.UserQnaVO;

public interface MyPageMapper {
	List<CouponVO> endCouponList(int userNo);
	List<CouponVO> couponList(int userNo);
	List<UserQnaVO> recentQnaList(int userNo);
	List<UserQnaVO> qnaList(int userNo);
	public int updateUser(UserVO vo);
	List<ProductOrderJoinVO> orderList(int userNo);
	List<ReviewVO> recentReviewList(int userNo);
	List<ReviewVO> reviewList(int userNo);
	List<PetVO> myPetInfo(int userNo);
	public int insertMyPet(PetVO vo);
	public int updatePw(@Param("userPw") String newPw,@Param("userId") String userId,@Param("userPw") String userPw);
}
