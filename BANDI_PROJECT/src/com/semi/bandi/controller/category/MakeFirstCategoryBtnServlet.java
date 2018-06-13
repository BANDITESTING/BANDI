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
 * Servlet implementation class MakeFirstCategoryBtnServlet
 */
@WebServlet("/makeCategoryBtns.make")
public class MakeFirstCategoryBtnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeFirstCategoryBtnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String category = request.getParameter("category");
		 String categoryCode = request.getParameter("CategoryCode");
		 
		 Gson gson = new Gson();
		 response.setContentType("application/json; charset=UTF-8;");
		 
		 if(category == null || categoryCode == null) {gson.toJson("error",response.getWriter()); return;}
		 
		 CategoryService cService = new CategoryService();
		 
		 int Count = cService.FirstCategoryBtnCountService(category,categoryCode);
		 
		 if(Count == 0)  { gson.toJson("error",response.getWriter()); return; }
			else gson.toJson(Count,response.getWriter());
		 
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
