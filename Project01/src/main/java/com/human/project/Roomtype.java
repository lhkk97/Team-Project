package com.human.project;

public class Roomtype {
	private int type_code;
	private String type_name;
	
	public Roomtype() {
	}

	public Roomtype(int type_code, String type_name) {
		this.type_code = type_code;
		this.type_name = type_name;
	}

	public int getType_code() {
		return type_code;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_code(int type_code) {
		this.type_code = type_code;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	
}
