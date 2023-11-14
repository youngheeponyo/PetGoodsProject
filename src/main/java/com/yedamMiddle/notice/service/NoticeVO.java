package com.yedamMiddle.notice.service;

import java.util.Date;

//import lombok.Data;

//@Data
public class NoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private Date noticeDate;
	private int noticeView;
	private String noticeContent;

	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeView() {
		return noticeView;
	}
	public void setNoticeView(int noticeView) {
		this.noticeView = noticeView;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeDate=" + noticeDate
				+ ", noticeView=" + noticeView + ", noticeContent=" + noticeContent + "]";
	}
	
}
