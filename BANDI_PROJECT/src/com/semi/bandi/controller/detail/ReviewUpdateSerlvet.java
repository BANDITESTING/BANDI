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
 * Servlet implementation class ReviewUpdateSerlvet
 */
@WebServlet("/reviewUpdate.show")
public class ReviewUpdateSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("업테이트 서블릿");
		//isbn값 
		String isbn = request.getParameter("ISBN");
		
		//bookUid	
		int bookUid = Integer.parseInt(request.getParameter("bookUid"));
		System.out.println(bookUid);
		
		//userUid
		int userUid = Integer.parseInt(request.getParameter("userUid"));
		System.out.println(userUid);
		
		//userName
		String userName = request.getParameter("userName");
		System.out.println(userName);
		
		//리뷰 평점, 제목, 내용 	
		int rate = Integer.parseInt(request.getParameter("rate"));
		
		String updateTitle = request.getParameter("updateTitle");
		String updateContent = request.getParameter("updateContent");
		
		// ", "단위로 구분 
		String content = updateTitle+", "+updateContent;
		
		//Reivew vo에 현재 가져온 값들을 넣자.
				Review review = new Review();
				
				review.setIsbn(isbn);
				review.setBook_uid(bookUid);
				review.setUser_uid(userUid);
				review.setRateing(rate);
				review.setBook_comment(updateContent);
				review.setComment_title(updateTitle);
				
				//넣은 값을 service에 던져주자
				int result = new ReviewService().updateReview(review);
				
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
