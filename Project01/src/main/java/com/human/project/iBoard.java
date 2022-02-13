package com.human.project;

import java.util.ArrayList;

public interface iBoard {
	void insertBoard(String title, String content, String writer);
	ArrayList<Board> listBoard();
	ArrayList<Board> getBoard(int bno);
	
	ArrayList<Board> getListPaging(Page page);
	public int getPageTotal();
}
