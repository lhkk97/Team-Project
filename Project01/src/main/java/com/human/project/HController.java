package com.human.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class HController {
	@Autowired
	private SqlSession sqlSession;
	
	// 회원 관리
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String Member() {
		return "member";
	}
	@ResponseBody
	@RequestMapping(value = "/memberList", produces="application/json;charset=utf-8")
	public String memberList() {
		iMember member=sqlSession.getMapper(iMember.class);
		ArrayList<Member> alMember=member.memberList();
		System.out.println(alMember);
		JSONArray ja=new JSONArray();
		for(int i=0; i<alMember.size(); i++) {  // ArrayList -> JSON
			JSONObject jo=new JSONObject();
			jo.put("name",alMember.get(i).getName());
			jo.put("gender",alMember.get(i).getGender());
			jo.put("mobile",alMember.get(i).getMobile());
			jo.put("id",alMember.get(i).getUserid());
			jo.put("pw",alMember.get(i).getPasscode());
			jo.put("m_type",alMember.get(i).getMember_type());
			jo.put("login",alMember.get(i).getLogin_time());
			jo.put("logout",alMember.get(i).getLogout_time());
			ja.add(jo);
		}	
		return ja.toString();
	}
	
	// dialog 회원관리 -> 아마 등급 수정으로 바꿀 듯
//	@ResponseBody
//	@RequestMapping(value = "/dlgList", produces="application/json;charset=utf-8")
//	public String memberList(HttpServletRequest hsr) {
//		String keyword=hsr.getParameter("kw");
//		if(keyword.equals("")) return "";
//		
//		iMember member=sqlSession.getMapper(iMember.class);
//		ArrayList<Member> alMember=member.dlgList(keyword);
//		System.out.println(alMember);
//		JSONArray ja=new JSONArray();
//		for(int i=0; i<alMember.size(); i++) {
//			JSONObject jo=new JSONObject();
//			jo.put("name",alMember.get(i).getName());
//			jo.put("gender",alMember.get(i).getGender());
//			jo.put("mobile",alMember.get(i).getMobile());
//			jo.put("id",alMember.get(i).getUserid());
//			jo.put("m_type",alMember.get(i).getMember_type());
//			ja.add(jo);
//		}
//		return ja.toString();
//	}
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login_check",method=RequestMethod.POST)
	public String login(HttpServletRequest hsr, Model model) {
		String str="";
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		
		iMember member=sqlSession.getMapper(iMember.class);	
		ArrayList<Member> m=member.memberList();
		for(int i=0; i<m.size(); i++) {
//			System.out.println("등록된 아이디:"+m.get(i).getUserid());
//			System.out.println("login ID: "+userid);
//			System.out.println("등록된 비밀번호:"+m.get(i).getPasscode());
//			System.out.println("login Passcode: "+passcode);
			
			if(m.get(i).getPasscode().equals(passcode)&&m.get(i).getUserid().equals(userid)) {
				str="ok";
				break;
			} else {
				str="fail";
			}
		}
		if(str.equals("ok")) {
			member.login(userid);
			model.addAttribute("userid",userid);
			return "home";
		} else {
			model.addAttribute("fail_user",str);
			return "login";
		}
	}
	//로그아웃
	@RequestMapping(value = "/logout",method=RequestMethod.POST)
	public String logout(HttpServletRequest hsr) {
		String userid=hsr.getParameter("userid");
		iMember member=sqlSession.getMapper(iMember.class);	
		member.logout(userid);
		return "redirect:/";
	}
	// 회원가입
	@RequestMapping(value = "/signon", method = RequestMethod.GET)
	public String signon() {
		return "signon";
	}

	@ResponseBody
	@RequestMapping(value="/signon_check",method=RequestMethod.POST)
	public String signon(HttpServletRequest hsr,Model model) {
		String retval="";

		String name=hsr.getParameter("name");
		String gender=hsr.getParameter("gender");
		String mobile=hsr.getParameter("mobile");
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
			
		iMember member=sqlSession.getMapper(iMember.class);
		ArrayList<Member> m=member.memberList();
		for(int i=0; i<m.size(); i++) {
			System.out.println("등록된 ID:"+m.get(i).getUserid());
			System.out.println("signon ID:"+userid);
			if(m.get(i).getUserid().equals(userid)) {
				retval="overlap";
			} 
		}

		if(!retval.equals("overlap")) {
			member.insertMember(name,gender,mobile,userid,passcode);
			retval="ok";
		}
		return retval;
	}
	
	// !! 게시판 !!
	// 게시판 등록
	@RequestMapping(value = "/insertBoard", method = RequestMethod.GET)
	public String insertBoard() {
		return "b_insert";
	}
	
	// 게시판 목록
	@RequestMapping(value = "/listBoard", method = RequestMethod.GET)
	public String listBoard() {
		return "board";
	}
}
