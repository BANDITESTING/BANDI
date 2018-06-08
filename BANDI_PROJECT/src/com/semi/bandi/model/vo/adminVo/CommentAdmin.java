package com.semi.bandi.model.vo.adminVo;

import java.io.Serializable;

public class CommentAdmin implements Serializable
{
	
	private static final long serialVersionUID = 80891L;
	private int mComment_UID;
	private String mCommentBook_Title;
	private String mEmail;
	private String mbook_Comment;
	private String mWritedDate;
	
	public CommentAdmin(){}
	
	public CommentAdmin(int mComment_UID, String mCommentBook_Title, String mEmail, String mbook_Comment,
			String mWritedDate) {
		super();
		this.mComment_UID = mComment_UID;
		this.mCommentBook_Title = mCommentBook_Title;
		this.mEmail = mEmail;
		this.mbook_Comment = mbook_Comment;
		this.mWritedDate = mWritedDate;
	}

	public int getmComment_UID() {
		return mComment_UID;
	}

	public void setmComment_UID(int mComment_UID) {
		this.mComment_UID = mComment_UID;
	}

	public String getmCommentBook_Title() {
		return mCommentBook_Title;
	}

	public void setmCommentBook_Title(String mCommentBook_Title) {
		this.mCommentBook_Title = mCommentBook_Title;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getMbook_Comment() {
		return mbook_Comment;
	}

	public void setMbook_Comment(String mbook_Comment) {
		this.mbook_Comment = mbook_Comment;
	}

	public String getmWritedDate() {
		return mWritedDate;
	}

	public void setmWritedDate(String mWritedDate) {
		this.mWritedDate = mWritedDate;
	}

	@Override
	public String toString() {
		return "CommentAdmin [mComment_UID=" + mComment_UID + ", mCommentBook_Title=" + mCommentBook_Title + ", mEmail="
				+ mEmail + ", mbook_Comment=" + mbook_Comment + ", mWritedDate=" + mWritedDate + "]";
	}
	
}
