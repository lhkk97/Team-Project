package com.human.project;

public class Books {
	private int id;
	private String booker;
	private String name;
	private int howmany;
	private int howmuch;
	private String type_name;
	public Books() {
	}
	public Books(int id, String booker, String name, int howmany, int howmuch, String type_name) {
		this.id = id;
		this.booker = booker;
		this.name = name;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.type_name = type_name;
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


	
}
