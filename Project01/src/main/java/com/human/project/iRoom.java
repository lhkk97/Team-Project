package com.human.project;

import java.util.ArrayList;

public interface iRoom {
	void addType(String a,String b); //roomtype add
	void addInfo(String a,int b,int c,int d); //roomInfo add
	void upInfo(int a,String b,int c,int d,int e); //roomInfo update
	void delInfo(int a); //roomInfo delete
	ArrayList<Room> getRoom();
	ArrayList<Roomtype> getType();
}
