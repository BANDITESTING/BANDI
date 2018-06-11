package com.semi.bandi.model.service.cart;

import static com.semi.bandi.template.JDBCTemplate.close;

import java.sql.Connection;

import com.semi.bandi.model.dao.cart.CartDao;
import com.semi.bandi.model.vo.Cart;

import static com.semi.bandi.template.JDBCTemplate.*;

public class CartService {

	private CartDao cDao;
	
	public CartService(){
		cDao = new CartDao();
	}

	public int insertCart(Cart cart) {
		Connection con = getInstance();
		int result = cDao.insertCart(con, cart);
		
		if(result >= 1) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int existBook(Cart cart) {
		Connection con = getInstance();
		int result = cDao.existBook(con, cart);
		
		close(con);
		
		return result;
	}	
	
}
