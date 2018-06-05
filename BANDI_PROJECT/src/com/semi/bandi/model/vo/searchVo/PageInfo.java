package com.semi.bandi.model.vo.searchVo;

import java.io.Serializable;

public class PageInfo implements Serializable {
	
	private static final long serialVersionUId = 4L;
	
	private int startPage;			// 한번에 표시될 게시글들의 시작 페이지
	private int endPage;			// 한번에 표시될 게시글들의 마지막 페이지
	private int maxPage;			// 전체 페이지의 마지막 페이지
	private int currentPage; 		// 현재 페이지
	private int listCount;			// 전체 게시물 숫 
	private int b_size;				// 한 페이지당 게시글 수
	private int p_size;				// 한번에 보여줄 페이지 수
	
	public PageInfo() {}

	public PageInfo(int startPage, int endPage, int maxPage, int currentPage, int listCount, int b_size, int p_size) {
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.b_size = b_size;
		this.p_size = p_size;
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

	public int getB_size() {
		return b_size;
	}

	public void setB_size(int b_size) {
		this.b_size = b_size;
	}

	public int getP_size() {
		return p_size;
	}

	public void setP_size(int p_size) {
		this.p_size = p_size;
	}

}
