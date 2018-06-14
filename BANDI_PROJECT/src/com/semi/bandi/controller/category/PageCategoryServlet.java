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
    // When Make Button Page
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String CategoryCode = request.getParameter("CategoryCode");
		int page = Integer.parseInt(request.getParameter("pageCount"));
		CategoryService cs = new CategoryService();
		
		int startPage; 
		int endPage; 
		int maxPage;  
		int currentPage; 
		int limit;       

		currentPage = 1;

		limit = 8;
		// 받아온 페이지가 없으면???
		if(request.getParameter("pageCount") == null){
			currentPage
			 = Integer.parseInt(request.getParameter("currentPage"));
		}
			
			if(CategoryCode == null) return;
			int listCount = cs.PagingCount(CategoryCode);
			System.out.println("페이지수 : "+listCount);
			
			maxPage = (int)((double)listCount / limit + 0.875);
			startPage
			 = (((int)((double)currentPage / limit + 0.875)) - 1) * limit + 1;
			
			// 한 화면에 표시할 마지막 페이지 번호
			endPage
			 = startPage + limit - 1;
			
			if( maxPage < endPage){
				endPage = maxPage;
			}
			
			// 페이지 관련 변수 전달용 VO 생성
			CategoryPaging cPaging
			 = new CategoryPaging(currentPage, listCount, limit, startPage, endPage, maxPage);
			
			
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(cPaging, response.getWriter());
		}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
