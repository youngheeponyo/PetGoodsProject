package com.yedamMiddle.addr.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.addr.mapper.AddrMapper;
import com.yedamMiddle.addr.service.AddrService;
import com.yedamMiddle.addr.service.AddrVO;
import com.yedamMiddle.common.Mybatis;

public class AddrServiceImpl implements AddrService {
	private SqlSession sql = Mybatis.getInstance().openSession(true);
	private AddrMapper mapper = sql.getMapper(AddrMapper.class);
	@Override
	public boolean saveProductAddr(AddrVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertAddr(vo) > 0;
	}

}
