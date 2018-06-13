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
 * Servlet implementation class SortCategoryServlet
 */
@WebServlet("/sortCategory.do")
public class SortCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String CategoryCode = request.getParameter("CategoryCode");
		String orderBy = request.getParameter("category");
		String sStart = request.getParameter("start");
		String sEnd = request.getParameter("end");
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		
		// Shield for null Point Error
		if(CategoryCode == null || orderBy == null || sStart == null || sEnd == null)  { gson.toJson("error",response.getWriter()); return; }
		
		int start = Integer.parseInt(sStart);
		int end  = Integer.parseInt(sEnd);
		
		CategoryService cs = new CategoryService();

		if(CategoryCode == null || orderBy == null) return;
		ArrayList<Category> list = cs.bookCategoryAndCode(CategoryCode,orderBy, start, end);
		
		if(list == null)  { gson.toJson("error",response.getWriter()); return; }
		else gson.toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
