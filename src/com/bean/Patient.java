package com.bean;

import java.util.Date;

//Patient class

public class Patient {
	
	private int SSNId;
	private int PatientId;
	private String PatientName;
	private int age;
	private Date DOJ;
	private String BedType;
	private String address;
	private String city;
	private String State;
	private String status;
	private int bill;

	
	public int getSSNId() {
		return SSNId;
	}
	public void setSSNId(int SSNId) {
		this.SSNId = SSNId;
	}
	public int getPatientId() {
		return PatientId;
	}
	public void setPatientId(int PatientId) {
		this.PatientId = PatientId;
	}
	public String getPatientName() {
		return PatientName;
	}
	public void setPatientName(String PatientName) {
		this.PatientName = PatientName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getDOJ() {
		return DOJ;
	}
	public void setDOJ(Date DOJ) {
		this.DOJ = DOJ;
	}
	public String getBedType() {
		return BedType;
	}
	public void setBedType(String BedType) {
		this.BedType = BedType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String State) {
		this.State = State;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getBill() {
		return bill;
	}
	public void setBill(int bill) {
		this.bill = bill;
	}
}
