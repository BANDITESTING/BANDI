package com.semi.bandi.model.vo;

public class OrderTable 
{
	String orderUID;
	int bookUID;
	int amout;
	int price;
	String image;
	String title;
	int cnt;
	
	public OrderTable(){}
	
	public OrderTable(String orderUID, int bookUID, int amout) {
		super();
		this.orderUID = orderUID;
		this.bookUID = bookUID;
		this.amout = amout;
	}

	public OrderTable(String orderUID, int bookUID, int amout, int price, String image, String title) {
		super();
		this.orderUID = orderUID;
		this.bookUID = bookUID;
		this.amout = amout;
		this.price = price;
		this.image = image;
		this.title = title;
	}

	public String getOrderUID() {
		return orderUID;
	}

	public void setOrderUID(String orderUID) {
		this.orderUID = orderUID;
	}

	public int getBookUID() {
		return bookUID;
	}

	public void setBookUID(int bookUID) {
		this.bookUID = bookUID;
	}

	public int getAmout() {
		return amout;
	}

	public void setAmout(int amout) {
		this.amout = amout;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "OrderTable [orderUID=" + orderUID + ", bookUID=" + bookUID + ", amout=" + amout + ", price=" + price
				+ ", image=" + image + ", title=" + title + ", cnt=" + cnt + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + amout;
		result = prime * result + bookUID;
		result = prime * result + ((orderUID == null) ? 0 : orderUID.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		OrderTable other = (OrderTable) obj;
		if (amout != other.amout) {
			return false;
		}
		if (bookUID != other.bookUID) {
			return false;
		}
		if (orderUID == null) {
			if (other.orderUID != null) {
				return false;
			}
		} else if (!orderUID.equals(other.orderUID)) {
			return false;
		}
		return true;
	}
	
}
