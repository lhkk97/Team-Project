package com.human.project;

import java.util.ArrayList;

public interface iBoard {
	void insertBoard(String title, String content, String writer);
	ArrayList<Board> listBoard();
	
	Board getBoard(int bno);
	void updateBoard(int bno,String title,String content);
	void deleteBoard(int bno);
	
	ArrayList<Board> getListPaging(Page page);
	public int getPageTotal();
	public int getTotal();
}
