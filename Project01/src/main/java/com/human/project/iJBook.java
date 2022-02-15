package com.human.project;

import java.util.ArrayList;

public interface iJBook {
	ArrayList<RoomtypeList> roomtypeList();
	ArrayList<Books> bookList(int room_type, int howmany, String checkin, String checkout);
	void insertBook(String booker, String roomid, String in_date, String out_date);
}
