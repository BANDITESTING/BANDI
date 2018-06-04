package com.semi.bandi.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.bandi.model.service.member.LoginService;
import com.semi.bandi.model.vo.User;

@WebServlet("/login.me")
public class jloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public jloginServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("mEmail");
		String pwd = request.getParameter("mPassword");
		
		User user = new User(email, pwd);
		System.out.println(pwd);
		LoginService ls = new LoginService();
		
		user = ls.loginMember(user);
		
		if(user != null)
		{			
			RequestDispatcher view = request.getRequestDispatcher("views/main/Main.jsp");
	
			HttpSession session = request.getSession();
					
			session.setAttribute("user", user);
			
			view.forward(request, response);
		} 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}







































