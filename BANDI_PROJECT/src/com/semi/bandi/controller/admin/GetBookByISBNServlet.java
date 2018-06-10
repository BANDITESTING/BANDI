package com.semi.bandi.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.admin.AdminDQLService;
import com.semi.bandi.model.vo.adminVo.BookStocks;

/**
 * Servlet implementation class GetBookByISBNServlet
 */
@WebServlet("/getbookISBN.search")
public class GetBookByISBNServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBookByISBNServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mISBN = request.getParameter("ISBN");
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8;");
		AdminDQLService ads = new AdminDQLService();
		
		if(mISBN == null){gson.toJson("error",response.getWriter()); return;}
		
		BookStocks book = ads.getBookByISBN(mISBN);
		
		if(book == null){gson.toJson("error",response.getWriter());}
		else
		{
			gson.toJson(book,response.getWriter());
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
