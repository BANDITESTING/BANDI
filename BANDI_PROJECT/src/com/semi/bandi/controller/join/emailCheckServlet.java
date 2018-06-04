package com.semi.bandi.controller.join;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bandi.model.service.join.JoinService;

@WebServlet("/emailcheck.me")
public class emailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public emailCheckServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("email");
		
		JoinService js = new JoinService();
		
		System.out.println(email);
		
		int emailcheck = js.emailCheck(email);
		
		System.out.println(emailcheck);
		
		response.getWriter().print(emailcheck);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
