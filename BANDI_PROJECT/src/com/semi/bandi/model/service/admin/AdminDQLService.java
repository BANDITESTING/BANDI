package com.semi.bandi.model.service.admin;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.bandi.model.dao.admin.AdminDao;
import com.semi.bandi.model.vo.Writer;
import com.semi.bandi.model.vo.adminVo.AnnualIncome;
import com.semi.bandi.model.vo.adminVo.BookStocks;
import com.semi.bandi.model.vo.adminVo.CommentAdmin;
import com.semi.bandi.model.vo.adminVo.OrderAdmin;

import static com.semi.bandi.template.JDBCTemplate.*;

public class AdminDQLService 
{
	public AdminDQLService(){}
	// ALL DQL - No need to COMMIT AND ROLLBACK.
	public ArrayList<Writer> getWriterArray(String name)
	{
		AdminDao adDao = new AdminDao();
		Connection con =  getInstance();
		ArrayList<Writer> getWriter = adDao.getWriterArray(con, name);
		
		close(con);
		return getWriter;
	}
	
	public Writer getWriterbyCode(String code)
	{
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		Writer  writer = adDao.getWriterCode(con, code);
		close(con);	
		return writer;
	}
	
	public boolean getImageByName(String imgName)
	{
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		boolean key = adDao.getImageName(con, imgName);
		close(con);
		
		return key;
	}

	public boolean getExistByISBN(String ISBN) {
		AdminDao adDao = new AdminDao();
		Connection con =  getInstance();
		return adDao.existISBN(con, ISBN);
	}
	
	public ArrayList<AnnualIncome> getAnnualArrayList(int year){
		AdminDao adDao = new AdminDao();
		Connection con =  getInstance();
		
		return adDao.getAnnualList(con, year);
	}
	
	// Get All Income 
	public int getTotalIncome(int year)
	{
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		
		return adDao.getTotalIncome(con, year);
	}
	
	public int getStockOfBooks(int minStock) {
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		
		return adDao.getStockOfBooks(con, minStock);
	}
	public int getCommentOfCount(int year) {
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		
		return adDao.getCommentOfCount(con, year);
	}
	
	public int getOrderCount(int year) {
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		
		return adDao.getOrderCount(con, year);
	}
	
	public ArrayList<BookStocks> getBookStocksArray(int min) 
	{
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		
		return adDao.getBookStocksArray(con ,min);
	}
	public ArrayList<CommentAdmin> getCommentArrayList(int year) {
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		return adDao.getCommentArray(con, year);
	}
	public ArrayList<OrderAdmin> getOrderArrayList(int year) {
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		return adDao.getOrderArray(con, year);
	}
	public BookStocks getBooksRecInfo(String mISBN) {
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		return adDao.getBookByISBN(con, mISBN);
	}
	public ArrayList<BookStocks> getBookStocksArray(String title) {
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		return adDao.getBooksByTitle(con, title);
	}
	public BookStocks getBookByISBN(String mISBN) {
		AdminDao adDao = new AdminDao();
		Connection con = getInstance();
		return adDao.getBookByISBN_DAO(con, mISBN);
	}
}
