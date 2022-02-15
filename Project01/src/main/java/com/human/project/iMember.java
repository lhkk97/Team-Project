package com.human.project;

import java.util.ArrayList;

public interface iMember {
	ArrayList<Member> memberList();
	void insertMember(String name,String gender,String mobile,String userid,String passcode);
	void login(String userid);
	void logout(String userid);
	
	ArrayList<Member> dlgList(String keyword);
}
