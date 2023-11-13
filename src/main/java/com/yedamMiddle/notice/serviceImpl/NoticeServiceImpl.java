package com.yedamMiddle.notice.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.notice.mapper.NoticeMapper;
import com.yedamMiddle.notice.service.NoticeService;
import com.yedamMiddle.notice.service.NoticeVO;

public class NoticeServiceImpl implements NoticeService{
	SqlSession sql = Mybatis.getInstance().openSession(true); 
	NoticeMapper mapper = sql.getMapper(NoticeMapper.class);

	@Override
	public List<NoticeVO> noticeList() {
		return mapper.list();
	}

	@Override
	public NoticeVO getNotice(int NoticeNo) {
		mapper.updateCnt(NoticeNo);
		return mapper.select(NoticeNo);
	}

	@Override
	public boolean addNotice(NoticeVO vo) {
		return mapper.insert(vo) == 1;
	}

	@Override
	public boolean editNotice(NoticeVO vo) {
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean removeNotice(int NoticeNo) {
		return mapper.delete(NoticeNo) == 1;
	}

}
