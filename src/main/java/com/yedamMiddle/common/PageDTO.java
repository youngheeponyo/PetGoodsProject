package com.yedamMiddle.common;

public class PageDTO {
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getShowContentCnt() {
		return showContentCnt;
	}

	public void setShowContentCnt(int showContentCnt) {
		this.showContentCnt = showContentCnt;
	}

	private int total; // 전체건수
	private int currentPage; // 현재페이지
	private boolean next,prev; // 이전, 이후
	private int startPage, endPage;
	private int lastPage; // 실제 마지막 페이지
	private int boardNo;
	private int showContentCnt;
	
	// 11p 13p 20p
	public PageDTO(int boardNo, int total, int currentPage, int showContentCnt) {
		this.currentPage = currentPage;
		this.showContentCnt = showContentCnt;
		this.lastPage = (int)Math.ceil(((double)total / showContentCnt));
		
		this.boardNo = boardNo;
		this.total = total;

		this.endPage = (int)Math.ceil(currentPage / 10.0)  * 10;
		this.startPage = this.endPage - 9;
		
		this.endPage = this.endPage > this.lastPage ? this.lastPage : this.endPage;
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.lastPage;		
	}

	@Override
	public String toString() {
		return "PageDTO [total=" + total + ", currentPage=" + currentPage + ", next=" + next + ", prev=" + prev
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", lastPage=" + lastPage + ", boardNo="
				+ boardNo + ", showContentCnt=" + showContentCnt + "]";
	}
}
