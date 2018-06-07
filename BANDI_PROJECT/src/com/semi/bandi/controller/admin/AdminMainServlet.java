package com.semi.bandi.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.admin.AdminDQLService;
import com.semi.bandi.model.vo.adminVo.AnnualIncome;

/**
 * Servlet implementation class AdminMain
 */
@WebServlet("/admin.main")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//
			AdminDQLService ads = new AdminDQLService();
			
			// TEMP THIS YEAR [2018]
			ArrayList<AnnualIncome> annualList = ads.getAnnualArrayList(2018);
			
			if(annualList == null){} // Go to ERROR Message.
			else{
				Gson gson = new Gson();
				response.setContentType("application/json; charset=UTF-8;");
				gson.toJson(annualList, response.getWriter());
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
