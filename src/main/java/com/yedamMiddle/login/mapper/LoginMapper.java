package com.yedamMiddle.login.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.KakaoVO;

public interface LoginMapper {
	public int addUser(UserVO vo);
	public UserVO userLogin(@Param("userId") String userId, @Param("userPw")String userPw);
	public int deleteUser(@Param("userId") String userId, @Param("userPw")String userPw);
	public List<UserVO> list();
	public UserVO getUser(int userNo);
	public int kakao(KakaoVO vo);
}
