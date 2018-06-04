package com.semi.bandi.template;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class CashQueryProperties 
{
	
	private Properties prop;
	private String cashQuery;
	
	public CashQueryProperties()
	{
		prop = new Properties();
		cashQuery = CashQueryProperties.class.getResource("/config/cash/cash.properties").getPath();
	}
	
	public String dmlQueryForOrder()
	{
		String query = null;
		
		try {
			prop.load(new FileReader(cashQuery));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return query;
	}
}
