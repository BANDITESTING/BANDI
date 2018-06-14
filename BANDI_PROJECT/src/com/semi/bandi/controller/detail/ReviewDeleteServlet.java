package com.semi.bandi.controller.detail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.detail.ReviewService;
import com.semi.bandi.model.vo.detail.Review;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/reviewDelete.show")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("딜리트 서블릿");
		//isbn값 
		String isbn = request.getParameter("ISBN");
		
		int userId = Integer.parseInt(request.getParameter("userUid"));
		int bookId = Integer.parseInt(request.getParameter("bookUid"));
		
		int result = new ReviewService().deleteReview(userId, bookId);
		
		Gson gson = new Gson();
		response.setContentType("application.json; charset=UTF-8");
		
		if(result>0){
			/*response.sendRedirect(request.getContextPath()+"/detail.show?ISBN="+isbn);*/
			gson.toJson("success", response.getWriter());
		}else{
			/*request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);*/
			gson.toJson("error", response.getWriter());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
