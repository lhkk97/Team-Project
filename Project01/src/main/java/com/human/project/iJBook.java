package com.human.project;

import java.util.ArrayList;

public interface iJBook {
	ArrayList<RoomtypeList> roomtypeList();
	ArrayList<Books> bookList(int room_type, int howmany, String checkin, String checkout);
}
