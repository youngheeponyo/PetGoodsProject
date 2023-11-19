package com.yedamMiddle.coupon.mapper;

import java.util.List;

import com.yedamMiddle.coupon.service.CouponVO;

public interface CouponMapper {

	//신규유저 회원가입시 쿠폰 발급
	public int newUserCouponInsert(CouponVO vo);
	
	//기존 유저 애완동물 생일 시 쿠폰 발급//보류
	public int userBirthCouponInsert(CouponVO vo);
	
	//기존 유저 로그인 시 쿠폰만료
	public int userExpireCouponUpdate(CouponVO vo);
	
	//마이페이지에서 현재 가지고 있는 쿠폰 보기
	public List<CouponVO> userCouponSelect(CouponVO vo); 
}
