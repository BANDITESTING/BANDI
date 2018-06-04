package com.semi.bandi.controller.search;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bandi.model.service.search.SearchBookService;
import com.semi.bandi.model.vo.SearchBook;

@WebServlet("/searchGenre.sb")
public class SearchGenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchGenreServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String option = request.getParameter("option");
		String getText = request.getParameter("getText");
		String genreCode = request.getParameter("genreCode");
		
		ArrayList<SearchBook> list = new SearchBookService().searchGenre(option, getText, genreCode);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
