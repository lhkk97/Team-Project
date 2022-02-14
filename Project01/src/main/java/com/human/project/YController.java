package com.human.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.project.Reservation;
import com.human.project.iRez;
import com.human.project.Reservation;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class YController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/rez")
	public String doRez(Model model) {
//		iRez rez=sqlSession.getMapper(iRez.class);
//		ArrayList<Reservation> getRezList = rez.getRezList();
//		model.addAttribute("rez", getRezList);
		
		return "reservation";
	}
	
	@ResponseBody		// ajax 호출이기 때문에 RespoinseBody를 붙여줘야함
	@RequestMapping(value="/reservation",
								produces="application/json;charset=UTF-8")
	public String getRez() {
		iRez rez = sqlSession.getMapper(iRez.class);
		ArrayList<Reservation> getRezList = rez.getRezList();	
		
		JSONArray ja=new JSONArray();
		for(int i=0; i<getRezList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_id", getRezList.get(i).getBook_id());
			jo.put("booker", getRezList.get(i).getBooker());
			jo.put("room_id", getRezList.get(i).getRoom_id());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping("/addRez")
	public String addRez(HttpServletRequest hsr) {
		String strCode = hsr.getParameter("book_id");
		String booker = hsr.getParameter("booker");
		int room_id = Integer.parseInt(hsr.getParameter("room_id"));
		
		iRez rez = sqlSession.getMapper(iRez.class);
		return "";
	}
	
}
