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

// 주문 취소 완료

@WebServlet("/canclecomplete.ct")
public class OrderCancleCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderCancleCompleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderUID = request.getParameter("orderUID");
		String[] bookUID = request.getParameter("bookUID").split(",");
		int canclePrice = Integer.parseInt(request.getParameter("canclePrice"));
		String page = "";
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		CashService cService = new CashService();

		// DETAIL 삭제
		int result = cService.deleteDetail(orderUID, bookUID);
		
		// 등급별 적립금 적용률
		double pointRate = cService.changePointRate(user.getmGrade());
		
		if (result > 0) {
			
			result = cService.updateTable(canclePrice, orderUID, pointRate);
			
			if (result > 0) {
				
				// ORDER_TABLE/DETAIL 수정 삭제 수행 후 DETAIL의 정보가 모두 지워졌으면
				// ORDER_TABLE의 정보도 삭제하는 부분
				result = cService.selectTotalData(orderUID);
				
				if (result == 0) {
					
					result = cService.deleteTable(orderUID);
					
					if (result > 0) {
						
						page = "/views/cart/cancleComplete.jsp";
						request.setAttribute("orderUID", orderUID);
						
					} else {
						
						page = "/views/common/errorPage.jsp";
						request.setAttribute("msg", "주문 취소 실패");
						
					}
					
				}
				
			} else {
				
				page = "/views/common/errorPage.jsp";
				request.setAttribute("msg", "주문 취소 실패");
				
			}
				
		} else {
			
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "주문 취소 실패");
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
