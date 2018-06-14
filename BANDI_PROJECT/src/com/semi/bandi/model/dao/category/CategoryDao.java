package com.semi.bandi.model.dao.category;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import static com.semi.bandi.template.JDBCTemplate.*;
import com.semi.bandi.model.vo.Category;
import com.semi.bandi.model.vo.CategoryPaging;


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
				c.setcISBN(rset.getString("ISBN"));
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

	public ArrayList<Category> selectCategoryCodeAndOrder(Connection con, String categoryCode, String orderBy , int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		ArrayList<Category> list = new ArrayList<Category>();
		String query2 ="";
		if(orderBy.equals("ISSUE_DATE")){
			query2 = "SELECT * FROM (SELECT T1.*, ROWNUM R_NUM FROM ( SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY ISSUE_DATE DESC) T1 ";
		}else if(orderBy.equals("TITLE")){
			query2 = "SELECT * FROM (SELECT T1.*, ROWNUM R_NUM FROM ( SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY TITLE ASC) T1 ";
		}else if(orderBy.equals("WRITER_NAME")){
			query2 = "SELECT * FROM (SELECT T1.*, ROWNUM R_NUM FROM ( SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY WRITER_NAME ASC) T1 ";
		}else if(orderBy.equals("QUANTITY")){
			query2 = "SELECT * FROM (SELECT T1.*, ROWNUM R_NUM FROM ( SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) JOIN ORDER_DETAIL USING(BOOK_UID) ORDER BY QUANTITY DESC) T1 ";
		}
		String query = query2+prop.getProperty("selectCategoryCodeAndOrder");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, categoryCode);
			
			// Setting for Current Page
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rSet = pstmt.executeQuery();
			
			while(rSet.next()){
				Category c = new Category();
				c.setcISBN(rSet.getString("ISBN"));
				c.setcTitle(rSet.getString("TITLE"));
				c.setcWriter(rSet.getString("WRITER_NAME"));
				c.setcImage(rSet.getString("IMAGE"));
				list.add(c);
			}
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close(rSet);
			close(pstmt);
			close(con);
		}
		return list;
	}

	public ArrayList<Category> selectCategoryBanner(Connection con, String category) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		ArrayList<Category> list = new ArrayList<Category>();
		String query = prop.getProperty("selectCategoryBanner");
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, category);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next()){
			Category c = new Category();
			c.setcGenre(rSet.getString("GENRE"));
			c.setcSubGenre(rSet.getString("SUB_GENRE"));
			list.add(c);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rSet);
			close(pstmt);
		}
		return list;
	}

	public int PagingCount(Connection con, String categoryCode) {
		
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		int result = 0;
		String query = prop.getProperty("selectPageCount");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, categoryCode);
			
			rSet = pstmt.executeQuery();
			
			if(rSet.next()){
				result = rSet.getInt(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rSet);
			close(pstmt);
		}
	
		return result;
	}

	public int FirstCategoryDao(Connection con, String category, String categoryCode) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		int result = 0;
		String query2 = "";
		if(category.equals("ISSUE_DATE")){
			query2 = "SELECT COUNT(*) FROM (SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY ISSUE_DATE DESC) ";
		}else if(category.equals("TITLE")){
			query2 = "SELECT COUNT(*) FROM (SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY TITLE ASC) ";
		}else if(category.equals("WRITER_NAME")){
			query2 = "SELECT COUNT(*) FROM (SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY WRITER_NAME ASC) ";
		}else if(category.equals("QUANTITY")){
			query2 = "SELECT COUNT(*) FROM (SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) JOIN ORDER_DETAIL USING(BOOK_UID) ORDER BY QUANTITY DESC) ";
		}
		String query = query2 + prop.getProperty("selectFirstCategoryCount");
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, categoryCode);
			
			rSet = pstmt.executeQuery();
			
			if(rSet.next()){
				result = rSet.getInt(1);
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return result;
	}

	public int StartAndEndDao(Connection con, String categoryCode, String orderBy, int start) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		int result = 0;
		String query2 = "";
//		if(category.equals("ISSUE_DATE")){
//			query2 = "SELECT COUNT(*) FROM(SELECT row_number() OVER (ORDER BY ISSUE_DATE DESC, TITLE DESC) AS RANKED, GENRE_CODE, TITLE, ISBN, ISSUE_DATE, IMAGE, PRICE, WRITER_NAME FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE)) ";
//		}else if(category.equals("TITLE")){
//			query2 = "SELECT COUNT(*) FROM(SELECT row_number() OVER (ORDER BY TITLE ASC) AS RANKED, GENRE_CODE, TITLE, ISBN, ISSUE_DATE, IMAGE, PRICE, WRITER_NAME FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE)) ";
//		}else if(category.equals("WRITER_NAME")){
//			query2 = "SELECT COUNT(*) FROM(SELECT row_number() OVER (ORDER BY WRITER_NAME ASC, TITLE DESC) AS RANKED, GENRE_CODE, TITLE, ISBN, ISSUE_DATE, IMAGE, PRICE, WRITER_NAME FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE)) ";
//		}else if(category.equals("QUANTITY")){
//			query2 = "SELECT COUNT(*) FROM(SELECT row_number() OVER (ORDER BY QUANTITY DESC, TITLE DESC) AS RANKED, GENRE_CODE, TITLE, ISBN, ISSUE_DATE, IMAGE, PRICE, WRITER_NAME FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE)) ";
//		}
		
		if(orderBy.equals("ISSUE_DATE")){
			query2 = "SELECT COUNT(*) FROM (SELECT T1.*, ROWNUM R_NUM FROM ( SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY ISSUE_DATE DESC) T1 ";
		}else if(orderBy.equals("TITLE")){
			query2 = "SELECT COUNT(*) FROM (SELECT T1.*, ROWNUM R_NUM FROM ( SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY TITLE ASC) T1 ";
		}else if(orderBy.equals("WRITER_NAME")){
			query2 = "SELECT COUNT(*) FROM (SELECT T1.*, ROWNUM R_NUM FROM ( SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) ORDER BY WRITER_NAME ASC) T1 ";
		}else if(orderBy.equals("QUANTITY")){
			query2 = "SELECT COUNT(*) FROM (SELECT T1.*, ROWNUM R_NUM FROM ( SELECT * FROM GENRE JOIN BANDI_BOOK USING(GENRE_CODE) JOIN WRITER USING(WRITER_CODE) JOIN ORDER_DETAIL USING(BOOK_UID) ORDER BY QUANTITY DESC) T1 ";
		}
			
		String query = query2 +prop.getProperty("selectJumpButton");
	
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, categoryCode);
			pstmt.setInt(2, start);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next())
				result = rSet.getInt(1);
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			close(rSet);
			close(pstmt);
			close(con);
		}
		return result;
	}

}
