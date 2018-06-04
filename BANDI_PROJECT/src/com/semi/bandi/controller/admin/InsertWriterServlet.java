package com.semi.bandi.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bandi.model.service.admin.AdminDMLService;
import com.semi.bandi.model.vo.Writer;

/**
 * Servlet implementation class WriterInsertServlet
 */
@WebServlet("/InsertWriter.do")
public class InsertWriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertWriterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writerCode = request.getParameter("writerCode");
		String writerName = request.getParameter("writerName");
		String writerIntroduce = request.getParameter("writerIntroduce");

		if(writerName == null) response.getWriter().println("error");
		if(writerIntroduce == null) writerIntroduce = " ";
		
		Writer writer = new Writer(writerCode, writerName, writerIntroduce);
		
		AdminDMLService adService = new AdminDMLService();
		
		if(adService.succinWriterforDB(writer))
		{
			// success
			response.getWriter().print("success");
		}
		else
		{
			// fail
			response.getWriter().print("fail");
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
