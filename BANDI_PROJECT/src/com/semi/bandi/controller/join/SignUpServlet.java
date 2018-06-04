package com.semi.bandi.controller.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bandi.model.service.join.JoinService;
import com.semi.bandi.model.vo.joinVo.Join;


@WebServlet("/signUp.me")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("userEmail");
		
		String pwd = request.getParameter("mPassword");
		String name = request.getParameter("userName");
		String gender = request.getParameter("gender");
		
		String birth2[] = request.getParameter("userBirth").split("-");
		String birth1 = birth2[0]+birth2[1]+birth2[2];	
		String birth = birth1.substring(2);
		
		String address = request.getParameter("addr1")+", "
						+request.getParameter("addr2")+", "
						+request.getParameter("addr3");
		String phone = request.getParameter("phone");
		
		//service로 로그인 정보 확인
		JoinService js = new JoinService();
		
		Join j = new Join(email, pwd, name, gender, birth, address, phone);
		System.out.println("servlet : "+j);
		if(js.selectJoin(j) != null){
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "이미 존재하는 회원입니다");
		}
		
		if(js.insertJoin(j) >0){
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("msg", "회원 가입 중 에러가 발생하였습니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
