package com.semi.bandi.controller.cart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.bandi.model.service.cart.CashService;
import com.semi.bandi.model.vo.OrderDetail;
import com.semi.bandi.model.vo.User;

// 주문 / 배송 확인

@WebServlet("/check.ct")
public class OrderCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		CashService cService = new CashService();
		ArrayList<OrderDetail> orderDetail = null;
		
		if (session != null) {
			
			orderDetail = cService.selectOrderTable(user.getmUser_UID());
			
		}
		
		String page = "";
		
		page = "/views/cart/checkPage.jsp";
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
