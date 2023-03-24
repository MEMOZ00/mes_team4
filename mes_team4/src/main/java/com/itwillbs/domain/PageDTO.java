package com.itwillbs.domain;

public class PageDTO {
	private int pageSize;
	private String PageNum;
	private int currentPage;
	private int startRow;
	private int endRow;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int count;
	private int pageCount;
	private String search;
	
	
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return PageNum;
	}
	public void setPageNum(String pageNum) {
		PageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "PageDTO [pageSize=" + pageSize + ", PageNum=" + PageNum + ", currentPage=" + currentPage + ", startRow="
				+ startRow + ", endRow=" + endRow + ", pageBlock=" + pageBlock + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", count=" + count + ", pageCount=" + pageCount + ", search=" + search + "]";
	}
}
