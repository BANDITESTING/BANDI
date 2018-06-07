package com.semi.bandi.model.vo.adminVo;

import java.io.Serializable;
import java.sql.Date;

public class AnnualIncome implements Serializable
{
	private static final long serialVersionUID = 80891L;
	
	private Date mOrderDate;
	private int  mSumPrice;
	private int  mOrderCount;
	private int  mPacketPrice;
	private int  mOrderBooksCount;
	
	public AnnualIncome(){}

	public AnnualIncome(Date mOrderDate, int mSumPrice, int mOrderCount, int mPacketPrice, int mOrderBooksCount) {
		super();
		this.mOrderDate = mOrderDate;
		this.mSumPrice = mSumPrice;
		this.mOrderCount = mOrderCount;
		this.mPacketPrice = mPacketPrice;
		this.mOrderBooksCount = mOrderBooksCount;
	}

	public Date getmOrderDate() {
		return mOrderDate;
	}

	public void setmOrderDate(Date mOrderDate) {
		this.mOrderDate = mOrderDate;
	}

	public int getmSumPrice() {
		return mSumPrice;
	}

	public void setmSumPrice(int mSumPrice) {
		this.mSumPrice = mSumPrice;
	}

	public int getmOrderCount() {
		return mOrderCount;
	}

	public void setmOrderCount(int mOrderCount) {
		this.mOrderCount = mOrderCount;
	}

	public int getmPacketPrice() {
		return mPacketPrice;
	}

	public void setmPacketPrice(int mPacketPrice) {
		this.mPacketPrice = mPacketPrice;
	}

	public int getmOrderBooksCount() {
		return mOrderBooksCount;
	}

	public void setmOrderBooksCount(int mOrderBooksCount) {
		this.mOrderBooksCount = mOrderBooksCount;
	}

	@Override
	public String toString() {
		return "AnnualIncome [mOrderDate=" + mOrderDate + ", mSumPrice=" + mSumPrice + ", mOrderCount=" + mOrderCount
				+ ", mPacketPrice=" + mPacketPrice + ", mOrderBooksCount=" + mOrderBooksCount + "]";
	}
	
	
}
