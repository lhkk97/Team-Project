package com.human.project;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 회원 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	public String Member(HttpServletRequest hsr) {
		String check=hsr.getParameter("check");
		String[] userid=check.split(",");
		
		String str="";
		try {
			iMember member=sqlSession.getMapper(iMember.class);
			
			for(int i=0;i<userid.length;i++) {
				System.out.println("["+userid[i]+"]");
				member.deleteMember(userid[i]);
			}
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		System.out.println(str);
		return str;
	}
	
	// 등급 수정 dialog -> select
	@ResponseBody
	@RequestMapping(value = "/dlgType", produces="application/json;charset=utf-8")
	public String memberList(HttpServletRequest hsr) {		
		iMember type=sqlSession.getMapper(iMember.class);
		ArrayList<MemberType> alType=type.dlgList();
		
		JSONArray ja=new JSONArray();
		for(int i=0; i<alType.size(); i++) {
			JSONObject jo=new JSONObject();
			jo.put("m_code",alType.get(i).getCode());
			jo.put("m_type",alType.get(i).getType());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	// dialog input 
	@ResponseBody
	@RequestMapping(value = "/getMember",produces="application/json;charset=utf-8")
	public String getMember(HttpServletRequest hsr) {		
		iMember type=sqlSession.getMapper(iMember.class);
		ArrayList<MemberType> alType=type.getMember();
		
		JSONArray ja=new JSONArray();
		for(int i=0; i<alType.size(); i++) {
			JSONObject jo=new JSONObject();
			jo.put("userid",alType.get(i).getUserid());
			jo.put("m_code",alType.get(i).getCode());
			jo.put("m_type",alType.get(i).getType());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	// update(등급 수정)
	@ResponseBody
	@RequestMapping(value="/updateType", method=RequestMethod.POST)
	public String updatType(HttpServletRequest hsr) {
		String retval="";
		System.out.println("["+hsr.getParameter("userid")+"]");
		System.out.println("["+hsr.getParameter("code")+"]");
		
		String userid=hsr.getParameter("userid");
		int code=Integer.parseInt(hsr.getParameter("code"));
		
		try {
			iMember type=sqlSession.getMapper(iMember.class);
			type.updateType(userid,code);
			retval="ok";
		} catch(Exception e) {
			retval="fail";
		}
		System.out.println(retval);
		return retval;
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session,Model model,RedirectAttributes rttr) {
		if(session.getAttribute("userid")!=null) {
			rttr.addFlashAttribute("result", "already_login");
			
			return "redirect:/";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value="/login_check",method=RequestMethod.POST)
	public String login(HttpServletRequest hsr, Model model) {
		HttpSession session=hsr.getSession();
		
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
				System.out.println("["+m.get(i).getMember_type()+"]");
				if(m.get(i).getMember_type().equals("관리자")) {
					session.setAttribute("m_type","관리자");
				}
				str="ok";
				break;
			} else {
				str="fail";
			}
		}
		if(str.equals("ok")) {
			member.login(userid);
			//model.addAttribute("userid",userid);
			session.setAttribute("userid",userid);
			return "redirect:/";
		} else {
			model.addAttribute("fail_user",str);
			return "login";
		}
	}
	//로그아웃
	@RequestMapping(value = "/logout",method=RequestMethod.POST)
	public String logout(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		//String userid=hsr.getParameter("userid");
		String userid=(String)session.getAttribute("userid");
		
		iMember member=sqlSession.getMapper(iMember.class);	
		member.logout(userid);
		session.invalidate();
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
	@RequestMapping("/insertBoard")
	public String insertBoard(HttpSession session, Model model) {
		String userid=(String)session.getAttribute("userid");
		model.addAttribute("userid",userid);
		return "b_insert";
	}
	@RequestMapping(value = "/insertBoard", method = RequestMethod.POST)
	public String insertBoard(HttpServletRequest hsr,RedirectAttributes rttr) {
		String title=hsr.getParameter("title");
		String content=hsr.getParameter("content");
		String writer=hsr.getParameter("writer");
		
		iBoard board=sqlSession.getMapper(iBoard.class);
		board.insertBoard(title, content, writer);
		
		rttr.addFlashAttribute("result","ok");
		return "redirect:/listBoard";
	}
	
	// 게시판 목록
	@RequestMapping(value = "/listBoard")
	public String listBoard(Model model,Page page) {
		iBoard board=sqlSession.getMapper(iBoard.class);
//		ArrayList<Board> list=board.listBoard();
		
		ArrayList<Board> list=board.getListPaging(page);
		model.addAttribute("list",list);
		
		int total = board.getTotal();
		System.out.println(total);
        PageMaker pageMake = new PageMaker(page, total);
        model.addAttribute("pm",pageMake);
		return "board";
	}
	
	// 게시판 조회
	@RequestMapping("/getBoard")
	public String getBoard(int bno,Model model,Page page) {
		iBoard board=sqlSession.getMapper(iBoard.class);
		model.addAttribute("get",board.getBoard(bno));
		
		model.addAttribute("page",page);
		
		return "b_select";
	}
	
	// 게시판 수정
	@RequestMapping("/update")
	public String updateBoard(int bno,Model model) {
		iBoard board=sqlSession.getMapper(iBoard.class);
		model.addAttribute("get",board.getBoard(bno));
		return "b_update";
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateBoard(HttpServletRequest hsr,RedirectAttributes rttr) {
		int bno=Integer.parseInt(hsr.getParameter("bno"));
		String title=hsr.getParameter("title");
		String content=hsr.getParameter("content");
		
		iBoard board=sqlSession.getMapper(iBoard.class);
		
		System.out.println("["+bno+"]");
		System.out.println("["+title+"]");
		System.out.println("["+content+"]");
		
		board.updateBoard(bno,title,content);
		
		rttr.addFlashAttribute("result","update");
		return "redirect:/listBoard";
	}
	
	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteBoard(int bno, RedirectAttributes rttr) {
		iBoard board=sqlSession.getMapper(iBoard.class);
	    board.deleteBoard(bno);
	    
	    rttr.addFlashAttribute("result", "delete");
	        
	    return "redirect:/listBoard";
	}
}
