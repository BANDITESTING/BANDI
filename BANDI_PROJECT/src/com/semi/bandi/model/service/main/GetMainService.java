package com.semi.bandi.model.service.main;

import com.semi.bandi.junk.main.DefaultData;
import com.semi.bandi.model.dao.main.MainDao;
import com.semi.bandi.model.vo.Book;
import com.semi.bandi.model.vo.mainVo.CommentUserInfo;
import com.semi.bandi.model.vo.mainVo.RankedBookInfo;
import com.semi.bandi.template.PropertiesTemplate;
import static com.semi.bandi.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class GetMainService 
{
	
	public GetMainService(){}
	
	// Return String Array for Event Banner.
	public String[] getEventBanner()
	{
		return new PropertiesTemplate().getEventString();
	}
	
	public Book[] getRecommendBandi()
	{
		MainDao  mDao = new MainDao();
		Connection con = getInstance();
		Book[] bookArray  = mDao.getRecommendBook(con);
		
		if(bookArray == null || con == null)
		{ 
			DefaultData defaultBook = new DefaultData();
			bookArray = defaultBook.returnBookData();
		}
		
		close(con);
		
		return bookArray;
	}
	
	
	public Book[] getbestSeller(String typeCode)
	{
		Book[] bookArray = null;
		MainDao mDao = new MainDao();
		Connection con = getInstance();
		
		bookArray = mDao.getBestSeller(con, typeCode);
		
		if(bookArray == null || con == null)
		{
			DefaultData defaultBook = new DefaultData();
			bookArray = defaultBook.returnBestSeller();
		}
		
		close(con);
		return bookArray;
	}

	public RankedBookInfo getRatedBook(String category) 
	{
		MainDao mDao = new MainDao();
		Connection con = getInstance();
		
		RankedBookInfo rankBook = mDao.getRankBook(con , category);
		
		close(con);
		
		return rankBook;
	}

	public ArrayList<CommentUserInfo> getCommentArray(int getmBook_UID) {
		MainDao mDao = new MainDao();
		Connection con = getInstance();
		
		ArrayList<CommentUserInfo> cont = mDao.getCommentArray(con, getmBook_UID);
		
		close(con);
		return cont;
	}
		
}
