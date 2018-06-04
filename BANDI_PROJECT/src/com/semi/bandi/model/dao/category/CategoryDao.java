package com.semi.bandi.model.dao.category;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import static com.semi.bandi.template.JDBCTemplate.*;
import com.semi.bandi.model.vo.Category;


public class CategoryDao {
	
	private Properties prop = new Properties();
	
	public CategoryDao() {
		String fileName = CategoryDao.class.getResource("/config/category/category-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Category> selectBookListDate(Connection con, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		String query = prop.getProperty("selectCategory1");
		
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, category);
	
			rset= pstmt.executeQuery();
			
			
			list = new ArrayList<Category>();
			
			while(rset.next()){
				Category c = new Category();
				
				c.setcISBN(rset.getString("ISBN"));
				c.setcTitle(rset.getString("TITLE"));
				c.setcImage(rset.getString("IMAGE"));
				c.setcPrice(rset.getInt("PRICE"));
				c.setcWriter(rset.getString("WRITER_NAME"));
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				close(pstmt);
				
		}
		
		return list;
	}

	public ArrayList<Category> selectBookListSell(Connection con, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		String query = prop.getProperty("selectCategory2");
		
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, category);
	
			rset= pstmt.executeQuery();
			
			
			list = new ArrayList<Category>();
			
			while(rset.next()){
				
				Category c = new Category();
				
				c.setcTitle(rset.getString("TITLE"));
				c.setcImage(rset.getString("IMAGE"));
				c.setcPrice(rset.getInt("PRICE"));
				c.setcWriter(rset.getString("WRITER_NAME"));
				list.add(c);
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				close(pstmt);
				
		}
		
		return list;
		
	}

	public ArrayList<Category> selectBookListBanner(Connection con, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		String query = prop.getProperty("selectCategory3");
		
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, category);
	
			rset= pstmt.executeQuery();
			
			
			list = new ArrayList<Category>();
			
			while(rset.next()){
				
				Category c = new Category();
				
				c.setcTitle(rset.getString("TITLE"));
				c.setcImage(rset.getString("IMAGE"));
				c.setcWriter(rset.getString("WRITER_NAME"));
				c.setcIntroduce(rset.getString("BOOK_INTRODUCE"));
				list.add(c);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				close(pstmt);
				
		}
		
		return list;
	}

}
