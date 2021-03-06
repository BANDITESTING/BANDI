package com.semi.bandi.model.dao.search;

import static com.semi.bandi.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	
	// 책 검색
	public ArrayList<SearchBook> searchBook(Connection con, String option, String getText, int currentPage, int b_size) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SearchBook> list = null;
		String dynamicSQL = "";
		
		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%'";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%'";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%'";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%'";
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
				book.setmRating(rset.getDouble("BOOKRATING"));
				book.setmCommentCount(rset.getInt("COMMENT_COUNT"));
				
				Date issue = book.getmIssueDate(); 
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMM");
				String dateToString = transFormat.format(issue);
				book.setmIssueYear(dateToString.substring(0, 4));
				book.setmIssueMonth(dateToString.substring(4, 6));
				
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

	// leftbar에 표시할 장르별 검색어 숫자
	public HashMap<String, Integer> searchBookGenre(Connection con, String option, String getText) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, Integer> genreCount = null;
		String dynamicSQL = "";
		
		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
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

	// 장르별 책 검색
	public ArrayList<SearchBook> searchGenre(Connection con, String option, String getText, String genreCode, int currentPage, int b_size) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SearchBook> list = null;
		String dynamicSQL = "";

		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ " AND (LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND (LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND (LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND (LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		}

		String sql = prop.getProperty("searchBook1")+dynamicSQL+prop.getProperty("searchBook2");		

		try {

			pstmt = con.prepareStatement(sql);
			
			// 조회할 숫자 startRow 와 endRow 계산
			int startRow = (currentPage - 1) * b_size +1;
			int endRow = startRow + (b_size - 1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			list = new ArrayList<SearchBook>();
			
			rset = pstmt.executeQuery();
			
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
				book.setmRating(rset.getDouble("BOOKRATING"));
				book.setmCommentCount(rset.getInt("COMMENT_COUNT"));

				Date issue = book.getmIssueDate(); 
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMM");
				String dateToString = transFormat.format(issue);
				book.setmIssueYear(dateToString.substring(0, 4));
				book.setmIssueMonth(dateToString.substring(4, 6));
				
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

	// 페이징용 검색어 숫자 반환
	public int getListCount(Connection con, String option, String getText) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String dynamicSQL = "";
		
		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%')";
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

	// 페이징용 장르 검색어 숫자 반환
	public int getGenreCount(Connection con, String option, String getText, String genreCode) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String dynamicSQL = "";
		
		if(option.equals("totalSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ " AND (LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%'"
					+ " OR LOWER(REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%'))";
		} else if(option.equals("bookSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND (LOWER(REPLACE(TITLE, ' ')) LIKE '%'|| '"+getText+"' ||'%'))";
		} else if(option.equals("authorSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND (LOWER REPLACE(WRITER_NAME, ' ')) LIKE '%'|| '"+getText+"' ||'%'))";
		} else if(option.equals("publisherSearch")){
			dynamicSQL = " WHERE GENRE_CODE LIKE '"+genreCode+"'"
					+ "AND (LOWER REPLACE(PUBLISHER, ' ')) LIKE '%'|| '"+getText+"' ||'%'))";
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
