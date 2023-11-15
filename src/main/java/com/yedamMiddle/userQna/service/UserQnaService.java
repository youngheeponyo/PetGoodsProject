package com.yedamMiddle.userQna.service;

import java.util.List;

import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;

public interface UserQnaService {
	
	//목록보기, 상세조회
	public List<UserQnaVO> userQnaAllList();
	public UserQnaVO userQnaSelect(UserQnaVO vo);
	//글 번호로 작성유저 찾기
	public UserVO qnaToSelectUser(UserQnaVO vo);
	//관리자가 문의답변 추가(내용수정)
	public int replyUpdate(UserQnaVO vo);
	
	
	//유저 게시글 등록, 수정, 삭제
	public int userQnaInsert(UserQnaVO vo);
	public int userQnaUpdate(UserQnaVO vo);
	public int userQnaDelete(UserQnaVO vo);
	
	
	//관리자 게시글 수정(답변 및 답변상태)
	public int adminQnaUpdate(UserQnaVO vo);
	
	//Qna등록 시 입력한 상품번호로 상품명 찾기
	public ProductVO productNoToSelectProduct(UserQnaVO vo);
	

}