package com.semi.bandi.controller.admin;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.semi.bandi.model.service.admin.AdminDQLService;

/**
 * Servlet implementation class GetTotalIncomeServlet
 */
@WebServlet("/income.admin")
public class GetAdminNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAdminNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDQLService ads = new AdminDQLService();
		
		// Get This Year
		String sYear = request.getParameter("year");
		int year = -1;
		if(sYear != null) year = Integer.parseInt(sYear);
		else
		{
			Calendar cal = new GregorianCalendar();
			year = cal.get(Calendar.YEAR);
		}
		
		int totalIncome = ads.getTotalIncome(year);
		
		// Minimum Stock of Books, You Should Setting For Minimum
		int stockOfBook = ads.getStockOfBooks(100);
		
		int commentCount = ads.getCommentOfCount(year);
		
		int orderCount  = ads.getOrderCount(year);
		
		if((totalIncome < 0) || (stockOfBook < 0) || (commentCount < 0) || (orderCount < 0))
		{
			//Go to Error Page.
		}else
		{
			JSONObject obj = new JSONObject();
			obj.put("total", totalIncome);
			obj.put("stock", stockOfBook);
			obj.put("comment", commentCount);
			obj.put("order", orderCount);
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(obj.toJSONString());
			response.getWriter().flush();
			response.getWriter().close();
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
