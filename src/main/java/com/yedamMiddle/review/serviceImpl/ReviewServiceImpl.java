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
		return mapper.selectMyReview(userNo);
	}

	@Override
	public List<ReviewVO> selectProductReview(int productNo) {
		return mapper.selectProductReview(productNo);
	}
	
	@Override
	public ReviewVO selectDetailReview(int reviewNo) {
		return mapper.selectDetailReview(reviewNo);
	}
	

	@Override
	public ReviewVO selectDetailReviewByProductNo(long merUid, int productNo) {
		return mapper.selectDetailReviewByProductNo(merUid, productNo);
	}
	

	@Override
	public int insertReview(ReviewVO vo) {
		return mapper.insertReview(vo);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return mapper.updateReview(vo);
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		return mapper.deleteReview(vo);
	}

	@Override
	public int updateReviewLikeCnt(ReviewVO vo) {
		return mapper.updateReviewLikeCnt(vo);
	}




}
