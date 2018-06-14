package com.semi.bandi.controller.join;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bandi.model.service.join.JoinService;

@WebServlet("/mCheck.do")
public class moblieCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public moblieCheckServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String phone = request.getParameter("phone");
		
		JoinService js = new JoinService();
		
		int result = js.moblieCheck(phone);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
