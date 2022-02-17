package com.human.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
public class JController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/sub04")
	public String sub04(HttpServletRequest hsr, Model model, RedirectAttributes rttr) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		if(session.getAttribute("userid") != null) {
			iJBook ibook = sqlSession.getMapper(iJBook.class);
			ArrayList<RoomtypeList> roomtypeList = ibook.roomtypeList();
			model.addAttribute("roomtypeList", roomtypeList);
			Member userSession = ibook.getBookSession(userid);
			model.addAttribute("userSession", userSession);
			return "sub04";
		} else {
			rttr.addFlashAttribute("result", "do_login");
			return "redirect:/";
		}
	}
	
	@RequestMapping("/book")
	public String book(HttpServletRequest hsr, Model model, RedirectAttributes rttr) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		if(session.getAttribute("userid") != null) {
			iJBook ibook = sqlSession.getMapper(iJBook.class);
			ArrayList<RoomtypeList> roomtypeList = ibook.roomtypeList();
			model.addAttribute("roomtypeList", roomtypeList);
			Member userSession = ibook.getBookSession(userid);
			model.addAttribute("userSession", userSession);
			return "book";
		} else {
			rttr.addFlashAttribute("result", "do_login");
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/getBookList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String getBookList(HttpServletRequest hsr, Model model) {
		int room_type = Integer.parseInt(hsr.getParameter("room_type"));
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		iJBook ibook = sqlSession.getMapper(iJBook.class);
		ArrayList<Books> books = ibook.bookList(room_type, howmany, checkin, checkout);
		JSONArray ja = new JSONArray();
		for(int i = 0; i < books.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id", books.get(i).getId());
			jo.put("name", books.get(i).getName());
			jo.put("howmany", books.get(i).getHowmany());
			jo.put("howmuch", books.get(i).getHowmuch());
			jo.put("type_name", books.get(i).getType_name());
			ja.add(jo);
			System.out.println(jo);
		}
		return ja.toString();
	}
	@RequestMapping(value="/insertBook", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String insertBook(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String roomid = hsr.getParameter("roomid");
		String in_date = hsr.getParameter("in_date");
		String out_date = hsr.getParameter("out_date");
		String booker = (String) session.getAttribute("userid");
		
		iJBook ibook = sqlSession.getMapper(iJBook.class);
		ibook.insertBook(booker, roomid, in_date, out_date);
		
		// book_done 출력용
//		String roomtype = hsr.getParameter("roomtype");
//		String roomname = hsr.getParameter("roomname");
//		String howmany = hsr.getParameter("howmany");
//		String howmuch = hsr.getParameter("howmuch");

//		model.addAttribute(roomtype, "roomtype");
//		model.addAttribute(in_date, "in_date");
//		model.addAttribute(out_date, "out_date");
//		model.addAttribute(roomname, "roomname");
//		model.addAttribute(roomid, "roomid");
//		model.addAttribute(howmany, "howmany");
//		model.addAttribute(booker, "booker");
//		model.addAttribute(howmuch, "howmuch");
		return "book_done";
	}
		
//	@RequestMapping("/book_done")
//	public String book_done() {
//		
//		return "book_done";
//	}
//	

	@RequestMapping("/manage")
	public String reservation(Model model) {
		iJBook ibook = sqlSession.getMapper(iJBook.class);
		
		// 예약리스트 출력
		ArrayList<Books> getReservation = ibook.getReservation();
		model.addAttribute("getReservation", getReservation);
		// 룸타입 출력
		ArrayList<RoomtypeList> roomtypeList = ibook.roomtypeList();
		model.addAttribute("roomtypeList", roomtypeList);
		return "manage";
	}
	@ResponseBody
	@RequestMapping(value="/loadBookList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String loadBookList(HttpServletRequest hsr, Model model) {
//		int id = Integer.parseInt(hsr.getParameter("id"));
//		System.out.println(id);
		int room_type = Integer.parseInt(hsr.getParameter("room_type"));
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		iJBook ibook = sqlSession.getMapper(iJBook.class);
		ArrayList<Books> books = ibook.bookList(room_type, howmany, checkin, checkout);
		JSONArray ja = new JSONArray();
		for(int i = 0; i < books.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id", books.get(i).getId());
			jo.put("name", books.get(i).getName());
			jo.put("howmany", books.get(i).getHowmany());
			jo.put("howmuch", books.get(i).getHowmuch());
			jo.put("type_name", books.get(i).getType_name());
			ja.add(jo);
			System.out.println(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value="/loadMyList", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String loadMyList(HttpServletRequest hsr, Model model) {
		int id = Integer.parseInt(hsr.getParameter("id"));
		iJBook ibook = sqlSession.getMapper(iJBook.class);
		ArrayList<Books> mybooks = ibook.loadbookList(id);
		JSONArray ja = new JSONArray();
		for(int i = 0; i < mybooks.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id", mybooks.get(i).getId());
			jo.put("name", mybooks.get(i).getName());
			jo.put("howmany", mybooks.get(i).getHowmany());
			jo.put("howmuch", mybooks.get(i).getHowmuch());
			jo.put("type_name", mybooks.get(i).getType_name());
			ja.add(jo);
			System.out.println("mylist" + jo);
		}
//		select a.id, a.name, a.howmany, a.howmuch, b.type_name 
		return ja.toString();
	}
	@RequestMapping(value="/updateBook", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String updateBook(HttpServletRequest hsr, Model model) {
		int bookid = Integer.parseInt(hsr.getParameter("bookid"));
		String bookerId = hsr.getParameter("bookerId");
		String roomid = hsr.getParameter("roomid");
		String in_date = hsr.getParameter("in_date");
		String out_date = hsr.getParameter("out_date");
		
		iJBook ibook = sqlSession.getMapper(iJBook.class);
		ibook.updateBook(bookid, bookerId, roomid, in_date, out_date);
		
		return "redirect:/manage";
	}
	@ResponseBody
	@RequestMapping(value = "/deleteBook", method = RequestMethod.POST)
	public String deleteBook(HttpServletRequest hsr) {
		String check = hsr.getParameter("check");
		System.out.println(check);
		String[] bookid = check.split(",");
		
		String str="";
		try {
			iJBook ibook=sqlSession.getMapper(iJBook.class);
			
			for(int i = 0; i < bookid.length; i++) {
				System.out.println("["+bookid[i]+"]");
				ibook.deleteBook(bookid[i]);
			}
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		System.out.println(str);
		return str;
	}
}
