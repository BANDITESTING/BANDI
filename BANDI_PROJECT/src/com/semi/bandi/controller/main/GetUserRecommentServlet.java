package com.semi.bandi.controller.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.semi.bandi.model.service.main.GetMainService;
import com.semi.bandi.model.vo.mainVo.CommentUserInfo;
import com.semi.bandi.model.vo.mainVo.RankedBookInfo;


/**
 * Servlet implementation class GetUserRecommentServlet
 */
@WebServlet("/UserRecommend.get")
public class GetUserRecommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserRecommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		GetMainService gms = new GetMainService();
		RankedBookInfo rBook =  gms.getRatedBook(category);
		ArrayList<CommentUserInfo> comtArray = new ArrayList<CommentUserInfo>();
		
		// Handle Error Page.
		if(rBook == null){System.out.println("rBook is not exist");}
		else
		{
			comtArray = gms.getCommentArray(rBook.getmBook_UID());

			Gson gson = new Gson();
			
			// Must Only Two Array Input This Array, [Warning] 
			ArrayList<Object> obj = new ArrayList<Object>();
			
			obj.add(rBook);
			obj.add(comtArray);

			response.setContentType("application/json; charset=UTF-8;");
			gson.toJson(obj, response.getWriter());
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
