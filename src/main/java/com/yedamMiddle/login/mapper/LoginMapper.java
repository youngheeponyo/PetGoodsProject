package com.yedamMiddle.login.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.service.UserVO;

public interface LoginMapper {
	public int addUser(UserVO vo);
	public UserVO userLogin(@Param("userId") String userId, @Param("userPw")String userPw);
	public int deleteUser(@Param("userId") String userId, @Param("userPw")String userPw);
	public List<UserVO> list();
}
