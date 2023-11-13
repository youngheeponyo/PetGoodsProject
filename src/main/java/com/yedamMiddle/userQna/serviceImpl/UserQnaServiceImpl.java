package com.yedamMiddle.userQna.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.userQna.mapper.UserQnaMapper;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;


public class UserQnaServiceImpl implements UserQnaService {
	SqlSession sqlSession = Mybatis.getInstance().openSession(true);
	//true는 자동커밋
	UserQnaMapper mapper = sqlSession.getMapper(UserQnaMapper.class);
	//ListMapper.java 사용함

	@Override
	public List<UserQnaVO> userQnaAllList() {
		return mapper.userQnaAllList();
	}

	@Override
	public UserQnaVO userQnaSelect(int qnaNo, int password) {
		return mapper.userQnaSelect(qnaNo, password);
	}

	@Override
	public int userQnaInsert(UserQnaVO vo) {
		return mapper.userQnaInsert(vo);
	}

	@Override
	public int userQnaUpdate(int qnaNo, int password) {
		return mapper.userQnaUpdate(qnaNo, password);
	}

	@Override
	public int userQnaDelete(UserQnaVO vo) {
		return mapper.userQnaDelete(vo);
	}

	@Override
	public int adminQnaUpdate(UserQnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.adminQnaUpdate(vo);
	}





}
