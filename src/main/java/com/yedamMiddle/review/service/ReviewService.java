package com.yedamMiddle.review.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReviewService {
	
	//나의 리뷰 가져오기
	public List<ReviewVO> selectMyReview(int userNo);
	
	//해당상품의 리뷰 가져오기(제품 상세페이지)
	public List<ReviewVO> selectProductReview(int productNo);
	
	//나의 리뷰번호에 따른 상세리뷰 가져오기
	public ReviewVO selectDetailReview(int reviewNo);
	
	//주문번호와 상품번호로 구매정보가져오기
	public ReviewVO selectDetailReviewByProductNo(@Param("mUid") long merUid, @Param("pNo")int productNo);
		
	//리뷰작성
	public int insertReview(ReviewVO vo);
	
	//리뷰수정
	public int updateReview(ReviewVO vo);
	
	//리뷰삭제
	public int deleteReview(ReviewVO vo);
	
	//좋아요 수 증가
	public int updateReviewLikeCnt(ReviewVO vo);

}
