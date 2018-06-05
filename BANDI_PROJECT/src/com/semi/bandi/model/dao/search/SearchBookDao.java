package com.semi.bandi.model.dao.search;

import static com.semi.bandi.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.semi.bandi.model.vo.searchVo.SearchBook;

public class SearchBookDao {

	private Properties prop;
	
	public SearchBookDao(){
		prop = new Properties();
		String filename = SearchBookDao.class.getResource("/config/search/searchBook.properties").getPath();
		
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<SearchBook> searchBook(Connection con, String option, String getText, int currentPage, int b_size) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SearchBook> list = null;
		String dynamicSQL = "";
		
		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE REPLACE(TITLE, ' ') LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR REPLACE(WRITER_NAME, ' ') LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR REPLACE(PUBLISHER, ' ') LIKE '%'|| '"+getText+"' ||'%'";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE REPLACE(TITLE, ' ') LIKE '%'|| '"+getText+"' ||'%'";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE REPLACE(WRITER_NAME, ' ') LIKE '%'|| '"+getText+"' ||'%'";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE REPLACE(PUBLISHER, ' ') LIKE '%'|| '"+getText+"' ||'%'";
		}
		
		String sql = prop.getProperty("searchBook1")+dynamicSQL+prop.getProperty("searchBook2");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 조회할 숫자 startRow 와 endRow 계산
			int startRow = (currentPage - 1) * b_size +1;
			int endRow = startRow + (b_size - 1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<SearchBook>();
			
			while(rset.next()){
				SearchBook book = new SearchBook();
				
				book.setmBook_UID(rset.getInt("BOOK_UID"));
				book.setmISBN(rset.getString("ISBN"));
				book.setmTitle(rset.getString("TITLE"));
				book.setmPrice(rset.getInt("PRICE"));
				book.setmWriter(rset.getString("WRITER_NAME"));
				book.setmPublisher(rset.getString("PUBLISHER"));
				book.setmGenreCode(rset.getString("GENRE_CODE"));
				book.setmPage(rset.getInt("PAGE"));
				book.setmImagePath(rset.getString("IMAGE"));
				book.setmIssueDate(rset.getDate("ISSUE_DATE"));
				
				list.add(book);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public HashMap<String, Integer> searchBookGenre(Connection con, String option, String getText) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, Integer> genreCount = null;
		String dynamicSQL = "";
		
		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE REPLACE(TITLE, ' ') LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR REPLACE(WRITER_NAME, ' ') LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR REPLACE(PUBLISHER, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE REPLACE(TITLE, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE REPLACE(WRITER_NAME, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE REPLACE(PUBLISHER, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		}
		
		String sql = prop.getProperty("genreCount")+dynamicSQL+" group by genre_code";

		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			genreCount = new HashMap<String, Integer>();
			
			while(rset.next()){
				genreCount.put(rset.getString("GENRE_CODE"), rset.getInt("COUNT(*)")); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return genreCount;
	}

	public ArrayList<SearchBook> searchGenre(Connection con, String option, String getText, String genreCode) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<SearchBook> list = null;
		String dynamicSQL = "";

		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ " AND(REPLACE(TITLE, ' ') LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR REPLACE(WRITER_NAME, ' ') LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR REPLACE(PUBLISHER, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND(REPLACE(TITLE, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND(REPLACE(WRITER_NAME, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND(REPLACE(PUBLISHER, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		}

		String sql = prop.getProperty("searchBook")+dynamicSQL;		
		
		try {
		
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<SearchBook>();
			
			while(rset.next()){
				SearchBook book = new SearchBook();
				
				book.setmBook_UID(rset.getInt("BOOK_UID"));
				book.setmISBN(rset.getString("ISBN"));
				book.setmTitle(rset.getString("TITLE"));
				book.setmPrice(rset.getInt("PRICE"));
				book.setmWriter(rset.getString("WRITER_NAME"));
				book.setmPublisher(rset.getString("PUBLISHER"));
				book.setmGenreCode(rset.getString("GENRE_CODE"));
				book.setmPage(rset.getInt("PAGE"));
				book.setmImagePath(rset.getString("IMAGE"));
				book.setmIssueDate(rset.getDate("ISSUE_DATE"));
				
				list.add(book);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}		

		return list;
	}

	public int getListCount(Connection con, String option, String getText) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String dynamicSQL = "";
		
		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE REPLACE(TITLE, ' ') LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR REPLACE(WRITER_NAME, ' ') LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR REPLACE(PUBLISHER, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE REPLACE(TITLE, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE REPLACE(WRITER_NAME, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE REPLACE(PUBLISHER, ' ') LIKE '%'|| '"+getText+"' ||'%')";
		}
		
		String sql = prop.getProperty("listCount")+dynamicSQL;	
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		return result;
	}

}
