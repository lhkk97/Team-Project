package com.human.project;

public class Books {
	private int id;
	private String booker;
	private String name;
	private String mobile;
	private String roomname;
	private int howmany;
	private int howmuch;
	private String type_name;
	private String in_date;
	private String out_date;
	public Books() {
	}
	public Books(int id, String booker, String name, String mobile, String roomname, int howmany, int howmuch,
			String type_name, String in_date, String out_date) {
		this.id = id;
		this.booker = booker;
		this.name = name;
		this.mobile = mobile;
		this.roomname = roomname;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.type_name = type_name;
		this.in_date = in_date;
		this.out_date = out_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBooker() {
		return booker;
	}
	public void setBooker(String booker) {
		this.booker = booker;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}



	
}
