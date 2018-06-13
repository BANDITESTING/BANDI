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
import com.semi.bandi.model.vo.OrderTable;
import com.semi.bandi.model.vo.User;

// 주문 취소

@WebServlet("/cancle.ct")
public class OrderCancleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderCancleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderUID = request.getParameter("orderUID");
		String[] bookUID = request.getParameter("bookUID").split(",");
		int point = Integer.parseInt(request.getParameter("point"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		int bookTotal = Integer.parseInt(request.getParameter("bookTotal"));
		
		ArrayList<OrderTable> result = null;
				
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		String page = "";
		
		if (user != null) {
			
			CashService cService = new CashService();
			
			result = cService.selectCancleData(orderUID, bookUID);
			
			if (result != null) {
				
				page = "/views/cart/canclePage.jsp";
				request.setAttribute("cancleData", result);
				request.setAttribute("point", point);
				request.setAttribute("cnt", cnt);
				request.setAttribute("flag", flag);
				if (cnt != flag) {
					request.setAttribute("bookTotal", bookTotal);
				} else {
					request.setAttribute("bookTotal", (bookTotal - point));
				}
				
			} else {
				
				page = "/views/common/errorPage.jsp";
				request.setAttribute("msg", "주문 취소 도서 정보 가져오기 실패.");
				
			}
			
		} else {
			
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "올바르지 못한 경로 접근입니다. (로그인 상태를 확인해 주세요)");
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
