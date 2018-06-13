package com.semi.bandi.model.vo.searchVo;

import java.io.Serializable;

import com.semi.bandi.model.vo.Book;

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
	private double mRating;
	private int mCommentCount;
	private String mIssueYear;
	private String mIssueMonth;

	public SearchBook() {}

	public String getmWriter() {
		return mWriter;
	}

	public void setmWriter(String mWriter) {
		this.mWriter = mWriter;
	}
	
	public double getmRating() {
		return mRating;
	}
	
	public void setmRating(double mRating) {
		this.mRating = mRating;
	}

	public int getmCommentCount() {
		return mCommentCount;
	}

	public void setmCommentCount(int mCommentCount) {
		this.mCommentCount = mCommentCount;
	}

	public String getmIssueYear() {
		return mIssueYear;
	}

	public void setmIssueYear(String mIssueYear) {
		this.mIssueYear = mIssueYear;
	}

	public String getmIssueMonth() {
		return mIssueMonth;
	}

	public void setmIssueMonth(String mIssueMonth) {
		this.mIssueMonth = mIssueMonth;
	}
	
}
