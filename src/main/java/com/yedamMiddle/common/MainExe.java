package com.yedamMiddle.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.admin.mapper.AdminMapper;
import com.yedamMiddle.notice.mapper.NoticeMapper;
import com.yedamMiddle.notice.service.NoticeVO;

public class MainExe {

	public static void main(String[] args) {
		SqlSession sql = Mybatis.getInstance().openSession(true);
		AdminMapper mapper = sql.getMapper(AdminMapper.class);
		
		NoticeMapper nomapper = sql.getMapper(NoticeMapper.class);
		
//		List<UserVO> list = mapper.userList();

		List<NoticeVO> list = nomapper.list();
		list.forEach(vo -> System.out.println(vo));
	}// endmaim
}// end
