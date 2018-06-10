package com.semi.bandi.controller.admin;

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
 * Servlet implementation class GetRecommendBooksServlet
 */
@WebServlet("/getRecBooks.find")
public class GetRecommendBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRecommendBooksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GetMainService gms = new GetMainService();
		Book[] getRecommendBook = gms.getRecommendBandi();
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8;");
		
		if(getRecommendBook == null){ gson.toJson("error", response.getWriter());}
		else gson.toJson(getRecommendBook, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
