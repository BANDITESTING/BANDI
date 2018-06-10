package com.semi.bandi.template;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.util.Properties;

public class PropertiesTemplate 
{
	Properties prop;
	String eventFileName;
	String bandiRecommendFileName;
	
	private static int EVENT_COUNT = 4;
	private static int RECOMMEND_BOOK_COUNT = 10;
	
	public PropertiesTemplate()
	{
		prop = new Properties();
		eventFileName = PropertiesTemplate.class.getResource("/config/main/event/mainEvent.properties").getPath();
		bandiRecommendFileName = PropertiesTemplate.class.getResource("/config/main/event/bandiRecommend.properties").getPath();
	}
	
	// Write for ISBN RECOMMEND from BANDI
	public boolean writeRecommendBooks(String[] bookISBN)
	{
		boolean key = false;
		FileOutputStream output = null;
		String tempArray[] = {"one", "two","three","four","five","six" ,"seven","eight","nine","ten"};
		
		if(tempArray.length != bookISBN.length) return false;
		
		try{
			output = new FileOutputStream(new File(bandiRecommendFileName));
			for(int i = 0; i < bookISBN.length; i++)
			{
				System.out.println(tempArray[i]+" : "+bookISBN[i]);
				prop.setProperty(tempArray[i], bookISBN[i]);
			}
			prop.store(output, null);
			output.close();
			key = true;
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("error");
		}
		
		return key;
	}
	
	/* Get ISBN Number */
	public String[] getRecommendBook()
	{
		String[] getISBN = new String[RECOMMEND_BOOK_COUNT];
		
		try{
			prop.load(new FileReader(bandiRecommendFileName));
			
			getISBN[0] = prop.getProperty("one");
			getISBN[1] = prop.getProperty("two");
			getISBN[2] = prop.getProperty("three");
			getISBN[3] = prop.getProperty("four");
			getISBN[4] = prop.getProperty("five");
			getISBN[5] = prop.getProperty("six");
			getISBN[6] = prop.getProperty("seven");
			getISBN[7] = prop.getProperty("eight");
			getISBN[8] = prop.getProperty("nine");
			getISBN[9] = prop.getProperty("ten");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return getISBN;
	}
	
	public String[] getEventString()
	{
		String[] getEvent = new String[EVENT_COUNT];
		
		try{
			prop.load(new FileReader(eventFileName));
			String event1 = prop.getProperty("firstImage");
			String event2 = prop.getProperty("secondImage");
			String event3 = prop.getProperty("thirdImage");
			String event4 = prop.getProperty("FourthImage");
			
			if(event1 != null) getEvent[0] = event1;
			if(event2 != null) getEvent[1] = event2;
			if(event3 != null) getEvent[2] = event3;
			if(event4 != null) getEvent[3] = event4;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return getEvent;
	}
}
