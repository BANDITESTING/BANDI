package com.semi.bandi.controller.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.bandi.model.service.cart.CashService;
import com.semi.bandi.model.vo.Cart;
import com.semi.bandi.model.vo.OrderDetail;
import com.semi.bandi.model.vo.User;

// 주문 완료

@WebServlet("/complete.ct")
public class OrderCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderCompleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookList = request.getParameter("bookList");
		String quanList = request.getParameter("quanList");
		String userData = request.getParameter("userData");
		int usePoint = Integer.parseInt(request.getParameter("usePoint"));
		int deliveryPay = Integer.parseInt(request.getParameter("deliveryPay"));
		int orderTotal = Integer.parseInt(request.getParameter("orderTotal"));
		int priceTotal = Integer.parseInt(request.getParameter("priceTotal"));
				
		String[] bookArr = bookList.split(",");
		String[] quanArr = quanList.split(",");
		String[] userArr = null;
		
		HttpSession session = request.getSession(false);
		User sessionUser = (User)session.getAttribute("user");
		
		User user = new User();
		
		// 기존 로그인 계정 정보인지 새로운 배송지 정보인지 구분하여 변수에 데이터를 담는 부분
		if (!userData.equals("0")) {
			
			userArr = userData.split(",");
			
			user.setmName(userArr[0]);
			user.setmPhone(userArr[1]);
			user.setmAddress(userArr[2]);
			user.setmUser_UID(sessionUser.getmUser_UID());
			user.setmGrade(sessionUser.getmGrade());
			
		} else {
			
			user = sessionUser;
			
		}
		
		// ORDER_TABLE에 데이터 INSERT 성공하면 ORDER_DETAIL에 데이터 INSERT
		CashService cService = new CashService();
		
		String page = "";
		double gradeRate = cService.changePointRate(user.getmGrade());
		int result = cService.insertOrder(bookArr, quanArr, user, priceTotal, usePoint, (int)(priceTotal * gradeRate));
		
		if (result > 0) {
			
			// 성공하면 ORDER에 INSERT된 데이터 CART에서 지우기
			// Cart 객체 배열 만들기
			Cart[] cart = new Cart[bookArr.length];
			for (int i = 0 ; i < cart.length ; i++) {
				
				cart[i] = new Cart(user.getmUser_UID(), Integer.parseInt(bookArr[i]), Integer.parseInt(quanArr[i]));
				
			}
			
			result = cService.deleteBasket(cart);
			
			if (result > 0) {

				result = cService.updateUserPoint(sessionUser, usePoint, " - ? WHERE USER_UID = ? AND E_MAIL = ?");
				sessionUser.setmBandi_Point(sessionUser.getmBandi_Point() - usePoint);
				session.setAttribute("user", sessionUser);
				
				if (result > 0) {

					// 모두다 성공하면 주문 완료 페이지로 이동 (주문번호, 로그인된 계정의 이름 필요)
					page = "/views/cart/orderComplete.jsp";
					String orderUID = cService.selectOrderUID(user);
					OrderDetail orderDetail = new OrderDetail(orderUID, user.getmAddress(), user.getmName(), user.getmPhone(), priceTotal, usePoint, (int)(priceTotal * gradeRate));

					request.setAttribute("orderDetail", orderDetail);
					request.setAttribute("orderTotal", orderTotal);
					request.setAttribute("deliveryPay", deliveryPay);
					
				} else {
					
					page = "/views/common/errorPage.jsp";
					request.setAttribute("msg", "사용자 포인트 갱신 실패. (관리자에게 문의 바랍니다)");
					
				}
				
			} else {

				page = "/views/common/errorPage.jsp";
				request.setAttribute("msg", "장바구니 정보 삭제 실패. (관리자에게 문의 바랍니다)");
				
			}
						
		} else {
			
			page = "/views/cart/productOrder.jsp";
			request.setAttribute("msg", "주문 실패.");
			
		}
				
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
