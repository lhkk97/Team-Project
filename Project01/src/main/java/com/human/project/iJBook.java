package com.human.project;

import java.util.ArrayList;

public interface iJBook {
	ArrayList<RoomtypeList> roomtypeList();
	void insertBook(String booker, String roomid, String in_date, String out_date);
	Member getBookSession(String userid);
	ArrayList<Books> getReservation();
	ArrayList<Books> bookList(int room_type, int howmany, String checkin, String checkout);
	ArrayList<Books> loadbookList(int id);
	void updateBook(int bookid, String bookerId, String roomid, String in_date, String out_date);
	void deleteBook(String bookid);
}
