package com.semi.bandi.controller.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bandi.model.service.search.SearchBookService;
import com.semi.bandi.model.vo.searchVo.PageInfo;
import com.semi.bandi.model.vo.searchVo.SearchBook;
/*import com.semi.bandi.model.vo.SearchBook;*/

@WebServlet("/searchGenre.sb")
public class SearchGenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchGenreServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String option = request.getParameter("option");
		String getText = request.getParameter("getText");
		String text = getText.replaceAll(" ", "");
		String genreCode = request.getParameter("genreCode");
		SearchBookService sbs = new SearchBookService();
		
		ArrayList<SearchBook> list = null;
		HashMap<String, Integer> genreCount = sbs.searchBookGenre(option, text);

		// -- 페이징 부분 -- //
		
		int startPage;		// 한번에 표시될 게시글들의 시작 페이지
		int endPage;		// 한번에 표시될 게시글들의 마지막 페이지
		int maxPage;		// 전체 페이지의 마지막 페이지
		int currentPage; 	// 현재 페이지
		int b_size;			// 한 페이지당 게시글 수
		int p_size;			// 한번에 보여줄 페이지 수
		
		currentPage = 1;
		b_size = 5;
		p_size = 5;
		
		// 현재 페이지 정보를 받을 경우 currentPage의 값을 수정
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = sbs.getlistCount(option, text);
		int genreListCount = sbs.getGenreCount(option, text, genreCode);

		maxPage = (int)((genreListCount -1) / b_size + 1);
		startPage = (int)((currentPage -1) / p_size) * p_size + 1;
		endPage = startPage + p_size - 1;

		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(startPage, endPage, maxPage, currentPage, listCount, b_size, p_size);
		
		// -- 페이징 부분 -- //
		
		list = sbs.searchGenre(option, text, genreCode, currentPage, b_size);
		
		request.setAttribute("option", option);
		request.setAttribute("getText", getText);
		request.setAttribute("genreCode", genreCode);
		request.setAttribute("list", list);
		request.setAttribute("genreCount", genreCount);
		request.setAttribute("pi", pi);

		ServletContext context = getServletContext();
		RequestDispatcher rq = context.getRequestDispatcher("/views/search/searchBook.jsp");
		rq.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
