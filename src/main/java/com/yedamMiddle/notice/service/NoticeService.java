package com.yedamMiddle.notice.service;

import java.util.List;

public interface NoticeService {
	public List<NoticeVO> noticeList();
	public NoticeVO getNotice(int NoticeNo);
	public boolean addNotice(NoticeVO vo);
	public boolean editNotice(NoticeVO vo);
	public boolean removeNotice(int NoticeNo);
	
}
