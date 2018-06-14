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
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/reviewInsert.show")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//isbn값 
		String isbn = request.getParameter("ISBN");
		
		//bookUid
		int bookUid = Integer.parseInt(request.getParameter("bookUid"));
		
		
		//userUid
		int userUid = Integer.parseInt(request.getParameter("userUid"));
		
		
		//userName
		String userName = request.getParameter("userName");
		
		
		//리뷰 평점, 제목, 내용 	
		int rate = Integer.parseInt(request.getParameter("rate"));
		
		String reviewTitle = request.getParameter("reviewTitle");
		String reviewContent = request.getParameter("reviewContent");
		
		
		
		
		//Reivew vo에 현재 가져온 값들을 넣자.
		Review review = new Review();
		
		review.setBook_uid(bookUid);
		review.setUser_uid(userUid);
		review.setRateing(rate);
		review.setBook_comment(reviewContent);
		review.setComment_title(reviewTitle);
		review.setIsbn(isbn);
		//넣은 값을 service에 던져주자
		int result = new ReviewService().insertReview(review);
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8;");
		
		
		if(result>0){
			//response.sendRedirect(request.getContextPath()+"/detail.show?ISBN="+isbn);
			gson.toJson("success", response.getWriter());
			/*request.setAttribute("review", review);*/
		}else{
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
