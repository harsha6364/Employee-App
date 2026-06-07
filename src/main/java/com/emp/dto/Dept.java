package com.emp.dto;

public class Dept {

	private Integer dno;
	private String dname;
	private String location;
	
	public Integer getDno() {
		return dno;
	}
	public void setDno(Integer dno) {
		this.dno = dno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "Dept [dno=" + dno + ", dname=" + dname + ", location=" + location + "]";
	}

}
