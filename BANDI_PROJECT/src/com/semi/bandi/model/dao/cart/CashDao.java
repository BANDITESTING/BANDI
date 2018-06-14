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
import com.semi.bandi.model.vo.OrderTable;
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
				cart.setIsbn(rset.getString("ISBN"));
				
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
	
	public ArrayList<Cart> selectCart(Connection con, String[] bookList, int useruid) {
		
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
				cart.setIsbn(rset.getString("ISBN"));
				
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
	public int insertOrderTable(Connection con, User user, int sequence, int priceTotal, int usePoint, int point) {
		
		int result = 0;
		PreparedStatement pstmt = null;
				
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("insertOderTable"));
			
			pstmt.setString(1, String.valueOf(sequence));
			pstmt.setInt(2, user.getmUser_UID());
			pstmt.setString(3, user.getmAddress());
			pstmt.setString(4, user.getmName());
			pstmt.setString(5, user.getmPhone());
			pstmt.setInt(6,  priceTotal);
			pstmt.setInt(7, usePoint);
			pstmt.setInt(8, point);
			
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
	public int updateUserPoint(Connection con, User user, int usePoint, String query) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("updatePoint") + query);
			
			pstmt.setInt(1, usePoint);
			pstmt.setInt(2, user.getmUser_UID());
			pstmt.setString(3, user.getmEmail());
			
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
			
			pstmt.setInt(1, useruid);
			
			rset = pstmt.executeQuery();
			
			result = new ArrayList<OrderDetail>();
			
			while (rset.next()) {
				
				OrderDetail order = new OrderDetail();
				
				order.setOrderUID(rset.getString("ORDER_UID"));
				order.setUserUID(rset.getInt("USER_UID"));
				order.setShipping(rset.getString("SHIPPING"));
				order.setReceiver(rset.getString("RECEIVER"));
				order.setShippingSate(rset.getString("SHIPPING_STATE"));
				order.setPhone(rset.getString("RECEIVER_TEL"));
				order.setOrderDate(rset.getDate("ORDER_DATE"));
				order.setPrice(rset.getInt("TOTAL"));
				order.setDiscount(rset.getInt("DISCOUNT"));
				order.setPoint(rset.getInt("POINT"));
				
				result.add(order);
							
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}

		return result;
	}

	public ArrayList<OrderTable> selectOrderDetail(Connection con, String[] orderUID) {
		ArrayList<OrderTable> result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = " WHERE ORDER_UID = ";

		if (orderUID.length != 0) {
			for (int i = 0 ; i < orderUID.length ; i++) {
				
				if (i != orderUID.length - 1) {
					
					query += "? OR ORDER_UID = ";
					
				} else {
					
					query += "? ORDER BY 1 DESC";
					
				}
						
			}
		}
		
		try {
			if (orderUID.length != 0) {
				pstmt = con.prepareStatement(prop.getProperty("selectOrderDetail") + query);
				
				for (int i = 0 ; i < orderUID.length ; i++) {
					
					pstmt.setString((i + 1), orderUID[i]);
					
				}
				
				rset = pstmt.executeQuery();
				
				result = new ArrayList<OrderTable>();
				
				while (rset.next()) {
					
					OrderTable order = new OrderTable();
					
					order.setOrderUID(rset.getString(1));
					order.setBookUID(rset.getInt(2));
					order.setAmout(rset.getInt(3));
					order.setPrice((rset.getInt(4) * rset.getInt(3)));
					order.setImage(rset.getString(5));
					order.setTitle(rset.getString(6));
					order.setIsbn(rset.getString(7));
					
					result.add(order);
					
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}

		return result;
	}

	public ArrayList<OrderTable> selectCntOrderUid(Connection con, String[] orderUID) {
		ArrayList<OrderTable> result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = " WHERE ORDER_UID = ";
		
		for (int i = 0 ; i < orderUID.length ; i++) {
			
			if (i != orderUID.length - 1) {
				
				query += "? OR ORDER_UID = ";
				
			} else {
				
				query += "? GROUP BY ORDER_UID ORDER BY ORDER_UID DESC";
				
			}
					
		}
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("cntOrderUid") + query);
			
			for (int i = 0 ; i < orderUID.length ; i++) {
				
				pstmt.setString((i + 1), orderUID[i]);
				
			}
			
			rset = pstmt.executeQuery();
			
			result = new ArrayList<OrderTable>();
			
			while (rset.next()) {
				
				OrderTable order = new OrderTable();
				
				order.setCnt(rset.getInt(1));
				order.setOrderUID(rset.getString(2));
				
				result.add(order);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}

		return result;
	}

	public ArrayList<OrderTable> selectCancleData(Connection con, String orderUID, String[] bookUID) {
		ArrayList<OrderTable> result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = " WHERE ORDER_UID = ? AND (D.BOOK_UID =";
		
		for (int i = 0; i < bookUID.length; i++) {
			
			if (i != bookUID.length - 1) {
				
				query += "? OR D.BOOK_UID = ";
				
			} else {
				
				query += "?)";
				
			}
			
		}
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("selectCancleData") + query);
			
			pstmt.setString(1, orderUID);
			
			for (int i = 0; i < bookUID.length; i++) {
				
				pstmt.setInt(2+i, Integer.parseInt(bookUID[i]));
				
			}
			
			rset = pstmt.executeQuery();
			
			result = new ArrayList<OrderTable>();
			
			while (rset.next()) {
				
				OrderTable order = new OrderTable();
				
				order.setOrderUID(rset.getString(1));
				order.setBookUID(rset.getInt(2));
				order.setAmout(rset.getInt(3));
				order.setTitle(rset.getString(4));
				order.setPrice(rset.getInt(5));
				order.setImage(rset.getString(6));
				order.setIsbn(rset.getString(7));
				
				result.add(order);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteDetail(Connection con, String orderUID, String[] bookUID) {
		int result = 0;
		PreparedStatement pstmt = null;
				
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("deleteDetail"));

			for (int i = 0 ; i < bookUID.length ; i++) {
				
				pstmt.setString(1, orderUID);
				pstmt.setInt(2, Integer.parseInt(bookUID[i]));
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteTable(Connection con, String orderUID) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("deleteTable"));
			
			pstmt.setString(1, orderUID);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public int updateTable(Connection con, int canclePrice, String orderUID, double pointRate, int bookPrice, int point) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("updateTable"));
			
			pstmt.setInt(1, bookPrice);
			pstmt.setInt(2, canclePrice);
			pstmt.setInt(3, point);
			pstmt.setInt(4, bookPrice);
			pstmt.setInt(5, canclePrice);
			pstmt.setInt(6, point);
			pstmt.setDouble(7, pointRate);
			pstmt.setString(8, orderUID);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public int updateCart(Connection con, int useruid, String[] bookList, String[] quanList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement(prop.getProperty("updateCart"));
			
			pstmt.setInt(2, useruid);
			
			for (int i = 0 ; i < bookList.length ; i++) {
				
				pstmt.setInt(1, Integer.parseInt(quanList[i]));
				pstmt.setInt(3, Integer.parseInt(bookList[i]));
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}
	
}