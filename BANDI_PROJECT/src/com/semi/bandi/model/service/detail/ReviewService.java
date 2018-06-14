package com.semi.bandi.model.service.detail;

import java.sql.Connection;
import java.util.ArrayList;
import com.semi.bandi.model.dao.detail.ReviewDao;
import com.semi.bandi.model.vo.detail.Review;
import com.semi.bandi.model.vo.detail.Top4;

import static com.semi.bandi.template.JDBCTemplate.*;

public class ReviewService {

	public int insertReview(Review review) {
		Connection con = getInstance();
		ReviewDao reviewDao = new ReviewDao();
		
		int result = reviewDao.insertReview(con, review);
		
		if(result>0){
			commit(con);
		}else rollback(con);
		
		close(con);
		
		return result;
	}

	public int updateReview(Review review) {
		Connection con = getInstance();
		ReviewDao reviewDao = new ReviewDao();
		
		int result = reviewDao.updateReview(con, review);
		
		if(result>0) {
			commit(con);
		}else rollback(con);
		
		close(con);
	
		return result;
	}
	
	public ArrayList<Review> showReivew(String isbn) {
		Connection con = getInstance();
		ArrayList<Review> reviewList = new ReviewDao().showReview(con, isbn);
		
		close(con);
		
		return reviewList;
	}

	public int deleteReview(int userId, int bookId) {
		Connection con = getInstance();
		ReviewDao reviewDao = new ReviewDao();
		
		int result = reviewDao.deleteReview(con, userId, bookId);
		
		if(result>0) {
			commit(con);
		}else rollback(con);
		
		close(con);
	
		return result;
	}

	public int getListCount(String isbn) {
		Connection con = getInstance();
		int listCount = new ReviewDao().getListCount(con, isbn);
		close(con);
		return listCount;
	}

	
	public static ArrayList<Review> pagingReview(String isbn, int currentPage, int limit) {
		Connection con = getInstance();
		ArrayList<Review> paging = new ReviewDao().pagingReview(con, isbn, currentPage, limit);
		close(con);
		
		return paging;
	}

	public static ArrayList<Top4> top4() {
		Connection con = getInstance();
		ArrayList<Top4> top4 = new ReviewDao().top4(con);
		return top4;
	}


	
	

}
