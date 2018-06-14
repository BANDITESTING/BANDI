package com.semi.bandi.controller.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.category.CategoryService;

/**
 * Servlet implementation class EndAndStartServlet
 */
@WebServlet("/EndAndStart.do")
public class EndAndStartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EndAndStartServlet() {
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
		//String cEnd = request.getParameter("end"); 
		
		Gson gSon = new Gson();
		
		if(categoryCode == null || category == null || cStart == null )  { gSon.toJson("error",response.getWriter()); return; }
		
//		int start = Integer.parseInt(cStart);
		//int end = Integer.parseInt(cEnd);
		
//		CategoryService cService = new CategoryService();
		
//		int EndAndStart = cService.EndAndStartService(categoryCode,category,start);
		
//		if(EndAndStart == 0)  { gSon.toJson("error",response.getWriter()); return; }
//		else gSon.toJson(EndAndStart,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
