package com.semi.bandi.controller.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.category.CategoryService;
import com.semi.bandi.model.vo.Category;

/**
 * Servlet implementation class StartAndEndServlet
 */
@WebServlet("/startAndEnd.do")
public class StartAndEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StartAndEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String categoryCode = request.getParameter("CategoryCode");
		String cStart = request.getParameter("start");
		//String cEnd = request.getParameter("end"); || cEnd == null
		
		Gson gSon = new Gson();
		
		if(categoryCode == null || category == null || cStart == null )  { gSon.toJson("error",response.getWriter()); return; }
		
		int start = Integer.parseInt(cStart);
		//int end = Integer.parseInt(cEnd);
		
		CategoryService cService = new CategoryService();
		
		int startAndEnd = cService.StartAndEndService(categoryCode,category,start);
		
		if(startAndEnd == 0)  { gSon.toJson("error",response.getWriter()); return; }
		else gSon.toJson(startAndEnd,response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
