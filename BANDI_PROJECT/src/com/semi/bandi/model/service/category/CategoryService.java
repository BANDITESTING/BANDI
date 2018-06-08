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


	public ArrayList<Category> bookTableListBanner(String category) {
		Connection con = getInstance();
		ArrayList<Category> list3 = new CategoryDao().selectBookListBanner(con, category);
		close(con);
		
		return list3;
	}

	public ArrayList<Category> bookCategoryAndCode(String categoryCode, String orderBy) {
		Connection con = getInstance();
		ArrayList<Category> bookCategoryAndCode = new CategoryDao().selectCategoryCodeAndOrder(con, categoryCode, orderBy);
		return bookCategoryAndCode;
	}



	public ArrayList<Category> CategoryBanner(String category) {
		Connection con = getInstance();
		ArrayList<Category> BannerArray =  new CategoryDao().selectCategoryBanner(con, category);
		return BannerArray;
	}


	public int PageCategoryCount(String categoryCode, String orderBy, int currentPage, int limit) {
		Connection con = getInstance();
		int PageCategory = new CategoryDao().selectPageCategoryCount(con, categoryCode, orderBy, currentPage, limit);
		return PageCategory;
	}


	public int PagingCount(String categoryCode) {
		Connection con = getInstance();
		int PageCount = new CategoryDao().PagingCount(con,categoryCode);
		return PageCount; 
		
	}





	
}
