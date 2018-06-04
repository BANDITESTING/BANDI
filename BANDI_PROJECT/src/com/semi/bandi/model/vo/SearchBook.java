package com.semi.bandi.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SearchBook extends Book implements Serializable{

	private static final long serialVersionUID = 80901L;
	
//	private int    mBook_Uid;  		// Primary Key  [1]
//	private String mISBN;   		// Unique Key   [2]
//	private String mTitle;   		// Title        [3]
//	private int    mPrice;   		// Price        [4]
//	private String mWriterCode;		// WriterCode [5]
//	private int    mQuantity;	  	// Quantity for Book [6]
//	private String mOrigin;  		// Inner or Outer [7]
//	private Date   mIssueDate; 		// When Issue Book [8]
//	private String mGenreCode; 		// GenreCode      [9]
//	private String mIntroduceBook; 	// Introduce about Book [10]
//	private String mImagePath;    	// about Image Name [11]
//	private int    mPage;         	// How many page for book [12]
//	private String mPublisher;    	// Publisher        [13]
	private String mWriter;
	// 차후 평점도 추가

	public SearchBook() {}

	public String getmWriter() {
		return mWriter;
	}

	public void setmWriter(String mWriter) {
		this.mWriter = mWriter;
	}
	
}
