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

@WebServlet("/changeinfo.me")
public class jchangeMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public jchangeMyInfoServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		user.setmPhone(request.getParameter("tel"));
		user.setmAddress(request.getParameter("address1") + "| " + request.getParameter("address2") + "| " + request.getParameter("address3"));
		
		LoginService ls = new LoginService();
		
		if(ls.changeInfo(user) != 0){
			RequestDispatcher view = request.getRequestDispatcher("views/main/Main.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}



















