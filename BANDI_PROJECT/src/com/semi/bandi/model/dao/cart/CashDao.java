package com.semi.bandi.model.dao.cart;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.bandi.model.vo.Cart;
import com.semi.bandi.model.vo.OrderDetail;
import com.semi.bandi.model.vo.User;

import static com.semi.bandi.template.JDBCTemplate.*;

public class CashDao {
	
	private Properties prop = null;
	
	public CashDao() { 
		
		prop = new Properties();
		
		String fileName = CashDao.class.getResource("/config/cart/cart-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(fileName));
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}
	
	public ArrayList<Cart> selectBasket(Connection con, int user_UID) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart> result = null;
				
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("selectCart"));
			
			pstmt.setInt(1, user_UID);
			
			rset = pstmt.executeQuery();

			result = new ArrayList<Cart>();
			
			while (rset.next()) {
				
				Cart cart = new Cart();
				
				cart.setUserUID(rset.getInt("USER_UID"));
				cart.setBookUID(rset.getInt("BOOK_UID"));
				cart.setBookQuantity(rset.getInt("CART_QUANTITY"));
				cart.setImage(rset.getString("IMAGE"));
				cart.setPrice(rset.getInt("PRICE"));
				cart.setTitle(rset.getString("TITLE"));
				
				result.add(cart);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
						
		}
		
		return result;
		
	}
		
	public int deleteBasket(Connection con, Cart[] cart) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("deleteBasket"));
			
			for (int i = 0 ; i < cart.length ; i++) {

				pstmt.setInt(1, cart[i].getUserUID());
				pstmt.setInt(2, cart[i].getBookUID());
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public ArrayList<Cart> seletCart(Connection con, String[] bookList, int useruid) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart>result = null;
		
		String query = " AND (";
		
		for (int i = 0 ; i < bookList.length ; i++) {
			
			if (i != bookList.length - 1) {
				
				query += "B.BOOK_UID = ? OR ";
				
			} else {
				
				query += "B.BOOK_UID = ?";
				
			}
			
		} query += ")";
				
		try {

			pstmt = con.prepareStatement(prop.getProperty("selectCart") + query);
			
			pstmt.setInt(1, useruid);
			
			for (int i = 1 ; i <= bookList.length ; i++) {
				
				pstmt.setInt((i + 1), Integer.parseInt(bookList[i-1]));
				
			}
			
			rset = pstmt.executeQuery();
			
			result = new ArrayList<Cart>();
			
			while (rset.next()) {
				
				Cart cart = new Cart();
				
				cart.setUserUID(rset.getInt("USER_UID"));
				cart.setBookUID(rset.getInt("BOOK_UID"));
				cart.setBookQuantity(rset.getInt("CART_QUANTITY"));
				cart.setImage(rset.getString("IMAGE"));
				cart.setPrice(rset.getInt("PRICE"));
				cart.setTitle(rset.getString("TITLE"));
				
				result.add(cart);
				
			}
		
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	// 시퀀스 조회
	public int selectSequence(Connection con) {
		
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(prop.getProperty("selectSequence"));
			
			if (rset.next()) {
				
				result = rset.getInt(1);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(stmt);
			
		}
		
		return result;
		
	}
	
	// ORDER_TABLE INSERT 기능
	public int insertOrderTable(Connection con, User user, int sequence) {
		
		int result = 0;
		PreparedStatement pstmt = null;
				
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("insertOderTable"));
			
			pstmt.setString(1, String.valueOf(sequence));
			pstmt.setInt(2, user.getmUser_UID());
			pstmt.setString(3, user.getmAddress());
			pstmt.setString(4, user.getmName());
			pstmt.setString(5, user.getmPhone());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
		
	}
		
	// 주문 번호 조회 기능
	public String selectOrderUID(Connection con, User user) {
		
		String result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("selectUSERUID"));
			
			pstmt.setInt(1, user.getmUser_UID());
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				result = rset.getString("ORDER_UID");
				
			}
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	// ORDER_DETAIL INSERT 기능
	public int insertOrderDetail(Connection con, String[] bookArr, String[] quanArr, String orderUID) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("insertOrderDetail"));

			pstmt.setString(1, orderUID);
			
			for (int i = 0 ; i < bookArr.length ; i++) {
				
				pstmt.setInt(2, Integer.parseInt(bookArr[i]));
				pstmt.setInt(3, Integer.parseInt(quanArr[i]));
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch(SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}

		return result;
		
	}
	
	// 로그인 계정 포인트 업데이트
	public int updateUserPoint(Connection con, User user, int usePoint, double addPoint) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("updatePoint"));
			
			pstmt.setInt(1, usePoint);
			pstmt.setInt(2, (int)addPoint);
			pstmt.setInt(3, user.getmUser_UID());
			pstmt.setString(4, user.getmEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public ArrayList<OrderDetail> selectOrderTable(Connection con, int useruid) {
		ArrayList<OrderDetail> result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("selectOrderTable"));
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return result;
	}

}