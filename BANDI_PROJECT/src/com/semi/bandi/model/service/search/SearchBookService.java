package com.semi.bandi.model.service.search;

import static com.semi.bandi.template.JDBCTemplate.close;
import static com.semi.bandi.template.JDBCTemplate.getInstance;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.bandi.model.dao.search.SearchBookDao;
import com.semi.bandi.model.vo.searchVo.SearchBook;

public class SearchBookService {

	public SearchBookDao dao;
	
	public SearchBookService(){
		 dao = new SearchBookDao();
	}
	
	public ArrayList<SearchBook> searchBook(String option, String getText, int currentPage, int b_size){
		Connection con = getInstance();
		
		ArrayList<SearchBook> list = dao.searchBook(con, option, getText, currentPage, b_size);

		close(con);
				
		return list;
	}

	public HashMap<String, Integer> searchBookGenre(String option, String getText) {
		Connection con = getInstance();
		
		HashMap<String, Integer> genreCount = dao.searchBookGenre(con, option, getText);
		
		close(con);
		
		return genreCount;
	}

	public ArrayList<SearchBook> searchGenre(String option, String getText, String genreCode, int currentPage, int b_size) {
		Connection con = getInstance();
		
		ArrayList<SearchBook> list = dao.searchGenre(con, option, getText, genreCode, currentPage, b_size);

		close(con);		
		
		return list;
	}

	public int getlistCount(String option, String getText) {
		Connection con = getInstance();
		
		int result = dao.getListCount(con, option, getText);

		close(con);		
		
		return result;
	}
	
	public int getGenreCount(String option, String getText, String GenreCode) {
		Connection con = getInstance();
		
		int result = dao.getGenreCount(con, option, getText, GenreCode);

		close(con);		
		
		return result;
	}

	
}
