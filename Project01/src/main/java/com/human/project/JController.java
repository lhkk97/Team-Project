package com.human.project;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/book_done")
	public String book_done(Model model) {
		iJBook ibook = sqlSession.getMapper(iJBook.class);
		ArrayList<RoomtypeList> roomtypeList = ibook.roomtypeList();
		model.addAttribute("roomtypeList", roomtypeList);
		return "book_done";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getBookList", produces="application/json; charset=utf-8")
	public String getBookList(HttpServletRequest hsr, Model model) {
//		int room_type = Integer.parseInt(hsr.getParameter("room_type"));
//		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
//		String checkin = hsr.getParameter("checkin");
//		String checkout = hsr.getParameter("checkout");
//		iJBook ibook = sqlSession.getMapper(iJBook.class);
//		ArrayList<Books> bookList(room_type, howmany, checkin, checkout);
//		ArrayList<Books> books = ibook.bookList();
//		model.addAttribute("books",books);
//		
		return "";

	}
}
