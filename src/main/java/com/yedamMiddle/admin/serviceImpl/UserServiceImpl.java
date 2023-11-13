package com.yedamMiddle.admin.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.admin.mapper.AdminMapper;
import com.yedamMiddle.admin.service.UserService;
import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.UserVO;

public class UserServiceImpl implements UserService {
	SqlSession sql = Mybatis.getInstance().openSession(true);
	AdminMapper mapper = sql.getMapper(AdminMapper.class);

	@Override
	public List<UserVO> userList() {
		return mapper.userList();
	}
	
}
