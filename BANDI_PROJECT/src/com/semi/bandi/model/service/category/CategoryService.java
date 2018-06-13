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

	public ArrayList<Category> bookCategoryAndCode(String categoryCode, String orderBy, int start, int end) {
		Connection con = getInstance();
		ArrayList<Category> bookCategoryAndCode = new CategoryDao().selectCategoryCodeAndOrder(con, categoryCode, orderBy , start, end);
		return bookCategoryAndCode;
	}

	public ArrayList<Category> CategoryBanner(String category) {
		Connection con = getInstance();
		ArrayList<Category> BannerArray =  new CategoryDao().selectCategoryBanner(con, category);
		return BannerArray;
	}


//	public int PageCategoryCount(String categoryCode, String orderBy, int currentPage, int limit) {
//		Connection con = getInstance();
//		int PageCategory = new CategoryDao().selectPageCategoryCount(con, categoryCode, orderBy, currentPage, limit);
//		return PageCategory;
//	}


	public int PagingCount(String categoryCode) {
		Connection con = getInstance();
		int pageCount = new CategoryDao().PagingCount(con,categoryCode);
		return pageCount; 
		
	}


	public int FirstCategoryBtnCountService(String category, String categoryCode) {
		Connection con = getInstance();
		int firstCategoryCount = new CategoryDao().FirstCategoryDao(con,category,categoryCode);
		return firstCategoryCount;
	}


	public int StartAndEndService(String categoryCode, String category, int start) {
		Connection con = getInstance();
		int startAndEnd = new CategoryDao().StartAndEndDao(con,categoryCode,category,start);
		return startAndEnd;
	}


	public int EndAndStartService(String categoryCode, String category, int start) {
		Connection con = getInstance();
		int endAndStart = new CategoryDao().EndAndStart(con, categoryCode, category,start);
		return endAndStart;
	}








	
}
