package com.human.project;

public class Reservation {
	private int book_id;
	private String booker;
	private int room_id;
	
	public Reservation() {
	}

	public Reservation(int book_id, String booker, int room_id) {
		this.book_id = book_id;
		this.booker = booker;
		this.room_id = room_id;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getBooker() {
		return booker;
	}

	public void setBooker(String booker) {
		this.booker = booker;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
}
