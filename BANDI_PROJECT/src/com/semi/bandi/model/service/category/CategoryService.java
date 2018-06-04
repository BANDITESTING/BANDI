package com.semi.bandi.model.service.category;



import java.sql.*;
import java.util.ArrayList;

import com.semi.bandi.model.dao.category.*;
import com.semi.bandi.model.vo.*;
import static com.semi.bandi.template.JDBCTemplate.*;



public class CategoryService {

	public ArrayList<Category> bookTableListDate(String category) {
		Connection con = getInstance();
		ArrayList<Category> list = new CategoryDao().selectBookListDate(con, category);
		close(con);
		
		return list;
	}

	public ArrayList<Category> bookTableListSell(String category) {
		Connection con = getInstance();
		ArrayList<Category> list2 = new CategoryDao().selectBookListSell(con, category);
		close(con);
		
		return list2;
	}

	public ArrayList<Category> bookTableListBanner(String category) {
		Connection con = getInstance();
		ArrayList<Category> list3 = new CategoryDao().selectBookListBanner(con, category);
		close(con);
		
		return list3;
	}

	
}
