package jspbook;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemList {
	private String id;
	private String pw1;
	private String pw2;
	private int age;
	private String name;
	private String date;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw1() {
		return pw1;
	}
	
	public void setPw1(String pw1) {
		this.pw1 = pw1;
	}

	public String getPw2() {
		return pw2;
	}
	
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
}
