package com.yedamMiddle.coupon.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.PetVO;
import com.yedamMiddle.coupon.mapper.CouponMapper;
import com.yedamMiddle.coupon.service.CouponService;
import com.yedamMiddle.coupon.service.CouponVO;

public class CouponServiceImpl implements CouponService {
	SqlSession sqlSession = Mybatis.getInstance().openSession(true);
	CouponMapper mapper = sqlSession.getMapper(CouponMapper.class);

	@Override
	public int newUserCouponInsert(int userNo) {
		return mapper.newUserCouponInsert(userNo);
	}

	@Override
	public PetVO selectPetByUserNo(int userNo) {
		return mapper.selectPetByUserNo(userNo);
	}
	
	@Override
	public CouponVO selectCouponByUserNo(int userNo) {
		return mapper.selectCouponByUserNo(userNo);
	}
	
	@Override
	public int userBirthCouponInsert(int userNo) {
		return mapper.userBirthCouponInsert(userNo);
	}

	@Override
	public int userExpireCouponUpdate() {
		return mapper.userExpireCouponUpdate();
	}

	@Override
	public List<CouponVO> userCouponSelect(int userNo) {
		return mapper.userCouponSelect(userNo);
	}

	@Override
	public int userUseCoupon(CouponVO vo) {
		return mapper.userUseCoupon(vo);
	}

	@Override
	public List<CouponVO> getNotUseCoupon(int userNo) {
		// TODO Auto-generated method stub
		return mapper.selectNotUseCoupon(userNo);
	}





}
