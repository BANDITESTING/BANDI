package com.semi.bandi.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable 
{
	private static final long serialVersionUID = 80891L;
	
	private int mUser_UID; // [1] Primary key
	private String mEmail; // [2] Email [char 30]
	private String mPassword; // [3] Password [char 300]
	private String mName; // [4] Name [char 10]
	private String mIdentified; // [5] Identified [int 6]
	private String mPhone;      // [6] Phone Number [13 ~ 15]
	private String mAddress; // [7] Address [char 100]
	private String mGender;   // [8] gender [char 1]
	private String mGrade;  // [9] grade [char 3]
	private String mJob;   //  [10] job [char 3]
	private int mBandi_Point; // [12] Point 
	private Date mJoinDate; //[11] Join Date [Date]
	
	public User(){}

	public User(int mUser_UID, String mEmail, String mPassword, String mName, String mIdentified, String mPhone,
			String mAddress, String mGender, String mGrade, String mJob, int mBandi_Point, Date mJoinDate) {
		super();
		this.mUser_UID = mUser_UID;
		this.mEmail = mEmail;
		this.mPassword = mPassword;
		this.mName = mName;
		this.mIdentified = mIdentified;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mGender = mGender;
		this.mGrade = mGrade;
		this.mJob = mJob;
		this.mBandi_Point = mBandi_Point;
		this.mJoinDate = mJoinDate;
	}

	public User(String mEmail, String mPassword) {
		super();
		this.mEmail = mEmail;
		this.mPassword = mPassword;
	}

	public User(String name, String birth, String phone) 
	{
		this.mName = name;
		this.mIdentified = birth;
		this.mPhone = phone;
	}

	public int getmUser_UID() {
		return mUser_UID;
	}

	public void setmUser_UID(int mUser_UID) {
		this.mUser_UID = mUser_UID;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmIdentified() {
		return mIdentified;
	}

	public void setmIdentified(String mIdentified) {
		this.mIdentified = mIdentified;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmGrade() {
		return mGrade;
	}

	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}

	public String getmJob() {
		return mJob;
	}

	public void setmJob(String mJob) {
		this.mJob = mJob;
	}

	public int getmBandi_Point() {
		return mBandi_Point;
	}

	public void setmBandi_Point(int mBandi_Point) {
		this.mBandi_Point = mBandi_Point;
	}

	public Date getmJoinDate() {
		return mJoinDate;
	}

	public void setmJoinDate(Date mJoinDate) {
		this.mJoinDate = mJoinDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [mUser_UID=" + mUser_UID + ", mEmail=" + mEmail + ", mPassword=" + mPassword + ", mName=" + mName
				+ ", mIdentified=" + mIdentified + ", mPhone=" + mPhone + ", mAddress=" + mAddress + ", mGender="
				+ mGender + ", mGrade=" + mGrade + ", mJob=" + mJob + ", mBandi_Point=" + mBandi_Point + ", mJoinDate="
				+ mJoinDate + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mAddress == null) ? 0 : mAddress.hashCode());
		result = prime * result + mBandi_Point;
		result = prime * result + ((mEmail == null) ? 0 : mEmail.hashCode());
		result = prime * result + ((mGender == null) ? 0 : mGender.hashCode());
		result = prime * result + ((mGrade == null) ? 0 : mGrade.hashCode());
		result = prime * result + ((mIdentified == null) ? 0 : mIdentified.hashCode());
		result = prime * result + ((mJob == null) ? 0 : mJob.hashCode());
		result = prime * result + ((mJoinDate == null) ? 0 : mJoinDate.hashCode());
		result = prime * result + ((mName == null) ? 0 : mName.hashCode());
		result = prime * result + ((mPassword == null) ? 0 : mPassword.hashCode());
		result = prime * result + ((mPhone == null) ? 0 : mPhone.hashCode());
		result = prime * result + mUser_UID;
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
		User other = (User) obj;
		if (mAddress == null) {
			if (other.mAddress != null)
				return false;
		} else if (!mAddress.equals(other.mAddress))
			return false;
		if (mBandi_Point != other.mBandi_Point)
			return false;
		if (mEmail == null) {
			if (other.mEmail != null)
				return false;
		} else if (!mEmail.equals(other.mEmail))
			return false;
		if (mGender == null) {
			if (other.mGender != null)
				return false;
		} else if (!mGender.equals(other.mGender))
			return false;
		if (mGrade == null) {
			if (other.mGrade != null)
				return false;
		} else if (!mGrade.equals(other.mGrade))
			return false;
		if (mIdentified == null) {
			if (other.mIdentified != null)
				return false;
		} else if (!mIdentified.equals(other.mIdentified))
			return false;
		if (mJob == null) {
			if (other.mJob != null)
				return false;
		} else if (!mJob.equals(other.mJob))
			return false;
		if (mJoinDate == null) {
			if (other.mJoinDate != null)
				return false;
		} else if (!mJoinDate.equals(other.mJoinDate))
			return false;
		if (mName == null) {
			if (other.mName != null)
				return false;
		} else if (!mName.equals(other.mName))
			return false;
		if (mPassword == null) {
			if (other.mPassword != null)
				return false;
		} else if (!mPassword.equals(other.mPassword))
			return false;
		if (mPhone == null) {
			if (other.mPhone != null)
				return false;
		} else if (!mPhone.equals(other.mPhone))
			return false;
		if (mUser_UID != other.mUser_UID)
			return false;
		return true;
	}
	
}
