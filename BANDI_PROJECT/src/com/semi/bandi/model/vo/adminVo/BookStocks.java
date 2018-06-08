package com.semi.bandi.model.vo.adminVo;

import java.io.Serializable;

import com.semi.bandi.model.vo.Book;

public class BookStocks extends Book implements Serializable 
{
	private static final long serialVersionUID = 80891L;
	
	private String mWriterName;
	
	public BookStocks(){}

	public BookStocks(String mWriterName) {
		super();
		this.mWriterName = mWriterName;
	}

	public String getmWriterName() {
		return mWriterName;
	}

	public void setmWriterName(String mWriterName) {
		this.mWriterName = mWriterName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
