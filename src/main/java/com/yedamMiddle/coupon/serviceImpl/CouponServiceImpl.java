package com.yedamMiddle.coupon.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
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
	public int userBirthCouponInsert(CouponVO vo) {
		return mapper.userBirthCouponInsert(vo);
	}

	@Override
	public int userExpireCouponUpdate() {
		return mapper.userExpireCouponUpdate();
	}

	@Override
	public List<CouponVO> userCouponSelect(CouponVO vo) {
		return mapper.userCouponSelect(vo);
	}

	@Override
	public int userUseCoupon(CouponVO vo) {
		return mapper.userUseCoupon(vo);
	}

}
