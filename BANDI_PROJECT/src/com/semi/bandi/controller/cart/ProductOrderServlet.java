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
		String[] bookList = request.getParameter("bookUID").split(",");
		String[] quanList = null;
		int updateResult = 0;
		
		HttpSession session = request.getSession(false);
		
		User user = (User)session.getAttribute("user");

		String page = "";
		
		CashService cService = new CashService();
		
		ArrayList<Cart> result = null;
				
		if (user == null) {		// 로그인 정보 확인 (로그인 되어있지 않으면 주문/결제에 접근할 수 없다.)
			
			page = "/views/member/jlogin.jsp";
			
		} else {
			// 주문 수량을 변경해서 주문할 경우 (결제하지 않아도 주문했을 경우 cart 테이블의 주문 수량을 변경)
			if (request.getParameter("quan") != null) {
				quanList = request.getParameter("quan").split(",");
				updateResult = cService.updateCart(user.getmUser_UID(), bookList, quanList);
				
				if (updateResult == 0){
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "수량 변경 실패");
				}
			}
			
			if (updateResult > 0 || request.getParameter("quan") == null) {
				
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
			} else {
				
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "주문 조회 실패");
				
			}
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
