package com.semi.bandi.model.vo.joinVo;

public class Join {
	private String email;
	private String pwd;
	private String name;
	private String gender;
	private String birth;
	private String address;
	private String phone;
	public Join() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Join(String email, String pwd, String name, String gender, String birth, String address, String phone) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.address = address;
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Join [email=" + email + ", pwd=" + pwd + ", name=" + name + ", gender=" + gender + ", birth=" + birth
				+ ", address=" + address + ", phone=" + phone + "]";
	}
	
}