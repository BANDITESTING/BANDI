package com.semi.bandi.model.vo.mainVo;

import java.io.Serializable;

import com.semi.bandi.model.vo.Book;

public class RankedBookInfo extends Book implements Serializable
{
	private static final long serialVersionUID = 80891L;
	
	private double avgPoint;
	private String writerName;
	
	public RankedBookInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public double getAvgPoint() {
		return avgPoint;
	}
	public void setAvgPoint(double avgPoint) {
		this.avgPoint = avgPoint;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RankedBookInfo [avgPoint=" + avgPoint + ", writerName=" + writerName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		long temp;
		temp = Double.doubleToLongBits(avgPoint);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((writerName == null) ? 0 : writerName.hashCode());
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
		RankedBookInfo other = (RankedBookInfo) obj;
		if (Double.doubleToLongBits(avgPoint) != Double.doubleToLongBits(other.avgPoint))
			return false;
		if (writerName == null) {
			if (other.writerName != null)
				return false;
		} else if (!writerName.equals(other.writerName))
			return false;
		return true;
	}
	
}
