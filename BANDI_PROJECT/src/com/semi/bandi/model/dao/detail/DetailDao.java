package com.semi.bandi.model.dao.detail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.semi.bandi.template.JDBCTemplate.*;
import java.sql.Statement;
import com.semi.bandi.model.vo.detail.Detail;
import com.semi.bandi.model.vo.detail.Review;
import com.semi.bandi.template.DetailQueryProperties;

public class DetailDao {

	public Detail selectOne(Connection con, String isbn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Detail detail = null;
		DetailQueryProperties prop = new DetailQueryProperties();
		String query = prop.dmlQueryForOrder();
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, isbn);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				detail = new Detail();
				
				
				detail.setBook_introduce(rset.getString("BOOK_INTRODUCE"));
				detail.setBook_quantity(rset.getInt("BOOK_QUANTITY"));
				detail.setBook_uid(rset.getInt("BOOK_UID"));
				detail.setImage(rset.getString("IMAGE"));
				detail.setIssue_date(rset.getDate("ISSUE_DATE"));
				detail.setOrigin(rset.getString("ORIGIN"));
				detail.setPage(rset.getInt("PAGE"));
				detail.setPrice(rset.getInt("PRICE"));
				detail.setPublisher(rset.getString("PUBLISHER"));
				detail.setTitle(rset.getString("TITLE"));
				detail.setWriter_name(rset.getString("WR"));
				detail.setWriter_introduce(rset.getString("WI"));
				detail.setGenre(rset.getString("G"));
				detail.setSub_genre(rset.getString("SG"));
				detail.setIsbn(rset.getString("ISBN"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return detail;
	}

	
}
