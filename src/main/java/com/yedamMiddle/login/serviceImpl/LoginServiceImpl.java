package com.yedamMiddle.login.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.mapper.LoginMapper;
import com.yedamMiddle.login.service.KakaoVO;
import com.yedamMiddle.login.service.LoginService;

public class LoginServiceImpl implements LoginService{
	SqlSession sql = Mybatis.getInstance().openSession(true);
	LoginMapper mapper = sql.getMapper(LoginMapper.class);

	@Override
	public boolean addUser(UserVO vo) {
		return mapper.addUser(vo) == 1;
	}

	@Override
	public boolean deleteUser(String userId, String userPW) {
		return mapper.deleteUser(userId, userPW) == 1;
	}

	@Override
	public UserVO loginUser(String userId, String userPw) {
		return mapper.userLogin(userId, userPw);
	}

	@Override
	public UserVO getUserInfo(int userNo) {
		// TODO Auto-generated method stub
		return mapper.getUser(userNo);
	}
	
	@Override
	public List<UserVO> list() {
		return mapper.list();
	}
	
	@Override
	public UserVO idCheck(String userId) {
		return mapper.idCheck(userId);
	}
}
