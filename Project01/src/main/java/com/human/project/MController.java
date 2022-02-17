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

import com.human.project.iRoom;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MController {
	@Autowired
	private SqlSession sqlSession;
	

	@RequestMapping("/room") //디럭스 room 웹페이지
	public String Room() {
		return "room";
	}
	@RequestMapping("/room2") //스위트room 웹페이지
	public String SuiteRoom() {
		return "room2";
	}
	@RequestMapping("/room3") //트윈 room 웹페이지
	public String TwinRoom() {
		return "room3";
	}
	@RequestMapping("/room4") //더블 room 웹페이지
	public String DoubleRoom() {
		return "room4";
	}
	@RequestMapping("/room5") //패밀리 room 웹페이지
	public String FamilyRoom() {
		return "room5";
	}
	@RequestMapping("/roomtype") //roomtype 웹페이지
	public String RoomType() {
		return "roomtype";
	}
	@RequestMapping("/addType") //roomtype 룸타입 insert
	public String addType(HttpServletRequest hsr) {
		String mCode=hsr.getParameter("type_code");
		String mName=hsr.getParameter("type_name");
		
		iRoom dep=sqlSession.getMapper(iRoom.class);
		dep.addType(mCode,mName);
		return "roomtype";
	}
	@RequestMapping("/roominfo") //roominfo 웹페이지
	public String RoomInfo() {
		return "roomInfo";
	}
	@ResponseBody //룸 셀렉트 출력
	@RequestMapping(value="/roomlist", method = RequestMethod.GET, produces = "apllication/json;charset=utf-8")
	public String roomList() {
		iRoom r=sqlSession.getMapper(iRoom.class);
		ArrayList<Room> alRoom=r.getRoom();
		JSONArray ja=new JSONArray();
		for(int i=0; i <  alRoom.size(); i++) {
			JSONObject jo=new JSONObject();
			jo.put("id",alRoom.get(i).getId());
			jo.put("name",alRoom.get(i).getName());
			jo.put("room_type",alRoom.get(i).getRoom_type());
			jo.put("howmuch",alRoom.get(i).getHowmuch());
			jo.put("howmany",alRoom.get(i).getHowmany());
			jo.put("type_name",alRoom.get(i).getType_name());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody //룸타입 셀렉트 출력
	@RequestMapping(value="/typelist", method = RequestMethod.GET, produces = "apllication/json;charset=utf-8")
	public String getTypeList() {
		iRoom dep=sqlSession.getMapper(iRoom.class);
		ArrayList<Roomtype> alType=dep.getType();
		JSONArray ja=new JSONArray();
		for(int i=0; i < alType.size(); i++) {
			JSONObject jo=new JSONObject();
			jo.put("type_code", alType.get(i).getType_code());
			jo.put("type_name", alType.get(i).getType_name());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping("/addInfo") //룸 insert
	public String addInfo(HttpServletRequest hsr) {
		  String strCode=hsr.getParameter("id");
	      String name=hsr.getParameter("name");
	      int type=Integer.parseInt(hsr.getParameter("type"));
	      int howmany=Integer.parseInt(hsr.getParameter("howmany"));
	      int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
	      
	      iRoom room=sqlSession.getMapper(iRoom.class);
	      if(strCode.equals("")) {
	    	  room.addInfo(name,type,howmany,howmuch);	    	  
	      } else {
	    	  int code=Integer.parseInt(strCode);
	    	  room.upInfo(code,name,type,howmany,howmuch);
	      }
	      return "redirect:/roominfo";
	}
	@RequestMapping("/delInfo") //룸 delete
	public String delInfo(HttpServletRequest hsr) {
		int code=Integer.parseInt(hsr.getParameter("id"));
		
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.delInfo(code);
		return "redirect:/roominfo";
	}
}
