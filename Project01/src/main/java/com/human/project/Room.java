package com.human.project;

public class Room {
	private int id;
	private String name;
	private int room_type;
	private int howmany;
	private int howmuch;
	private String type_name;
	
	public Room() {
	}

	public Room(int id, String name, int room_type, int howmany, int howmuch, String type_name) {
		this.id = id;
		this.name = name;
		this.room_type = room_type;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.type_name = type_name;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getRoom_type() {
		return room_type;
	}

	public int getHowmany() {
		return howmany;
	}

	public int getHowmuch() {
		return howmuch;
	}

	public String getType_name() {
		return type_name;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setRoom_type(int room_type) {
		this.room_type = room_type;
	}

	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}

	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	
	
	
}
