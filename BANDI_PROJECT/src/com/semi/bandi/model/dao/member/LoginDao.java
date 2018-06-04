package com.semi.bandi.model.dao.member;

/*import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static com.semi.bandi.template.JDBCTemplate.*;

import com.semi.bandi.model.vo.User;

public class LoginDao {

	public User loginMember(Connection con, User user) {
		// TODO Auto-generated method stub
		if(con==null) return null;
		
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		User resultUser = null;
		String query  = "SELECT * FROM BANDI_USER WHERE E_MAIL = ? AND PASSWORD = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getmEmail());
			pstmt.setString(2, user.getmPassword());
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				resultUser = new User();
				resultUser.setmUser_UID(rset.getInt("USER_UID"));
				resultUser.setmEmail(rset.getString("E_MAIL"));
				resultUser.setmPassword(rset.getString("PASSWORD"));
				resultUser.setmName(rset.getString("NAME"));
				resultUser.setmIdentified(rset.getString("BIRTHDAY"));
				resultUser.setmPhone(rset.getString("PHONE"));
				resultUser.setmAddress(rset.getString("ADDRESS"));
				resultUser.setmGender(rset.getString("GENDER"));
				resultUser.setmGrade(rset.getString("GRADE_CODE"));
				resultUser.setmJob(rset.getString("JOB_CODE"));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally
		{
			close(rset);
			close(pstmt);
		}
		
		return resultUser;
	}

	public int checkLogin(Connection con, User user) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM BANDI_USER WHERE E_MAIL = ? AND PASSWORD = ?";
		
		System.out.println(user);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getmEmail());
			pstmt.setString(2, user.getmPassword());
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				result = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int changePassword(Connection con, User user) 
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE BANDI_USER SET PASSWORD = ? WHERE E_MAIL = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getmPassword());
			pstmt.setString(2, user.getmEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int changeInfo(Connection con, User user) 
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE BANDI_USER SET PHONE = ?, ADDRESS = ? WHERE E_MAIL = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getmPhone());
			pstmt.setString(2, user.getmAddress());
			pstmt.setString(3, user.getmEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
























