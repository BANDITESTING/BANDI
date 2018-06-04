package com.semi.bandi.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bandi.model.service.member.LoginService;
import com.semi.bandi.model.vo.User;

@WebServlet("/cUser.me")
public class confirmUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public confirmUserServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("mEmail");
		String pwd = request.getParameter("mPassword");
		
		User user = new User(email, pwd);
		
		System.out.println(user);
		
		LoginService ls = new LoginService();
		
		int checkLogin = ls.checkLogin(user);
		
		System.out.println(checkLogin);
		
		response.getWriter().print(checkLogin);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
