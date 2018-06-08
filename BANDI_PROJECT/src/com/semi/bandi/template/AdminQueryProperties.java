package com.semi.bandi.template;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class AdminQueryProperties 
{
	private Properties prop;
	private String adminQuery;
	
	public AdminQueryProperties()
	{
		prop = new Properties();
		adminQuery = CashQueryProperties.class.getResource("/config/admin/query/adminQuery.properties").getPath();
	}
	
	public String dmlQueryForOrder()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(adminQuery));
			query = prop.getProperty("annual");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getTotalIncomeQuery()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(adminQuery));
			query = prop.getProperty("totalIncome");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getCommentCount()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(adminQuery));
			query = prop.getProperty("commentCount");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getOrderCount()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(adminQuery));
			query = prop.getProperty("orderCount");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getStockOfBooksCount()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(adminQuery));
			query = prop.getProperty("bookstockCount");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getStockOfBooksTable()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(adminQuery));
			query = prop.getProperty("bookstockTable");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getCommentTable()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(adminQuery));
			query = prop.getProperty("commentAll");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getOrderTable()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(adminQuery));
			query = prop.getProperty("orderTable");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
}
