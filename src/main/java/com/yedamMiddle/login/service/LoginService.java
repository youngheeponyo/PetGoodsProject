package com.yedamMiddle.login.service;

import com.yedamMiddle.common.service.UserVO;

public interface LoginService {
	public boolean addUser(UserVO vo);
	public boolean deleteUser(String userId,String userPW);
	public UserVO loginUser(String userId,String userPw);
	
}
