package com.semi.bandi.controller.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.semi.bandi.model.service.category.CategoryService;
import com.semi.bandi.model.vo.Category;
import com.semi.bandi.model.vo.CategoryPaging;

/**
 * Servlet implementation class PageCategoryServlet
 */
@WebServlet("/cPage.do")
public class PageCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoryService cService = new CategoryService();
		String CategoryCode = request.getParameter("CategoryCode");
		String orderBy = request.getParameter("category");
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 8;
		
	
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		int listCount = cService.PageCategoryCount(CategoryCode,orderBy,currentPage, limit);
		System.out.println("총 게시글 수 : "+listCount);
		
		maxPage = (int)((double)listCount / limit + 0.875);
		
		startPage = (((int)((double)currentPage / limit + 0.875)) -1) * limit +1;
		
		endPage = startPage + limit - 1;
		
		if( maxPage < endPage) {
			endPage = maxPage;
		}
		
		CategoryPaging cPaging = new CategoryPaging(currentPage, listCount, limit, startPage, endPage, maxPage);
		System.out.println("CP : "+cPaging);
		
		
	
		
		
		System.out.println("리스트 크기 : "+listCount);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
