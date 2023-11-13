package com.yedamMiddle.notice.mapper;

import java.util.List;

import com.yedamMiddle.notice.service.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> list();
	public NoticeVO select(int NoticeNo);
	public int insert(NoticeVO vo);
	public int update(NoticeVO vo);
	public int delete(int NoticeNo);
	public int updateCnt(int NoticeNo);
}
