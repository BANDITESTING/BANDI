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
 * Servlet implementation class GetAdminRecServlet
 */
@WebServlet("/getRecInfo.get")
public class GetAdminRecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAdminRecServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mISBN = request.getParameter("ISBN");
		AdminDQLService ads = new AdminDQLService();
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8;");
		if(mISBN == null){
			// GO TO ERROR PAGE.
			gson.toJson("error", response.getWriter());
		}else
		{
			BookStocks bs = ads.getBooksRecInfo(mISBN);
			gson.toJson(bs, response.getWriter());
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
