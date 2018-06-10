package com.semi.bandi.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.semi.bandi.model.service.admin.AdminDMLService;
import com.semi.bandi.model.service.main.GetMainService;
import com.semi.bandi.model.vo.Book;
import com.semi.bandi.template.PropertiesTemplate;

/**
 * Servlet implementation class ChangeBandiBookServlet
 */
@WebServlet("/changeBANDIBook.ch")
public class ChangeBandiBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBandiBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String before = request.getParameter("before");
		String after = request.getParameter("after");
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8;");
		if(before == null  || after == null) { gson.toJson("error", response.getWriter()); return;}
		
		// Setting ISBN by BANDI ADMIN.
		AdminDMLService ads = new AdminDMLService();
		if(ads.updateRecBook(before, after))
		{
			// Setting Session for Array;
			HttpSession session = request.getSession();
			GetMainService gms = new GetMainService();
			Book[] getRecommendBook = gms.getRecommendBandi();
			if(getRecommendBook == null){
				gson.toJson("duplicated",response.getWriter()); return;
			}
			session.setAttribute("recommend", getRecommendBook);
			Book book = new Book();
			for(int i =0; i < getRecommendBook.length; i++)
			{
				if(getRecommendBook[i].getmISBN().equals(after))
				{
					book.setmISBN(getRecommendBook[i].getmISBN());
					book.setmImagePath(getRecommendBook[i].getmImagePath());
				}
			}
			
			gson.toJson(book,response.getWriter());
		}
		else
			gson.toJson("error",response.getWriter());
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
