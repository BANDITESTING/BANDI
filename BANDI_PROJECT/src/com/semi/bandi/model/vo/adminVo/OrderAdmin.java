package com.semi.bandi.model.vo.adminVo;

import java.io.Serializable;

public class OrderAdmin implements Serializable
{
	private static final long serialVersionUID = 80891L;
	
	private String mOrder_UID;
	private String mEmail;
	private String mName;
	private String mTel;
	private String mOrder_Date;
	
	public OrderAdmin(){}

	public OrderAdmin(String mOrder_UID, String mEmail, String mName, String mTel, String mOrder_Date) {
		super();
		this.mOrder_UID = mOrder_UID;
		this.mEmail = mEmail;
		this.mName = mName;
		this.mTel = mTel;
		this.mOrder_Date = mOrder_Date;
	}

	public String getmOrder_UID() {
		return mOrder_UID;
	}

	public void setmOrder_UID(String mOrder_UID) {
		this.mOrder_UID = mOrder_UID;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmTel() {
		return mTel;
	}

	public void setmTel(String mTel) {
		this.mTel = mTel;
	}

	public String getmOrder_Date() {
		return mOrder_Date;
	}

	public void setmOrder_Date(String mOrder_Date) {
		this.mOrder_Date = mOrder_Date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "OrderAdmin [mOrder_UID=" + mOrder_UID + ", mEmail=" + mEmail + ", mName=" + mName + ", mTel=" + mTel
				+ ", mOrder_Date=" + mOrder_Date + "]";
	}
	
	
}
