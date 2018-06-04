package com.semi.bandi.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.bandi.model.service.member.LoginService;
import com.semi.bandi.model.vo.User;

@WebServlet("/change.me")
public class jchangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public jchangePwdServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String nPwd = request.getParameter("mPassword");
		
		LoginService ls = new LoginService();
		
		HttpSession session = request.getSession(false);
		
		User user = (User) session.getAttribute("user");
		user.setmPassword(nPwd);
		
		if(ls.changePassword(user) > 0)
		{
			session.invalidate();
			
			response.sendRedirect("index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
























