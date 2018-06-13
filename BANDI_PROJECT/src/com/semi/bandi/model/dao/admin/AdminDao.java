package com.semi.bandi.model.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.bandi.model.vo.Book;
import com.semi.bandi.model.vo.Writer;
import com.semi.bandi.model.vo.adminVo.AnnualIncome;
import com.semi.bandi.model.vo.adminVo.BookStocks;
import com.semi.bandi.model.vo.adminVo.CommentAdmin;
import com.semi.bandi.model.vo.adminVo.OrderAdmin;
import com.semi.bandi.model.vo.adminVo.PieChartData;
import com.semi.bandi.template.AdminQueryProperties;

import static com.semi.bandi.template.JDBCTemplate.*;

public class AdminDao 
{
	public AdminDao(){};
	
	public ArrayList<Writer>  getWriterArray(Connection con, String writerName)
	{
		if(con == null) return null;
		
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		ArrayList<Writer> writerArray = new ArrayList<Writer>();
		
		String query = "SELECT * FROM WRITER WHERE WRITER_NAME LIKE ?";
		
		try{
			pstmt = con.prepareStatement(query);
			
		    pstmt.setString(1, "%"+writerName + "%");
		    
		    rSet = pstmt.executeQuery();
		    
		    while(rSet.next())
		    {
		    	String mWriterCode = rSet.getString(1);
		    	String mWriterName  = rSet.getString(2);
		    	String mWriterIntroduce = rSet.getString(3);
		    	Writer  write = new Writer(mWriterCode, mWriterName, mWriterIntroduce);
		    	writerArray.add(write);
		    }
			
		}catch(Exception e)
		{
			writerArray = null;
		}finally
		{
			close(rSet);
			close(pstmt);
		}
		
		return writerArray;
	}
	
	public boolean getImageName(Connection con, String imgName)
	{
		if(con == null) return false;
		
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		boolean key = false;
		
		String query = "SELECT * FROM BANDI_BOOK WHERE IMAGE = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, imgName);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next()) // This Code only one Execute, Because img is unique in DataBase
				key = true;
					
		}catch(SQLException e){ e.printStackTrace();}
		finally
		{
			close(rSet);
			close(pstmt);
		}
		
		return key;
	}
	
	public Writer getWriterCode(Connection con, String code)
	{
		if(con == null) return null;
		
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		Writer writer =  null;
		
		String query = "SELECT * FROM WRITER WHERE WRITER_CODE = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, code);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next()) // This code only get one Writer, because of WriterCode[Unique Key]
				writer = new Writer(rSet.getString(1), rSet.getString(2),rSet.getString(3));
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
		}
		
		return  writer;
	}
	
	public boolean existISBN(Connection con,  String ISBN)
	{
		if(con == null) return false;
		
		boolean result = false;
		
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = "SELECT * FROM BANDI_BOOK WHERE  ISBN = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, ISBN);
			
			rSet  =  pstmt.executeQuery();
			
			while(rSet.next()) // ISBN is Unique Key, so Must GET  1 rSet Size.
				result = true;
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return result;
	}

	public boolean insertBook(Connection con, Book book, String date) {
		if(con == null) return false;
		boolean result = false;
		
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO BANDI_BOOK VALUES (BOOK_SEQUENCE.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
				+ "TO_DATE(?,'DD.MM.YYYY'))";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, book.getmISBN()); // ISBN
			pstmt.setString(2, book.getmTitle()); // TITLE
			pstmt.setInt(3, book.getmPrice()); //PRICE
			pstmt.setString(4, book.getmWriterCode()); // Writer Code
			pstmt.setString(5, book.getmPublisher()); // Publisher
			pstmt.setInt(6, book.getmQuantity());  // Quantity
			pstmt.setString(7, book.getmGenreCode()); //Genre & Category
			pstmt.setString(8, book.getmOrigin()); //Origin
			pstmt.setString(9, book.getmIntroduceBook()); // Introduce & explain About book
			pstmt.setInt(10, book.getmPage()); // Page Count about book
			pstmt.setString(11, book.getmImagePath()); // Image Name. and This should have from server
			pstmt.setString(12, date); // date format dd.mm.yyyy
			
			int get = pstmt.executeUpdate();
			
			if(get > 0) result = true;
			else result = false;
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(pstmt);
		}
		
		return result;
	}

	public boolean insertWriter(Connection con, Writer writer) {
		if(con == null) return false;
		boolean result = false;
		
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO WRITER VALUES (?, ?, ?)";
		
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, writer.getmWriterCode());
			pstmt.setString(2, writer.getmWriterName());
			pstmt.setString(3, writer.getmWriterIntroduce());
			
			int succCount =	pstmt.executeUpdate();
			System.out.println("성공횟수" +succCount);
			if(succCount > 0) result = true;
			else result = false;
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<AnnualIncome> getAnnualList(Connection con, int year) {
		if(con == null) return null;
		ArrayList<AnnualIncome> arrayIncome = null;
		
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().dmlQueryForOrder();
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, year+"");
			
			rSet = pstmt.executeQuery();
			arrayIncome = new ArrayList<AnnualIncome>();
			AnnualIncome annual;
			while(rSet.next())
			{
				annual = new AnnualIncome();
				annual.setmOrderDate(rSet.getString(1));
				annual.setmOrderCount(rSet.getInt(3));
				annual.setmPacketPrice(rSet.getInt(4)); // Change for Point, But Use This Name Packet. --> Point
				annual.setmOrderBooksCount(rSet.getInt(5));
				
				// Total Income.
				annual.setmSumPrice(rSet.getInt(2) - annual.getmPacketPrice()); //  - Point 
				
				arrayIncome.add(annual);
			}
			
		}catch(SQLException e)
		{
			arrayIncome = null;
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return arrayIncome;
	}

	// Get Total Income + Packet Income too.
	public int getTotalIncome(Connection con, int year) {
		if(con == null) return -1;
		
		int totalIncome = -1;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().getTotalIncomeQuery();
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, year+"");
			
			rSet  = pstmt.executeQuery();
			
			// But this While loop, only one Execute, Because Just return one resultSet;
			while(rSet.next()) 
			{
				totalIncome =  rSet.getInt(1); // + rSet.getInt(2);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return totalIncome;
	}

	public int getStockOfBooks(Connection con, int min) {
		if(con == null) return -1;
		
		int booksCount = -1;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().getStockOfBooksCount();
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, min+"");
			
			rSet  = pstmt.executeQuery();
			
			// But this While loop, only one Execute, Because Just return one resultSet;
			while(rSet.next()) 
			{
				booksCount =  rSet.getInt(1);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return booksCount;
	}

	public int getCommentOfCount(Connection con, int year) {
		if(con == null) return -1;
		
		int totalCommentCount = -1;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().getCommentCount();
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, year+"");
			
			rSet  = pstmt.executeQuery();
			
			// But this While loop, only one Execute, Because Just return one resultSet;
			while(rSet.next()) 
			{
				totalCommentCount =  rSet.getInt(1);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return totalCommentCount;
	}

	public int getOrderCount(Connection con, int year) {
		if(con == null) return -1;
		
		int totalorderCount = -1;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().getOrderCount();
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, year+"");
			
			rSet  = pstmt.executeQuery();
			
			// But this While loop, only one Execute, Because Just return one resultSet;
			while(rSet.next()) 
				totalorderCount =  rSet.getInt(1);
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return totalorderCount;
	}

	public ArrayList<BookStocks> getBookStocksArray(Connection con, int min) {
		if(con == null) return null;
		
		ArrayList<BookStocks> array = new ArrayList<BookStocks>();
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().getStockOfBooksTable();
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, min);
			
			rSet = pstmt.executeQuery();
			BookStocks bookStock;
			while(rSet.next())
			{
				bookStock = new BookStocks();
				
				bookStock.setmBook_UID(rSet.getInt(1));
				bookStock.setmISBN(rSet.getString(2));
				bookStock.setmTitle(rSet.getString(3));
				bookStock.setmWriterName(rSet.getString(4));
				bookStock.setmQuantity(rSet.getInt(5));
				array.add(bookStock);
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
			array = null;
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return array;
	}

	public ArrayList<CommentAdmin> getCommentArray(Connection con, int year) 
	{
		if(con == null) return null;
		
		ArrayList<CommentAdmin> array = new ArrayList<CommentAdmin>();
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().getCommentTable();
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, year);
			
			rSet = pstmt.executeQuery();
			CommentAdmin comment;
			
			while(rSet.next())
			{
				comment = new CommentAdmin();
				comment.setmComment_UID(rSet.getInt(1));
				comment.setmCommentBook_Title(rSet.getString(2));
				comment.setmEmail(rSet.getString(3));
				comment.setMbook_Comment(rSet.getString(4));
				comment.setmWritedDate(rSet.getString(5));
				array.add(comment);
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
			array = null;
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return array;
	}

	public ArrayList<OrderAdmin> getOrderArray(Connection con, int year) {
		if(con == null) return null;
		
		ArrayList<OrderAdmin> array = new ArrayList<OrderAdmin>();
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().getOrderTable();
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, year);
			
			rSet = pstmt.executeQuery();
			OrderAdmin order;
			
			while(rSet.next())
			{
				order = new OrderAdmin();
				order.setmOrder_UID(rSet.getString(1));
				order.setmEmail(rSet.getString(2));
				order.setmName(rSet.getString(3));
				order.setmTel(rSet.getString(4));
				order.setmOrder_Date(rSet.getString(5));
				array.add(order);
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
			System.out.println("ORDER TABLE ERROR");
			array = null;
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return array;
		
	}

	public BookStocks getBookByISBN(Connection con, String mISBN) {
		if(con == null) return null;
		
		BookStocks book = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query ="SELECT TITLE, ISBN, GENRE||'/'||SUB_GENRE, WRITER_NAME, PRICE, PAGE FROM BANDI_BOOK JOIN WRITER USING(WRITER_CODE) JOIN GENRE USING(GENRE_CODE) WHERE ISBN= ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mISBN);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next())
			{
				book = new BookStocks();
				book.setmTitle(rSet.getString(1));
				book.setmISBN(rSet.getString(2));
				book.setmGenreCode(rSet.getString(3));
				book.setmWriterName(rSet.getString(4));
				book.setmPrice(rSet.getInt(5));
				book.setmPage(rSet.getInt(6));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return book;
	}

	public ArrayList<BookStocks> getBooksByTitle(Connection con, String title) {
		if(con == null) return null;
		
		ArrayList<BookStocks> books = new ArrayList<BookStocks>();
		BookStocks book;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = "SELECT TITLE, ISBN, GENRE||'/'||SUB_GENRE, WRITER_NAME,PAGE, PRICE , IMAGE FROM BANDI_BOOK JOIN WRITER USING(WRITER_CODE) JOIN GENRE USING(GENRE_CODE) WHERE TITLE LIKE ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,"%"+title+"%");
			rSet = pstmt.executeQuery();
			
			while(rSet.next())
			{
				book = new BookStocks();
				book.setmTitle(rSet.getString(1));
				book.setmISBN(rSet.getString(2));
				book.setmGenreCode(rSet.getString(3));
				book.setmWriterName(rSet.getString(4));
				book.setmPage(rSet.getInt(5));
				book.setmPrice(rSet.getInt(6));
				book.setmImagePath(rSet.getString(7));
				books.add(book);
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
			books = null;
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return books;
	}

	public BookStocks getBookByISBN_DAO(Connection con, String mISBN) {
		if(con == null) return null;
		BookStocks book = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = "SELECT TITLE, ISBN, GENRE||'/'||SUB_GENRE, WRITER_NAME,PAGE, PRICE , IMAGE FROM BANDI_BOOK JOIN WRITER USING(WRITER_CODE) JOIN GENRE USING(GENRE_CODE) WHERE ISBN = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mISBN);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next())
			{
				book = new BookStocks();
				book.setmTitle(rSet.getString(1));
				book.setmISBN(rSet.getString(2));
				book.setmGenreCode(rSet.getString(3));
				book.setmWriterName(rSet.getString(4));
				book.setmPage(rSet.getInt(5));
				book.setmPrice(rSet.getInt(6));
				book.setmImagePath(rSet.getString(7));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
			book = null;
		}finally{
			close(rSet);
			close(pstmt);
			close(con);
		}
		return book;
	}

	public boolean updateRecBandiBooks(Connection con, String before, String after) {
		if(con == null) return false;
		
		boolean key = false;
		
		PreparedStatement pstmt = null;
		System.out.println("before :" + before);
		System.out.println("after:" + after);
		String query  = "UPDATE TOP10_BOOKS_BANDI SET ISBN = ? WHERE ISBN = ?";
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, after);
			pstmt.setString(2, before);
			
			int count = pstmt.executeUpdate();
			if(count > 0) key = true;
		}catch(SQLException e)
		{
			key = false;
		}finally{
			close(pstmt);
		}
		return key;
	}

	public ArrayList<PieChartData> getGenreCountsVo(Connection con, int year) {
		if(con == null) return null;
		
		ArrayList<PieChartData> dataArray = new ArrayList<PieChartData>();
		PieChartData data = null;
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		String query = new AdminQueryProperties().getGenreCountQuery();
		
		if(query == null) return null;
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, year+"");
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next())
			{
				data = new PieChartData();
				data.setLabel(rSet.getString(1));
				data.setData(rSet.getInt(2));
				dataArray.add(data);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
			dataArray = null;
		}finally
		{
			close(rSet);
			close(pstmt);
			close(con);
		}
		
		return dataArray;
	}
	
	
}
