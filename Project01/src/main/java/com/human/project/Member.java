package com.human.project;

public class Member {
	private String name;
	private String gender;
	private String userid;
	private String passcode;
	private int mobile;
	private String login_time;
	private String logout_time;
	public Member(String name, String gender, String userid, String passcode, int mobile, String login_time,
			String logout_time) {
		this.name = name;
		this.gender = gender;
		this.userid = userid;
		this.passcode = passcode;
		this.mobile = mobile;
		this.login_time = login_time;
		this.logout_time = logout_time;
	}
	public Member() {}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	public int getMobile() {
		return mobile;
	}
	public void setMobile(int mobile) {
		this.mobile = mobile;
	}
	public String getLogin_time() {
		return login_time;
	}
	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}
	public String getLogout_time() {
		return logout_time;
	}
	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}
}
