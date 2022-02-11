package com.human.project;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.human.project.iRoom;

@Controller
public class MController {
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping("room")
	public String Room() {
		return "room";
	}
	@RequestMapping("roomtype")
	public String RoomType() {
		return "roomtype";
	}
	@RequestMapping("addType")
	public String addType(HttpServletRequest hsr) {
		String mName=hsr.getParameter("type_name");
		
		iRoom dep=sqlSession.getMapper(iRoom.class);
		dep.addType(mName);
		return "addType";
	}
	@RequestMapping("roominfo")
	public String RoomInfo() {
		return "roomInfo";
	}
}
