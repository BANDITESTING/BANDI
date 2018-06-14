package com.semi.bandi.controller.member;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bandi.join.util.SMTPAuthenticator;
import com.semi.bandi.model.service.member.LoginService;
import com.semi.bandi.model.vo.User;

@WebServlet("/findPwd.me")
public class jfindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public jfindPwdServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int result = 0;
		
		User user = new User();
		user.setmName(name);
		user.setmEmail(email);
		
		int new_num = new Random().nextInt(Integer.MAX_VALUE) + 1;
		String new_pwd = Integer.toString(new_num);
		
		user.setmPassword(getSha512(new_pwd));
		
		LoginService ls = new LoginService();
		
		if(ls.findPwd(user) > 0){
			result = 1;

		} else {
			result = -1;
		}
		response.getWriter().println(result);
		
		request.setCharacterEncoding("utf-8");
		
		String from = "qoxodnjs6@naver.com";
		String to = request.getParameter("email");
		String content = String.valueOf(new_pwd);
		// 입력값 받음
	 
		Properties p = new Properties(); // 정보를 담을 객체
	 
		p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
	 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들
	 
		try{
			Authenticator auth = new SMTPAuthenticator();
			Session ses = Session.getInstance(p, auth);
	     
//	    ses.setDebug(true);
	     
			MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			msg.setSubject("임시 비밀번호 입니다."); // 제목
	     
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr); // 보내는 사람
	     
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
	     
	    
			msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
	     
			Transport.send(msg); // 전송
		} catch(Exception e){
	    	e.printStackTrace();
	    
//	    return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private static String getSha512(String pwd) {
		
		String encPwd = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encPwd;
	}
}











