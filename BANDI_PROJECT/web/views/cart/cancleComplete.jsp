<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.bandi.model.vo.*, java.util.*, java.text.*" %>
<%
	String orderUID = (String)request.getAttribute("orderUID");
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8?">
        <title>주문취소완료</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="<%=request.getContextPath()%>/resources/js/cart/jquery-3.3.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/orderComplete.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cart/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cart/shopping.css">
        <link href="<%=request.getContextPath()%>/resources/css/cart/fontawesome-all.min.css" rel="stylesheet">
    </head>

    <body>
    
    	<header>
    		<%@include file ="../common/Header.jsp" %>
    	</header>
    	
        <div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 sidebar">
					<ul class="nav nav-sidebar">
						<li class="active"><a href="views/member/jmypage.jsp">My Page</a></li>
						<li class="active"><a href="views/member/jchange_Pwd.jsp">비밀번호 변경</a></li>
		            	<li class="active"><a href="views/member/jdeleteUser.jsp">회원 탈퇴</a></li>
		            	<li class="active"><a href="<%= request.getContextPath()%>/cart.ct">장바구니</a></li>
		            	<li class="active"><a href="<%= request.getContextPath()%>/check.ct">주문 상세보기</a></li>
		            </ul>
		        </div>
		        
		        <div role="main" class="col-xs-10 col-xs-offset-2 col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
		            <!-- 주문취소완료 목록 표시 글 -->
		            <div class="row" style="padding-top:5%;">
		                <h3><b><i class="fas fa-shopping-basket fa-lx"></i>&nbsp;&nbsp;주문 취소 완료</b></h3>
		            </div>
		
		            <!-- 주문 취소 문구 -->
		            <div class="row justify-content-center" style="padding-top:5%; text-align:center;">
		                <h2><b>주문번호 (<%= orderUID %>)가 취소 접수 되었습니다.</b></h2>
		            </div>
		            <div class="row justify-content-center" style="padding-bottom:5%; text-align:center;">
		                <p><%= user.getmName() %> 고객님, 감사합니다.</p>
		            </div>
		            <hr>
		
		            <!-- 쇼핑 계속 버튼 -->
		            <div class="row text-right" style="padding-bottom:5%;">
		                <input type="button" class="btn3 shoppingBtn" value="쇼핑 계속하기">&nbsp;&nbsp;&nbsp;<input type="button" class="btn4 detailBtn" value="주문 상세보기">
		            </div>
				</div>
			</div>
        </div>
        
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
        
    </body>

</html>