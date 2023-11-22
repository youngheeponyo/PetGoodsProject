package com.yedamMiddle.login.mapper;


import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.service.UserVO;

public interface LoginMapper {
	public int addUser(UserVO vo);
	public UserVO userLogin(@Param("userId") String userId, @Param("userPw")String userPw);
	public int deleteUser(@Param("userId") String userId, @Param("userPw")String userPw);
	public List<UserVO> list();
	public UserVO getUser(int userNo);
	public UserVO idCheck(String userId);
	public UserVO findId(@Param("nickName") String nickName, @Param("userPhone")String userPhone);
	public UserVO findPw(@Param("userId") String userId, @Param("userPhone")String userPhone);
	public int updatePw(@Param("userPw")String userPw,@Param("userId") String userId);
	public UserVO userInfo(String userId);
}
