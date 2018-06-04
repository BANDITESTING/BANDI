package com.semi.bandi.model.service.join;


import static com.semi.bandi.template.JDBCTemplate.*;

import java.sql.*;

import com.semi.bandi.model.dao.join.JoinDao;
import com.semi.bandi.model.vo.joinVo.Join;

public class JoinService {
	
	private JoinDao jDao;
	
	public JoinService() {
		jDao = new JoinDao();
	}
	public Object selectJoin(Join j) {
		Connection con = getInstance();
		
		Join join = jDao.selectJoin(con, j);
		
		close(con);
		
		return join;
	}

	public int insertJoin(Join j) {
		Connection con = getInstance();
		
		int result = jDao.insertMember(con, j);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
