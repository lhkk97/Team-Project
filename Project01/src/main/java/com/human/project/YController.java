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
public class YController {

	@Autowired
	private SqlSession sqlSession;
	
	@ResponseBody
	@RequestMapping(value="/getBook_doneList", produces = "application/json; charset=utf-8")
	public String getBook() {
		iYBook ibook = sqlSession.getMapper(iYBook.class);
		ArrayList<Book_done> getBook_doneList = ibook.Book_doneList();
		JSONArray ja=new JSONArray();
		for(int i=0; i<getBook_doneList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_id", getBook_doneList.get(i).getBook_id());
			jo.put("type_name", getBook_doneList.get(i).getType_name());
			jo.put("in_date", getBook_doneList.get(i).getIn_date());
			jo.put("out_date", getBook_doneList.get(i).getOut_date());
			jo.put("room_name", getBook_doneList.get(i).getRoom_name());
			jo.put("howmany", getBook_doneList.get(i).getHowmany());
			jo.put("booker", getBook_doneList.get(i).getBooker());
			jo.put("mobile", getBook_doneList.get(i).getMobile());
			jo.put("name", getBook_doneList.get(i).getName());
			jo.put("howmuch", getBook_doneList.get(i).getHowmuch());
			System.out.println(ja);
			ja.add(jo);
		}
		
		
		return ja.toString();
	}
	
	@RequestMapping("/book_done")
	public String book_done() {
		
		return "book_done";
	}
		
}
