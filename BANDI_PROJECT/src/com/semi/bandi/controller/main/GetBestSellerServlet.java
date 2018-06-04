package com.semi.bandi.controller.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.main.GetMainService;
import com.semi.bandi.model.vo.Book;

/**
 * Servlet implementation class GetBestSellerServlet
 */
@WebServlet("/bestSeller.get")
public class GetBestSellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBestSellerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		GetMainService gms = new GetMainService();
		
		if(category == null) {} // GO TO ERROR PAGE
		else{
			Book[] getBestSellerBook = gms.getbestSeller(category);
			Gson gson = new Gson();
			response.setContentType("application/json; charset=UTF-8;");
			gson.toJson(getBestSellerBook, response.getWriter());
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
