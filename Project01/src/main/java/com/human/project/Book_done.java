package com.human.project;

public class Book_done {

	private int book_id;
	private String type_name;
	private String name;
	private String in_date;
	private String out_date;
	private String room_name;
	private int howmany;
	private String booker;
	private String mobile;
	private int howmuch;
	
	public Book_done() {
	}

	public Book_done(int book_id, String type_name, String name, String in_date, String out_date, String room_name, int howmany,
			String booker, String mobile, int howmuch) {
		this.book_id = book_id;
		this.type_name = type_name;
		this.name = name;
		this.in_date = in_date;
		this.out_date = out_date;
		this.room_name = room_name;
		this.howmany = howmany;
		this.booker = booker;
		this.mobile = mobile;
		this.howmuch = howmuch;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getHowmany() {
		return howmany;
	}

	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}

	public String getBooker() {
		return booker;
	}

	public void setBooker(String booker) {
		this.booker = booker;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getHowmuch() {
		return howmuch;
	}

	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}

}
