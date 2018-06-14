package com.semi.bandi.model.vo.detail;

public class Top4 {
	private String image;
	private String rNum;
	private String isbn;
	public Top4(String image, String rNum, String isbn) {
		super();
		this.image = image;
		this.rNum = rNum;
		this.isbn = isbn;
	}
	public Top4() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String string) {
		this.rNum = string;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	
}
