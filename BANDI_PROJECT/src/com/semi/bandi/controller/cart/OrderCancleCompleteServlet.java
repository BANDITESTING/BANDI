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
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));
		int point = Integer.parseInt(request.getParameter("point"));
		
		String page = "";
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		User updateUser = user;
		
		updateUser.setmBandi_Point(updateUser.getmBandi_Point() + point);
		session.setAttribute("user", updateUser);
		
		CashService cService = new CashService();

		// DETAIL 삭제
		int result = cService.deleteDetail(orderUID, bookUID);
		
		// 등급별 적립금 적용률
		double pointRate = cService.changePointRate(user.getmGrade());
		
		if (result > 0) {
			
			if (cnt != flag) {
				
				// 전체 삭제가 아닐 경우 가격 및 포인트 변경
				result = cService.updateTable(canclePrice, orderUID, pointRate, bookPrice, point);

				if (result > 0) {
					
					page = "/views/cart/cancleComplete.jsp";
					request.setAttribute("orderUID", orderUID);
					
				} else {
					
					page = "/views/common/errorPage.jsp";
					request.setAttribute("msg", "주문 취소 실패");
					
				}
			} else {
				
				// 전체 삭제일 경우 테이블 삭제
				result = cService.deleteTable(orderUID);
				
				if (result > 0) {
					
					result = cService.updateUserPoint(user, point, " + ? WHERE USER_UID = ? AND E_MAIL = ?");
					
					if (result > 0) {
						
						page = "/views/cart/cancleComplete.jsp";
						request.setAttribute("orderUID", orderUID);
						
					} else {
						
						page = "/views/common/errorPage.jsp";
						request.setAttribute("msg", "사용 포인트 업데이트 실패");
						
					}
				} else {
					
					page = "/views/common/errorPage.jsp";
					request.setAttribute("msg", "주문 취소 실패");
					
				}
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
