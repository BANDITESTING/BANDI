package com.semi.bandi.controller.cart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.semi.bandi.model.service.cart.CashService;
import com.semi.bandi.model.vo.Cart;
import com.semi.bandi.model.vo.User;

// 주문 / 결제

@WebServlet("/order.ct")
public class ProductOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductOrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookData = request.getParameter("bookUID");
		
		HttpSession session = request.getSession(false);
		
		User user = (User)session.getAttribute("user");

		double point = 0;
		String page = "";
		
		String[] bookList = bookData.split(",");
		
		// bookList 확인 부분 [START]
		System.out.println("bookData 확인 : " + bookData);
		System.out.println("bookList length : " + bookList.length);
		
		for (int i = 0 ; i < bookList.length ; i++) {
			
			System.out.println("bookList 확인 : " + bookList[i]);
			
		}
		// bookList 확인 부분 [END]
		
		CashService cService = new CashService();
		
		ArrayList<Cart> result = cService.selectCart(bookList, user.getmUser_UID());
				
		if (user == null) {		// 로그인 정보 확인 (로그인 되어있지 않으면 주문/결제에 접근할 수 없다.)
			
			page = "/views/main/Main.jsp";
			
		} else {
			
			String query = "SELECT GRADE_CODE, E_MAIL, NAME, PHONE ";
			
			user = cService.orderUser(user.getmUser_UID(), query);
			
			System.out.println("user : " + user);

			if (result != null) {	// 주문 정보 조회 성공
				
				page = "views/cart/productOrder.jsp";
				
				request.setAttribute("cartList", result);
				
			} else {		// 주문 정보 조회 실패
				
				page = "views/cart/shoppingCart.jsp";
				
			}
			
			switch(user.getmGrade()) {
			
				case "B" : 
					point = 0.1;
					break;
				case "S" :
					point = 0.2;
					break;
				case "G" :
					point = 0.3;
					break;
				case "P" : 
					point = 0.4;
					break;
				case "D" :
					point = 0.5;
					break;
			
			}
			
			request.setAttribute("user", user);
			request.setAttribute("point", point);
			
		}
		
		System.out.println("point : "+ point);
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
