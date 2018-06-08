package com.semi.bandi.controller.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.bandi.model.service.category.CategoryService;
import com.semi.bandi.model.vo.CategoryPaging;

/**
 * Servlet implementation class PagingCount
 */
@WebServlet("/pCount.do")
public class PagingCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagingCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String CategoryCode = request.getParameter("CategoryCode");
		
		CategoryService cs = new CategoryService();
		
		if(CategoryCode == null) return;
		int PageCount = cs.PagingCount(CategoryCode);
		System.out.println("PageCount : "+PageCount);
		
		HttpSession session = request.getSession();
		session.setAttribute("PageCount", PageCount);
		
		RequestDispatcher views = request.getRequestDispatcher("/views/category/categoryForm.jsp");
		views.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
