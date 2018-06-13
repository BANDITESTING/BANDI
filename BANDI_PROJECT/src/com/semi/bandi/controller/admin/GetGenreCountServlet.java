package com.semi.bandi.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.bandi.model.service.admin.AdminDQLService;
import com.semi.bandi.model.vo.adminVo.PieChartData;

/**
 * Servlet implementation class GetGenreCountServlet
 */
@WebServlet("/getGenreCount.get")
public class GetGenreCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetGenreCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDQLService ads = new AdminDQLService();
		
		String sYear = request.getParameter("year");
		int year = -1;
		if(sYear != null) year = Integer.parseInt(sYear);
		else
		{
			Calendar cal = new GregorianCalendar();
			year = cal.get(Calendar.YEAR);
		}
		
		ArrayList<PieChartData> data = ads.getGenreCountData(year);
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8;");
		
		if(data == null) gson.toJson("error", response.getWriter());
		else gson.toJson(data, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
