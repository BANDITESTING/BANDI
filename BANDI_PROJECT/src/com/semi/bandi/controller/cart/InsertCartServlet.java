package com.semi.bandi.controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.cart.CartService;
import com.semi.bandi.model.vo.Cart;

/**
 * Servlet implementation class InsertCartServlet
 */
@WebServlet("/insertCart.ct")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertCartServlet() {  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int bookCount = Integer.parseInt(request.getParameter("bookCount"));
		Cart cart = new Cart(userId, bookId, bookCount);
		CartService cs = new CartService();
		
		int existBook = cs.existBook(cart);
		int result = 0;
		
		if(existBook == 0) {
			result = cs.insertCart(cart);
		}
				
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(result, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
