package com.semi.bandi.model.dao.cart;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.bandi.model.vo.Cart;

import static com.semi.bandi.template.JDBCTemplate.*;

public class CartDao {

	public int insertCart(Connection con, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = con.prepareStatement("insert into cart values(?, ?, ?)");

			pstmt.setInt(1, cart.getUserUID());
			pstmt.setInt(2, cart.getBookUID());
			pstmt.setInt(3, cart.getBookQuantity());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int existBook(Connection con, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = con.prepareStatement("select * from cart where user_uid = ? and book_uid = ?");
			
			pstmt.setInt(1, cart.getUserUID());
			pstmt.setInt(2, cart.getBookUID());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
