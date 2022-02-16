package com.human.project;

public class MemberType {
	private String userid;
	private int code;
	private String type;
	public MemberType(String userid, int code, String type) {
		this.userid = userid;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
