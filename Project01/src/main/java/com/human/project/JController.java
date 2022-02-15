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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class JController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/book")
	public String book_done(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		session.getAttribute("userid");
		iJBook ibook = sqlSession.getMapper(iJBook.class);
		ArrayList<RoomtypeList> roomtypeList = ibook.roomtypeList();
		model.addAttribute("roomtypeList", roomtypeList);
		return "book";
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
		String roomid = hsr.getParameter("roomid");
		String in_date = hsr.getParameter("in_date");
		String out_date = hsr.getParameter("out_date");
		String booker = hsr.getParameter("booker");
		
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
	@RequestMapping("/book_done")
	public String book_done() {
		
		return "book_done";
	}
}
