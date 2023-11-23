package com.yedamMiddle.common.service;

import java.util.Date;

//import lombok.Data;

//@Data
public class PetVO {
	private int petNo;
	private String petName;
	private String petType;
	private Date petBirth;
	private String petGender;
	private int userNo;
	
	
	public int getPetNo() {
		return petNo;
	}
	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	public Date getPetBirth() {
		return petBirth;
	}
	public void setPetBirth(Date petBirth) {
		this.petBirth = petBirth;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "PetVO [petNo=" + petNo + ", petName=" + petName + ", petType=" + petType + ", petBirth=" + petBirth
				+ ", petGender=" + petGender + ", userNo=" + userNo + "]";
	}
	
	
	
}
