package com.semi.bandi.template;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.semi.bandi.template.PropertiesTemplate;

public class MainQueryProperties 
{
	
	private Properties prop;
	private String mainQueryBestSell;
	
	public MainQueryProperties()
	{
		prop = new Properties();
		mainQueryBestSell = MainQueryProperties.class.getResource("/config/main/query/mainquery.properties").getPath();
	}
	
	public String getBestSellerQ()
	{
		String query = null;
		try {
			prop.load(new FileReader(mainQueryBestSell));
			query = prop.getProperty("bestSellQ");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getRankedBook()
	{
		String query = null;
		try {
			prop.load(new FileReader(mainQueryBestSell));
			query = prop.getProperty("rankQ");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return query;
	}
	
	public String getCommentArrayQ()
	{
		String query = null;
		try {
			prop.load(new FileReader(mainQueryBestSell));
			query = prop.getProperty("commentQ");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return query;
	}
	
	
	
}
