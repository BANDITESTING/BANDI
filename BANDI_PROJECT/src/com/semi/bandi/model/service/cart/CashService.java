package com.semi.bandi.model.service.cart;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.bandi.model.dao.cart.CashDao;
import com.semi.bandi.model.vo.Cart;
import com.semi.bandi.model.vo.OrderDetail;
import com.semi.bandi.model.vo.User;

import static com.semi.bandi.template.JDBCTemplate.*;

public class CashService {

	private CashDao cDao = null;
	
	public CashService() {
		
		cDao = new CashDao();
		
	}
	
	// 장바구니 페이지 이동 시 장바구니에 담긴 데이터를 읽어오는 서비스
	public ArrayList<Cart> selectBasket(int user_UID) {

		Connection con = getInstance();
		
		ArrayList<Cart> result = cDao.selectBasket(con, user_UID);
		
		close(con);
		
		return result;
		
	}
	
	// 장바구니 페이지에서 일어나는 삭제를 수행하는 서비스
	public int deleteBasket(Cart[] cart) {
		
		Connection con = getInstance();
		
		int result = cDao.deleteBasket(con, cart);
		
		if (result == cart.length) {
			
			commit(con);
			
		} else {
			
			rollback(con);
			
		}
		
		close(con);
		
		return result;
		
	}
	
	// 주문/결제 페이지 이동 시 선택 된 도서 정보를 읽어오는 서비스
	public ArrayList<Cart> selectCart(String[] bookList, int useruid) {
		
		Connection con = getInstance();
		
		ArrayList<Cart> result = cDao.seletCart(con, bookList, useruid);
		
		close(con);
		
		return result;
		
	}
	
	// 조회한 등급 적립률 계산 기능
	public double changePointRate(String grade) {
		
		double result = 0.0;
		
		switch (grade) {
		
		case "B" : 
			result = 0.1;
			break;
		case "S" :
			result = 0.2;
			break;
		case "G" :
			result = 0.3;
			break;
		case "P" : 
			result = 0.4;
			break;
		case "D" :
			result = 0.5;
			break;
		
		}
		
		return result;
		
	}
	
	// 주문 내역 ORDER_TABLE/DETAIL INSERT 기능
	public int insertOrder(String[] bookArr, String[] quanArr, User user) {
		
		Connection con = getInstance();
		
		int sequence = cDao.selectSequence(con);
		int result = cDao.insertOrderTable(con, user, sequence);
		
		if (result > 0) {
			
			commit(con);

			String orderUID = cDao.selectOrderUID(con, user);
			
			result = cDao.insertOrderDetail(con, bookArr, quanArr, orderUID);
			
			if (result > 0) {
				
				commit(con);
				
			} else {
				
				rollback(con);
			}
			
		} else {
			
			rollback(con);
			
		}
		
		close(con);
		
		return result;	// order table/detail 최종 결과를 넘겨줌
		
	}
	
	// 로그인 계정 포인트 업데이트 서비스
	public int updateUserPoint(User user, int usePoint, double addPoint) {
		Connection con = getInstance();
		
		int result = cDao.updateUserPoint(con, user, usePoint, addPoint);
		
		if (result > 0) {
			
			commit(con);
			
		} else {
			
			rollback(con);
			
		}
		
		close(con);
		
		return result;
	}
	
	// 주문 완료시 해당 주문 번호를 넘기는 서비스
	public String selectOrderUID(User user) {
		Connection con = getInstance();
		
		String result = cDao.selectOrderUID(con, user);
		
		close(con);
		
		return result;
	}

	public ArrayList<OrderDetail> selectOrderTable(int useruid) {
		Connection con = getInstance();
		
		ArrayList<OrderDetail> result = cDao.selectOrderTable(con, useruid);
		
		close(con);
		
		return result;
	}

}