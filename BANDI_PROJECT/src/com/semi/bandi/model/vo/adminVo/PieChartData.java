package com.semi.bandi.model.vo.adminVo;

import java.io.Serializable;

public class PieChartData implements Serializable
{
	private static final long serialVersionUID = 80891L;
	
	private String label;
	private int data;
	
	public PieChartData(){}

	public PieChartData(String label, int data) {
		super();
		this.label = label;
		this.data = data;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public int getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
