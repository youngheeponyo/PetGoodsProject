package com.yedamMiddle.review.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.review.mapper.ReviewMapper;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	SqlSession sqlSession = Mybatis.getInstance().openSession(true);
	ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
	
	@Override
	public List<ReviewVO> selectMyReview(int userNo) {
		return mapper.selectProductReview(userNo);
	}

	@Override
	public List<ReviewVO> selectProductReview(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
