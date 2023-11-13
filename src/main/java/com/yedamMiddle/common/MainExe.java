package com.yedamMiddle.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.admin.mapper.AdminMapper;
import com.yedamMiddle.common.service.UserVO;

public class MainExe {

	public static void main(String[] args) {
		SqlSession sql = Mybatis.getInstance().openSession(true);
		AdminMapper mapper = sql.getMapper(AdminMapper.class);
		
		List<UserVO> list = mapper.userList();
		list.forEach(vo -> System.out.println(vo));

	}// endmaim
}// end
