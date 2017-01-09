package jspbook;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReservInfo {
	private int r_id;
	private String m_id;
	private int f_id;
	private String f_name;
	private String f_date;
	private String r_date;
	private int seatno;
	private String status;
	
	public int getR_id() {
		return r_id;
	}
	
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	
	public String getM_id() {
		return m_id;
	}
	
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	public int getF_id() {
		return f_id;
	}
	
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	
	public String getF_name() {
		return f_name;
	}
	
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	
	public String getF_date() {
		return f_date;
	}
	
	public void setF_date(String f_date) {
		this.f_date = f_date;
	}
	
	public String getR_date() {
		return r_date;
	}
	
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
	public int getSeatno() {
		return seatno;
	}
	
	public void setSeatno(int seatno) {
		this.seatno = seatno;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
}
