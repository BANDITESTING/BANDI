package com.semi.bandi.model.vo.detail;

import java.sql.Date;

public class Detail {
	
	private int book_uid; // 가져올꺼
	private String isbn; // 이것도 가져와야되나
	private int price; // 가져올꺼
	private String title; // 가져올꺼
	private String writer_code; 
	private String publisher; // 가져올꺼
	private int book_quantity; // 가져올꺼
	private String genre_code;
	private String origin; // 가져올꺼
	private String book_introduce; // 가져올꺼
	private int page; // 가져올꺼
	private String image; // 가져올꺼
	private Date issue_date; // 가져올꺼
	private String writer_name; // 가져올꺼
	private String writer_introduce; // 가져올꺼
	private String genre; // 가져올꺼 
	private String sub_genre;// 가져올꺼
	
	public Detail(String image){
		this.image = image;
	}
	
	public Detail(int book_uid, int price, String title, String publisher, int book_quantity, String origin,
			String book_introduce, int page, String image, Date issue_date, String writer_name, String writer_introduce,
			String genre, String sub_genre, String isbn) {
		super();
		this.book_uid = book_uid;
		this.price = price;
		this.title = title;
		this.publisher = publisher;
		this.book_quantity = book_quantity;
		this.origin = origin;
		this.book_introduce = book_introduce;
		this.page = page;
		this.image = image;
		this.issue_date = issue_date;
		this.writer_name = writer_name;
		this.writer_introduce = writer_introduce;
		this.genre = genre;
		this.sub_genre = sub_genre;
		this.isbn = isbn;
	}


	public Detail(int book_uid, String isbn, int price, String title, String writer_code, String publisher,
			int book_quantity, String genre_code, String origin, String book_introduce, int page, String image,
			Date issue_date) {
		super();
		this.book_uid = book_uid;
		this.isbn = isbn;
		this.price = price;
		this.title = title;
		this.writer_code = writer_code;
		this.publisher = publisher;
		this.book_quantity = book_quantity;
		this.genre_code = genre_code;
		this.origin = origin;
		this.book_introduce = book_introduce;
		this.page = page;
		this.image = image;
		this.issue_date = issue_date;
	}
	
	
	public Detail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBook_uid() {
		return book_uid;
	}
	public void setBook_uid(int book_uid) {
		this.book_uid = book_uid;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter_code() {
		return writer_code;
	}
	public void setWriter_code(String writer_code) {
		this.writer_code = writer_code;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getBook_quantity() {
		return book_quantity;
	}
	public void setBook_quantity(int book_quantity) {
		this.book_quantity = book_quantity;
	}
	public String getGenre_code() {
		return genre_code;
	}
	public void setGenre_code(String genre_code) {
		this.genre_code = genre_code;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getBook_introduce() {
		return book_introduce;
	}
	public void setBook_introduce(String book_introduce) {
		this.book_introduce = book_introduce;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(Date issue_date) {
		this.issue_date = issue_date;
	}


	public String getWriter_name() {
		return writer_name;
	}


	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}


	public String getWriter_introduce() {
		return writer_introduce;
	}


	public void setWriter_introduce(String writer_introduce) {
		this.writer_introduce = writer_introduce;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getSub_genre() {
		return sub_genre;
	}


	public void setSub_genre(String sub_genre) {
		this.sub_genre = sub_genre;
	}
	
	
}
