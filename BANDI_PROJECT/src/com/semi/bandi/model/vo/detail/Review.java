package com.semi.bandi.model.vo.detail;

import java.sql.Date;

public class Review {
	private String isbn;
	private int book_uid;
	private int user_uid;
	private String book_comment; 
	private int rateing;
	private String name; 
	private Date writeDate;
	private String comment_title;
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Review(String book_comment, int rateing) {
		super();
		this.book_comment = book_comment;
		this.rateing = rateing;
	}

	public Review(int book_uid, int user_uid, String name, String book_comment, int rateing) {
		super();
		this.name = name;
		this.book_uid = book_uid;
		this.user_uid = user_uid;
		this.book_comment = book_comment;
		this.rateing = rateing;
		
		
	}
	

	public Review(int book_uid, int user_uid, String name,  String comment_title, String book_comment, int rateing, Date writeDate) {
		super();
		this.name = name;
		this.book_uid = book_uid;
		this.user_uid = user_uid;
		this.book_comment = book_comment;
		this.rateing = rateing;
		this.writeDate = writeDate;
		this.comment_title = comment_title;
	}

	public Review(String isbn, int book_uid, int user_uid, String book_comment, int rateing, String name,
			Date writeDate) {
		super();
		this.isbn = isbn;
		this.book_uid = book_uid;
		this.user_uid = user_uid;
		this.book_comment = book_comment;
		this.rateing = rateing;
		this.name = name;
		this.writeDate = writeDate;
	}
	
	
	
	public String getIsbn() {
		return isbn;
	}



	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}



	public int getBook_uid() {
		return book_uid;
	}



	public void setBook_uid(int book_uid) {
		this.book_uid = book_uid;
	}



	public int getUser_uid() {
		return user_uid;
	}



	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}



	public String getBook_comment() {
		return book_comment;
	}



	public void setBook_comment(String content) {
		this.book_comment = content;
	}



	public int getRateing() {
		return rateing;
	}



	public void setRateing(int rateing) {
		this.rateing = rateing;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public Date getWriteDate() {
		return writeDate;
	}



	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}



	public String getComment_title() {
		return comment_title;
	}



	public void setComment_title(String comment_title) {
		this.comment_title = comment_title;
	}
	
	
}
