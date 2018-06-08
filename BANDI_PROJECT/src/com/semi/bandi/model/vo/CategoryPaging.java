package com.semi.bandi.model.vo;

public class CategoryPaging {
	
	private int currentPage;
	private int listCount;
	private int limit;
	private int startPage;
	private int endPage;
	private int maxPage;
	
	public CategoryPaging() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CategoryPaging(int currentPage, int listCount, int limit, int startPage, int endPage, int maxPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
	}
	

	public CategoryPaging(int listCount) {
		super();
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
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

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "CategoryPaging [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage + "]";
	}
	
	
	
	

}
