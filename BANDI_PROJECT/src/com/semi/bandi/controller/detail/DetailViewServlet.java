package com.semi.bandi.controller.detail;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.detail.DetailService;
import com.semi.bandi.model.service.detail.ReviewService;
import com.semi.bandi.model.vo.detail.Detail;
import com.semi.bandi.model.vo.detail.PageInfo;
import com.semi.bandi.model.vo.detail.Review;
import com.semi.bandi.model.vo.detail.Top4;

/**
 * Servlet implementation class DetailViewServlet
 */
@WebServlet("/detail.show")
public class DetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ISBN값을 받는다. 
		String isbn = request.getParameter("ISBN");
		String page="";
		ReviewService rService = new ReviewService();
		
		// -- 페이지 처리 코드 부분 -- //
		
		int startPage; // 한번에 표시될 게시글들의 시작 페이지
		int endPage;  // 한번에 표시될 게시글들의 마지막 페이지
		int maxPage;   // 전체 페이지의 마지막 페이지 
		int currentPage; // 현재 페이지
		int limit;       // 한 페이지당 게시글 수
		
		// 게시판은 1 페이지부터 시작한다.
		currentPage = 1;
		
		// 한 페이지에 보여질 게시글 수
		limit = 10;
		
		
		// 만약에 전달받는 페이지가 있을 경우
		// 즉, 현재 페이지 정보를 받을 경우
		// currentPage 의 값을 수정한다.
		if(request.getParameter("currentPage") != null){
			currentPage
			 = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 리뷰 수
		int listCount = rService.getListCount(isbn); 
		
		// 총 게시글 수에 대한 페이지 계산
		// Ex) 목록의 수가 123 개라면 
		//    페이지 수는 13페이지가 된다.
		// 짜투리 게시글도 하나의 페이지로 취급해야 한다.
		// 10 / 1 --> 0.9 를 더하여 하나의 페이지로 만든다.
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		// 현재 화면에 표시할 페이지 개수
		// 첫 페이지의 번호
		// Ex) 한 화면에 10개의 페이지를 표시하는 경우
		// 1, 11, 21 . . . 
		startPage
		 = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		// 한 화면에 표시할 마지막 페이지 번호
		endPage
		 = startPage + limit - 1;
		
		if( maxPage < endPage){
			endPage = maxPage;
		}
		
		// 페이지 관련 변수 전달용 VO 생성
		PageInfo pi
		 = new PageInfo(currentPage, listCount, limit, startPage, endPage, maxPage);
		
				
				
		if(isbn == null) {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			// Handling Error Page;
			
		} else{
			//책 상세 내용 보기 (책 이미지 내용 작가 등등 )
			Detail detail = new DetailService().selectOne(isbn);
			
			
			//isbn을 통해 현재 책의 전체 리뷰를 받아온다.(리뷰쓰기 수정하기 삭제하기 버튼을 위해서)		
			ArrayList<Review> reviewList = new ReviewService().showReivew(isbn);
			
			
			//페이징 처리한 댓글 상세 내용 보기 (페이징 처리한 댓글)
			ArrayList<Review> pagingReview = new ReviewService().pagingReview(isbn, currentPage, limit);
			System.out.println("페이징리뷰사이즈"+pagingReview.size());
			
			//top4 이미지 가져오기
			ArrayList<Top4> top4 = new ReviewService().top4();
			
			page = "views/detail/SpecificView.jsp";
			
			
			
			request.setAttribute("detail", detail);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("pagingReview", pagingReview);
			request.setAttribute("pi", pi);
			request.setAttribute("top4", top4);
			request.getRequestDispatcher(page).forward(request, response);	
			
			//비동기적 페이징을 위해 pi값 페이징 리뷰값을 gson으로 json에게 넘겨주자
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("pagingReview", pagingReview);
			map.put("pi", pi);
			
			response.setContentType("application/json; charset=UTF-8");
			
			new Gson().toJson(map, response.getWriter());
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
