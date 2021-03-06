package com.semi.bandi.controller.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.semi.bandi.model.service.category.*;
import com.semi.bandi.model.vo.Book;
import com.semi.bandi.model.vo.Category;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/category.do")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("code");
		CategoryService bs = new CategoryService();
		
		if(category == null) return; // ERROR CODE;
		
		ArrayList<Category> list = bs.bookTableListDate(category);
		
		/*Book[] bookArray = new Book[6];*/
		ArrayList<Book> bookArray= new ArrayList<Book>();
		
		// [Warning] Need to List  Size is only 6. Should Protect Here.
		int size = list.size();
		if(size > 6) size = 6;
		for(int i = 0;  i < size; i++)
		{
			Book book = new Book();
			book.setmISBN(list.get(i).getcISBN());
			book.setmImagePath(list.get(i).getcImage());
			book.setmTitle(list.get(i).getcTitle());
			book.setmPrice(list.get(i).getcPrice());
			/*bookArray[i] = book;*/
			bookArray.add(book);
			
		}
		
		ArrayList<Category> BannerArray = bs.CategoryBanner(category);
		ArrayList<Category> list3 = bs.bookTableListBanner(category);
			
				
		HttpSession session = request.getSession();
		session.setAttribute("CategoryList1", list);
		session.setAttribute("categoryRec", bookArray);
		session.setAttribute("CategoryBanner", BannerArray);
		session.setAttribute("CategoryList3", list3);
		session.setAttribute("CategoryCode", category);
		
		// ADD PAGE
		int PageCount = bs.PagingCount(category);
		session.setAttribute("PageCount",PageCount );
		
		RequestDispatcher views = request.getRequestDispatcher("/views/category/categoryForm.jsp");
		views.forward(request, response);
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
