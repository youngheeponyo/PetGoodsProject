package com.yedamMiddle.userQna.service;

import java.util.List;

import com.yedamMiddle.common.service.CategoryVO;
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
	
	//다음 qnaNO가져오기(시퀀스)
	public int getMaxQnaNo();
	
	//session에 담긴 uno를 통해 해당번호의 유저 정보 가져오기
	public UserVO unoToSelectUser(int uno);
	
	//전체 상품 이름 가져오기
	
	//1.카테고리 넘버를 뽑고 그 넘버에 2.해당하는 상품을 정렬해서 보여줌
	//1.카테고리 넘버를 뽑고 그 넘버에 2.해당하는 상품을 정렬해서 보여줌
	public List<CategoryVO> categoryNoList();
	public List<ProductVO> productNameList();
}