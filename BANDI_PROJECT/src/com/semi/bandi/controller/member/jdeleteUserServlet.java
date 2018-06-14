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

@WebServlet("/deleteUser.me")
public class jdeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public jdeleteUserServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		int result = 0;
		LoginService ls = new LoginService();
		
		HttpSession session = request.getSession(false);
		
		User user = (User) session.getAttribute("user");
		
		user.setmEmail(email);
		user.setmPassword(pwd);
		
		if(ls.deleteUser(user) == 0){
			
			result = 0;
		} else {
			result = -1;
		}
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
