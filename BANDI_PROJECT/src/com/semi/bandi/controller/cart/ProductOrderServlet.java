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

		String page = "";
		
		String[] bookList = bookData.split(",");
		
		CashService cService = new CashService();
		
		ArrayList<Cart> result = null;
				
		if (user == null) {		// 로그인 정보 확인 (로그인 되어있지 않으면 주문/결제에 접근할 수 없다.)
			
			page = "/views/member/jlogin.jsp";
			
		} else {
			
			result = cService.selectCart(bookList, user.getmUser_UID());
			double pointRate = cService.changePointRate(user.getmGrade());
			
			if (result != null) {	// 주문 정보 조회 성공
				
				page = "views/cart/productOrder.jsp";
				
				request.setAttribute("cartList", result);
				
			} else {		// 주문 정보 조회 실패
				
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "주문 조회 실패");
				
			}
			
			request.setAttribute("user", user);
			request.setAttribute("pointRate", pointRate);
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
