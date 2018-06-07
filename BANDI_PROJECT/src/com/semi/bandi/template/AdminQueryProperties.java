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
}
