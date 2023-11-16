package com.yedamMiddle.addr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.addr.service.AddrVO;

public interface AddrMapper {
	public int insertAddr(AddrVO vo);
}
