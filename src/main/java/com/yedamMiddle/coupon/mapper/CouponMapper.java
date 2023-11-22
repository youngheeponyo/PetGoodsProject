package com.yedamMiddle.coupon.mapper;

import java.util.List;

import com.yedamMiddle.common.service.PetVO;
import com.yedamMiddle.coupon.service.CouponVO;

public interface CouponMapper {

	//신규유저 회원가입시 쿠폰 발급
	public int newUserCouponInsert(int userNo);
	
	//해당 유저번호로 유저의 애완동물 정보 찾기
	public PetVO selectPetByUserNo(int userNo);
	
	//해당 유저번호로 가지고 있는 쿠폰 찾기
	public CouponVO selectCouponByUserNo(int userNo);
	
	//기존 유저 애완동물 생일 시 쿠폰 발급//보류
	public int userBirthCouponInsert(int userNo);
	
	//기존 유저 로그인 시 쿠폰만료
	public int userExpireCouponUpdate();
	
	//마이페이지에서 현재 가지고 있는 쿠폰 보기
	public List<CouponVO> userCouponSelect(int userNo); 
	
	//결제창에서 쿠폰 사용시 쿠폰사용완료
	public int userUseCoupon(CouponVO vo);
	
	public List<CouponVO> selectNotUseCoupon(int userNo);
	
	public int insertCoupon(CouponVO vo);
}
