package com.human.project;

import java.util.ArrayList;

public interface iRez {
	ArrayList<Reservation>  getRezList();
	void addRez(int book_id, String booker, int room_id);
}
