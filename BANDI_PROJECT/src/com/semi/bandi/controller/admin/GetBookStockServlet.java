package com.semi.bandi.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.admin.AdminDQLService;
import com.semi.bandi.model.vo.adminVo.BookStocks;

/**
 * Servlet implementation class GetBookStockServlet
 */
@WebServlet("/getStocks.admin")
public class GetBookStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBookStockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDQLService ads = new AdminDQLService();
		
		// Temperate Setting Minimum is 100
		ArrayList<BookStocks> arrayStock = ads.getBookStocksArray(100);
		
		if(arrayStock == null)
		{
			// GO TO ERROR PAGE
		}
		else
		{
			Gson gson = new Gson();
			response.setContentType("application/json; charset=UTF-8;");
			gson.toJson(arrayStock, response.getWriter());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
