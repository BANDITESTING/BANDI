package com.semi.bandi.model.dao.join;

import static com.semi.bandi.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.bandi.model.vo.joinVo.Join;


public class JoinDao {

	private Properties prop;
	
	public JoinDao() {
	 	prop = new Properties();
		String fileName = JoinDao.class.getResource("/config/join/join-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public Join selectJoin(Connection con, Join j) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Join join = null;
		
		String query = prop.getProperty("loginJoin");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, j.getEmail());
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				join = new Join();
				
				
				join.setEmail(j.getEmail());
				join.setPwd(rset.getString("PASSWORD"));
				join.setAddress(rset.getString("ADDRESS"));
				join.setBirth(rset.getString("BIRTHDAY"));
				join.setGender(rset.getString("GENDER"));
				join.setName(rset.getString("NAME"));
				//나중에 NAME으로 변경해야됨
				join.setPhone(rset.getString("PHONE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return join;
	}

	public int insertMember(Connection con, Join j) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		try {
			String query = prop.getProperty("insertJoin");
			pstmt = con.prepareStatement(query);
			System.out.println(j);
			pstmt.setString(1, j.getEmail());
			pstmt.setString(2, j.getPwd());
			pstmt.setString(3, j.getName());
			pstmt.setString(4, j.getBirth());
			pstmt.setString(5, j.getPhone());
			pstmt.setString(6, j.getAddress());
			pstmt.setString(7, j.getGender());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public static int emailCheck(Connection con, String email) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM BANDI_USER WHERE E_MAIL=?";
		
		System.out.println(email);
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, email);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) 
			{
				result = rset.getInt("COUNT(*)");
				
				System.out.println(result);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
}




















