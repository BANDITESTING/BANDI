package com.semi.bandi.template;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class DetailQueryProperties 
{
	private Properties prop;
	private String detailQuery;
	
	public DetailQueryProperties()
	{
		prop = new Properties();
		detailQuery = DetailQueryProperties.class.getResource("/config/detail/detail-query.properties").getPath();
	}
	
	public String dmlQueryForOrder()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(detailQuery));
			query = prop.getProperty("selectOne");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String reviewInsert()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(detailQuery));
			query = prop.getProperty("insertReview");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String showReview()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(detailQuery));
			query = prop.getProperty("showReview");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String updateReview()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(detailQuery));
			query = prop.getProperty("updateReview");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String deleteReview()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(detailQuery));
			query = prop.getProperty("deleteReview");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String listCount()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(detailQuery));
			query = prop.getProperty("listCount");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String selectList()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(detailQuery));
			query = prop.getProperty("selectList");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String top4()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(detailQuery));
			query = prop.getProperty("top4Book");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
	
}
