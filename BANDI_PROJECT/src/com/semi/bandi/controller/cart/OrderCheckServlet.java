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
import com.semi.bandi.model.vo.OrderTable;
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
		ArrayList<OrderTable> orderTable = null;
		ArrayList<OrderTable> orderCnt = null;

		String page = "";
		
		if (session != null) {
			
			// ORDER_TABLE 정보 불러오기
			orderDetail = cService.selectOrderTable(user.getmUser_UID());

			if (orderDetail != null) {
				// 주문번호 정보 배열에 담기
				String[] orderUID = new String[orderDetail.size()];
				for (int i = 0 ; i < orderDetail.size(); i++) {
					
					orderUID[i] = orderDetail.get(i).getOrderUID();
					
				}
				
				// ORDER_DETAIL 정보 불러오기
				orderTable = cService.selectOrderDetail(orderUID);
				
				// 주문 번호 별 주문 수량 구하기
				orderCnt = cService.selectCntOrderUid(orderUID);
										
				request.setAttribute("orderDetail", orderTable);
				request.setAttribute("orderCnt", orderCnt);
	
			}

			request.setAttribute("orderTable", orderDetail);
			page = "/views/cart/checkPage.jsp";
			
		} else {
			
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "주문 상세보기 실패.");
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
