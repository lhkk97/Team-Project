package com.human.project;

public class MemberType {
	private int code;
	private String type;
	public MemberType(int code, String type) {
		this.code = code;
		this.type = type;
	}
	public MemberType() {}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
