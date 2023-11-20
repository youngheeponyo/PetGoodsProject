package com.yedamMiddle.review.mapper;

import java.util.List;

import com.yedamMiddle.review.service.ReviewVO;

public interface ReviewMapper {
	//나의 리뷰 가져오기
	public List<ReviewVO> selectMyReview(int userNo);
	
	//해당상품의 리뷰 가져오기(제품 상세페이지)
	public List<ReviewVO> selectProductReview(int productNo);
	
	//리뷰작성
	public int insertReview(ReviewVO vo);
	
	//리뷰수정
	public int updateReview(ReviewVO vo);
	
	//리뷰삭제
	public int deleteReview(ReviewVO vo);
}
