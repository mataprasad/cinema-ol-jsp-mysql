package com.app.bean.vm;

public class VMBookingHistory {
	private int page;
	private int forAjax;
	private int SNo;
	private int RecordCount;
	private String Show_Id;
	private String Movie_Name;
	private double Ticket_Id;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getForAjax() {
		return forAjax;
	}

	public void setForAjax(int forAjax) {
		this.forAjax = forAjax;
	}

	public int getSNo() {
		return SNo;
	}

	public void setSNo(int sNo) {
		SNo = sNo;
	}

	public int getRecordCount() {
		return RecordCount;
	}

	public void setRecordCount(int recordCount) {
		RecordCount = recordCount;
	}

	public String getShow_Id() {
		return Show_Id;
	}

	public void setShow_Id(String show_Id) {
		Show_Id = show_Id;
	}

	public String getMovie_Name() {
		return Movie_Name;
	}

	public void setMovie_Name(String movie_Name) {
		Movie_Name = movie_Name;
	}

	public double getTicket_Id() {
		return Ticket_Id;
	}

	public void setTicket_Id(double ticket_Id) {
		Ticket_Id = ticket_Id;
	}

	public double getTicket_No() {
		return Ticket_No;
	}

	public void setTicket_No(double ticket_No) {
		Ticket_No = ticket_No;
	}

	public String getUser_Id() {
		return User_Id;
	}

	public void setUser_Id(String user_Id) {
		User_Id = user_Id;
	}

	public String getShow_Date() {
		return Show_Date;
	}

	public void setShow_Date(String show_Date) {
		Show_Date = show_Date;
	}

	public String getBooking_Date() {
		return Booking_Date;
	}

	public void setBooking_Date(String booking_Date) {
		Booking_Date = booking_Date;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public String getShow_Time() {
		return Show_Time;
	}

	public void setShow_Time(String show_Time) {
		Show_Time = show_Time;
	}

	private double Ticket_No;
	private String User_Id;
	private String Show_Date;
	private String Booking_Date;
	private String URL;
	private String Show_Time;
}
