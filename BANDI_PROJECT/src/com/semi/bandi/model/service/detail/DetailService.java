package com.semi.bandi.model.service.detail;


import static com.semi.bandi.template.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import com.semi.bandi.model.dao.detail.DetailDao;
import com.semi.bandi.model.vo.detail.Detail;

public class DetailService {
	

	public Detail selectOne(String isbn) {
		Connection con = getInstance();
		Detail detail = new DetailDao().selectOne(con, isbn);
		if(detail != null) if(detail.getWriter_introduce() == null)  detail.setWriter_introduce("");
		close(con);
		
		return detail;
	}




}
