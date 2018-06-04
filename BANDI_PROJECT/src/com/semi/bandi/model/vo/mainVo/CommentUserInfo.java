package com.semi.bandi.model.vo.mainVo;

import java.io.Serializable;

import com.semi.bandi.model.vo.Comment;

public class CommentUserInfo extends Comment implements Serializable
{
	private static final long serialVersionUID = 80891L;
	private String eMail;
	
	public CommentUserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentUserInfo(String eMail) {
		super();
		this.eMail = eMail;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CommentUserInfo [eMail=" + eMail + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((eMail == null) ? 0 : eMail.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentUserInfo other = (CommentUserInfo) obj;
		if (eMail == null) {
			if (other.eMail != null)
				return false;
		} else if (!eMail.equals(other.eMail))
			return false;
		return true;
	}
	
}
