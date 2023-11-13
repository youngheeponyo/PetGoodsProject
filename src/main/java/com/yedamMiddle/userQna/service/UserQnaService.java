package com.yedamMiddle.userQna.service;

import java.util.List;

public interface UserQnaService {
	
	//목록보기, 상세조회
	public List<UserQnaVO> userQnaAllList();
	public UserQnaVO userQnaSelect(int qnaNo, int pw);
	
	
	//유저 게시글 등록, 수정, 삭제
	public int userQnaInsert(UserQnaVO vo);
	public int userQnaUpdate(int qnaNo, int password);
	public int userQnaDelete(UserQnaVO vo);
	
	
	//관리자 게시글 수정(답변 및 답변상태)
	public int adminQnaUpdate(UserQnaVO vo);
	
}