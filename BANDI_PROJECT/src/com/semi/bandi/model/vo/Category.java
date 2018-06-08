package com.semi.bandi.model.vo;

import java.io.Serializable;

public class Category implements Serializable 
{
	
	private static final long serialVersionUID = 80891L;

	public Category() { }

	private String cISBN;
	private String cTitle;
	private String cWriter;
	private int cPrice;
	private String cImage;
	private String cIntroduce;
	private String cGenre;
	private String cSubGenre;
	
	public String getcSubGenre() {
		return cSubGenre;
	}

	public void setcSubGenre(String cSubGenre) {
		this.cSubGenre = cSubGenre;
	}


	
	
	public String getcGenre() {
		return cGenre;
	}

	public void setcGenre(String cGenre) {
		this.cGenre = cGenre;
	}

	public Category(String cSubGenre, String cGenre) {
		super();
		this.cGenre = cGenre;
		this.cSubGenre = cSubGenre;
	}

	public Category(String cTitle, String cWriter, int cPrice, String cImage) {
		super();
		this.cTitle = cTitle;
		this.cWriter = cWriter;
		this.cPrice = cPrice;
		this.cImage = cImage;
	}
	
	public Category(String cISBN, String cTitle, String cWriter, int cPrice, String cImage) {
		super();
		this.cISBN = cISBN;
		this.cTitle = cTitle;
		this.cWriter = cWriter;
		this.cPrice = cPrice;
		this.cImage = cImage;
	}
	
	public Category(String cTitle, String cWriter, String cImage, String cIntroduce) {
		super();
		this.cTitle = cTitle;
		this.cWriter = cWriter;
		this.cImage = cImage;
		this.cIntroduce = cIntroduce;
	}
	
	
	public String getcISBN() {
		return cISBN;
	}

	public void setcISBN(String cISBN) {
		this.cISBN = cISBN;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getcIntroduce() {
		return cIntroduce;
	}

	public void setcIntroduce(String cIntroduce) {
		this.cIntroduce = cIntroduce;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcWriter() {
		return cWriter;
	}

	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}

	public int getcPrice() {
		return cPrice;
	}

	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}

	public String getcImage() {
		return cImage;
	}

	public void setcImage(String cImage) {
		this.cImage = cImage;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cImage == null) ? 0 : cImage.hashCode());
		result = prime * result + cPrice;
		result = prime * result + ((cTitle == null) ? 0 : cTitle.hashCode());
		result = prime * result + ((cWriter == null) ? 0 : cWriter.hashCode());
		result = prime * result + ((cWriter == null) ? 0 : cIntroduce.hashCode());
		return result;
	}
    
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		if (cImage == null) {
			if (other.cImage != null)
				return false;
		} else if (!cImage.equals(other.cImage))
			return false;
		if (cPrice != other.cPrice)
			return false;
		if (cTitle == null) {
			if (other.cTitle != null)
				return false;
		} else if (!cTitle.equals(other.cTitle))
			return false;
		if (cWriter == null) {
			if (other.cWriter != null)
				return false;
		} else if (!cWriter.equals(other.cWriter))
			return false;
		if (cIntroduce == null) {
			if (other.cWriter != null)
				return false;
		} else if (!cIntroduce.equals(other.cIntroduce))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Category [cISBN=" + cISBN + ", cTitle=" + cTitle + ", cWriter=" + cWriter + ", cPrice=" + cPrice
				+ ", cImage=" + cImage + ", cIntroduce=" + cIntroduce + ", cGenre=" + cGenre + ", cSubGenre="
				+ cSubGenre + "]";
	}

}
