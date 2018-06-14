package com.semi.bandi.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.member.LoginService;
import com.semi.bandi.model.vo.User;

@WebServlet("/findEmail.me")
public class jfindEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public jfindEmailServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name = request.getParameter("name");
		String birth2[] = request.getParameter("birth").split("-");
		String birth1 = birth2[0]+birth2[1]+birth2[2];	
		String birth = birth1.substring(2);
		String phone = request.getParameter("phone");
		
		User user = new User(name, birth, phone);
		
		LoginService ls = new LoginService();
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8;"); 
		User getUser = ls.findId(user);
		
		if(getUser != null){
			
			gson.toJson(getUser.getmEmail(), response.getWriter());
			
		} else {
			
			gson.toJson("error", response.getWriter());
			
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
