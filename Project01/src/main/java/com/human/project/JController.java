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
}
