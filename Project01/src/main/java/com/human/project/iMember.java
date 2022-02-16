package com.human.project;

import java.util.ArrayList;

public interface iMember {
	ArrayList<Member> memberList();
	void insertMember(String name,String gender,String mobile,String userid,String passcode);
	void login(String userid);
	void logout(String userid);
	void deleteMember(String userid);
	
	ArrayList<MemberType> dlgList();
	ArrayList<MemberType> getMember();
	void updateType(String userid, int member_type);
}
