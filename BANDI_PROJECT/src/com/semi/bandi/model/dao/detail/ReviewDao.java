package com.semi.bandi.model.dao.detail;

import static com.semi.bandi.template.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.semi.bandi.model.vo.detail.Review;
import com.semi.bandi.model.vo.detail.Top4;
import com.semi.bandi.template.DetailQueryProperties;

public class ReviewDao {

	public int insertReview(Connection con, Review review) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		DetailQueryProperties prop = new DetailQueryProperties();
		String query = prop.reviewInsert();
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, review.getBook_uid());
			pstmt.setInt(2, review.getUser_uid());
			pstmt.setString(3, review.getBook_comment());
			pstmt.setInt(4, review.getRateing());
			pstmt.setString(5, review.getComment_title());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateReview(Connection con, Review review) {
		PreparedStatement pstmt = null;
		int result = 0;
		DetailQueryProperties prop = new DetailQueryProperties();
		String query = prop.updateReview();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, review.getComment_title());
			pstmt.setString(2, review.getBook_comment());
			pstmt.setInt(3, review.getRateing());
			pstmt.setInt(4, review.getUser_uid());
			pstmt.setInt(5, review.getBook_uid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteReview(Connection con, int userId, int bookId) {
		PreparedStatement pstmt = null;
		int result = 0;
		DetailQueryProperties prop = new DetailQueryProperties();
		String query = prop.deleteReview();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			pstmt.setInt(2, bookId);
		
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public ArrayList<Review> showReview(Connection con, String isbn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> reviewList = null;
		DetailQueryProperties prop = new DetailQueryProperties();
		String query = prop.showReview();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, isbn);
			
			rset = pstmt.executeQuery();
			
			reviewList = new ArrayList<Review>();
			
			while(rset.next()){
				Review review = new Review(rset.getInt("BID"), rset.getInt("BUID"), 
						rset.getString("UNAME"), rset.getString("CT"), rset.getString("BCT"), rset.getInt("RATE")
						, rset.getDate("WDATE"));
			
				reviewList.add(review);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return reviewList;
	}

	public int getListCount(Connection con, String isbn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
	
		DetailQueryProperties prop = new DetailQueryProperties();
		String query = prop.listCount();
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, isbn);
			
			rset = pstmt.executeQuery();
			while(rset.next()){
			listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Review> pagingReview(Connection con, String isbn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> paging = null;
		
		DetailQueryProperties prop = new DetailQueryProperties();
		String query = prop.selectList();
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			//조회 시작할 행 번호와 마지막 행 번호 계산 
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, isbn);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			paging = new ArrayList<Review>();
			
			while(rset.next()){
				Review page = new Review(rset.getInt("BID"), rset.getInt("BUID"), 
						rset.getString("UNAME"), rset.getString("CT"), rset.getString("BCT"), rset.getInt("RATE")
						, rset.getDate("WDATE"));
			paging.add(page);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return paging;
	}

	public ArrayList<Top4> top4(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Top4> top4 = null;
		
		DetailQueryProperties prop = new DetailQueryProperties();
		String query = prop.top4();
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			top4 = new ArrayList<Top4>();
			
			while(rset.next()) {
				Top4 top = new Top4();
				top.setImage(rset.getString("IMAGE"));
				top.setrNum(rset.getString("RNUM"));
				top.setIsbn(rset.getString("ISBN"));
				top4.add(top);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return top4;
	}

	

	
	
}
