package com.human.project;

public class Reservation {
	private int book_id;
	private String name;
	private String mobile;
	private int room_type;
	private int howmany;
	private int howmuch;
	private String in_date;
	private String out_date;
	
	public Reservation() {
	}

	public Reservation(int book_id, String name, String mobile, int room_type, int howmany, int howmuch, String in_date, String out_date) {
		this.book_id = book_id;
		this.name = name;
		this.mobile = mobile;
		this.room_type = room_type;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.in_date = in_date;
		this.out_date = out_date;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
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

	public int getRoom_type() {
		return room_type;
	}

	public void setRoom_type(int room_type) {
		this.room_type = room_type;
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
