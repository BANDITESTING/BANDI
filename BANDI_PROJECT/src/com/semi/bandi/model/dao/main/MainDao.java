package com.semi.bandi.model.dao.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.bandi.model.vo.Book;
import com.semi.bandi.model.vo.Comment;
import com.semi.bandi.model.vo.mainVo.CommentUserInfo;
import com.semi.bandi.model.vo.mainVo.RankedBookInfo;
import com.semi.bandi.template.PropertiesTemplate;
import com.semi.bandi.template.MainQueryProperties;

import static com.semi.bandi.template.JDBCTemplate.*;

public class MainDao 
{
	public MainDao(){}
	
	/*****************************************************************************
	 *  Description : BANDI Recommend Book [12]
	 *  Date : 2018/05/15
	 *  Author : PYS
	 * ****************************************************************************/
	public Book[] getRecommendBook(Connection con)
	{
		if(con == null) return null;
		
		int mBandiCount = 10;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		PropertiesTemplate prop = new PropertiesTemplate();
		Book[] bookArray = new Book[mBandiCount];
		
		String query = "SELECT * FROM BANDI_BOOK WHERE ISBN IN (? , ? , ? , ? , ? , ? ,? , ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			
			String[] arrayofISBN = prop.getRecommendBook();
			
			for(int i = 1; i <= mBandiCount ; i++)
				pstmt.setString(i, arrayofISBN[i-1]);
			
			rSet = pstmt.executeQuery();
			
			int j = 0;
			while(rSet.next())
			{
				Book book = new Book();
				book.setmBook_UID(rSet.getInt(1));
				book.setmISBN(rSet.getString(2));
				book.setmTitle(rSet.getString(3));
				book.setmPrice(rSet.getInt(4));
				book.setmWriterCode(rSet.getString(5));
				book.setmPublisher(rSet.getString(6));
				book.setmQuantity(rSet.getInt(7));
				book.setmGenreCode(rSet.getString(8));
				book.setmOrigin(rSet.getString(9));
				book.setmIntroduceBook(rSet.getString(10));
				book.setmPage(rSet.getInt(11));
				book.setmImagePath(rSet.getString(12)); // Book Image Path;
				book.setmIssueDate(rSet.getDate(13));
				bookArray[j] = book;
				j++;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			bookArray = null;
		}finally
		{
			close(rSet);
			close(pstmt);
		}
		
		return bookArray;
	}
	
	public Book[] getBestSeller(Connection con, String typeCode)
	{
		int mBandiCount = 8;
		Book[] bookArray = new Book[mBandiCount];
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		MainQueryProperties prop = new MainQueryProperties();
		String query = prop.getBestSellerQ();
	
		if(query == null) return null;
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, typeCode+"%");
			rSet = pstmt.executeQuery();
			
			int j = 0;
			while(rSet.next())
			{
				Book book = new Book();
				book.setmBook_UID(rSet.getInt(1));
				book.setmISBN(rSet.getString(2));
				book.setmTitle(rSet.getString(3));
				book.setmPrice(rSet.getInt(4));
				book.setmImagePath(rSet.getString(5)); // Book Image Path;
				bookArray[j++] = book;
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
		}
		
		return bookArray;
	}

	public RankedBookInfo getRankBook(Connection con, String category) 
	{
		if(con == null) return null;
		
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		RankedBookInfo bookInfo = null;
		MainQueryProperties prop = new MainQueryProperties();
		String query = prop.getRankedBook();
		
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, category+"%");

			rSet = pstmt.executeQuery();
			
			while(rSet.next()) // get one Book.
			{
				bookInfo = new RankedBookInfo();
				bookInfo.setmBook_UID(rSet.getInt(1));
				bookInfo.setmTitle(rSet.getString(2));
				bookInfo.setmPrice(rSet.getInt(3));
				bookInfo.setWriterName(rSet.getString(4));
				bookInfo.setmISBN(rSet.getString(5));
				bookInfo.setAvgPoint(rSet.getInt(6));
				bookInfo.setmImagePath(rSet.getString(7));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
		}
		
		return bookInfo;
	}

	public ArrayList<CommentUserInfo> getCommentArray(Connection con, int getmBook_UID) {
		if(con == null) return null;
		
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		CommentUserInfo comment = null;
		ArrayList<CommentUserInfo> comtArray = new ArrayList<CommentUserInfo>();
		MainQueryProperties prop = new MainQueryProperties();
		
		try{
			String query = prop.getCommentArrayQ();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getmBook_UID);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next())
			{
				comment = new CommentUserInfo();
				comment.setRating(rSet.getDouble("RATING"));
				comment.setComment_Content(rSet.getString("BOOK_COMMENT"));
				comment.seteMail(rSet.getString("E_MAIL"));
				comment.setWritedDate(rSet.getDate("WRITED_DATE"));
				comtArray.add(comment);
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
			comtArray = null;
		}finally
		{
			close(rSet);
			close(pstmt);
		}
		
		// If not Have Data
		if(comtArray.size() <=0 ) comtArray = null;
		
		return comtArray;
	}
}
