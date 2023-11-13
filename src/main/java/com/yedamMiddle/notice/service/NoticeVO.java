package com.yedamMiddle.notice.service;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private Date noticeDate;
	private int noticeView;
	private String noticeContent;
	
}
