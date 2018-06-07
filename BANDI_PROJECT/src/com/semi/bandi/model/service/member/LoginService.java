package com.semi.bandi.model.service.member;

/*import static com.semi.bandi.template.JDBCTemplate.*;

import java.sql.Connection;*/

import com.semi.bandi.model.dao.member.LoginDao;
import com.semi.bandi.model.vo.User;
import static com.semi.bandi.template.JDBCTemplate.*;

import java.sql.Connection;

public class LoginService {

	public User loginMember(User user) 
	{
		LoginDao uDao = new LoginDao();
		Connection con = getInstance();
		
		User u = uDao.loginMember(con,user);

		close(con);
		
		return u;
	}

	public int checkLogin(User user) 
	{
		LoginDao lDao = new LoginDao();
		Connection con = getInstance();
		
		int result = lDao.checkLogin(con, user);
		
		close(con);
		
		return result;
	}

	public int changePassword(User user) 
	{
		LoginDao lDao = new LoginDao();
		Connection con = getInstance();
		
		int result = lDao.changePassword(con, user);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int changeInfo(User user) 
	{
		LoginDao lDao = new LoginDao();
		Connection con = getInstance();
		
		int result = lDao.changeInfo(con, user);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
	}

	public int deleteUser(User user) 
	{
		LoginDao lDao = new LoginDao();
		Connection con = getInstance();
		
		int result = lDao.deleteUser(user, con);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
}























