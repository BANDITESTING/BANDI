<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.bandi.model.vo.*, java.util.*, java.text.*"%>
<%
	OrderDetail orderDetail = (OrderDetail)request.getAttribute("orderDetail");
	int orderTotal = (int)request.getAttribute("orderTotal");
	int deliveryPay = (int)request.getAttribute("deliveryPay");
	DecimalFormat df = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8?">
        <title>주문완료</title>

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
		            <!-- 주문완료 목록 표시 글 -->
		            <div class="row" style="padding-top:5%;">
		                <h3><b><i class="fas fa-shopping-cart fa-lx"></i>&nbsp;&nbsp;주문 완료</b></h3>
		            </div>
		
		            <!-- 주문 완료 문구 -->
		            <div class="row justify-content-center" style="padding-top:5%; text-align: center;">
		                <h2><b>주문이 성공적으로 접수 되었습니다.</b></h2>
		            </div>
		            <div class="row justify-content-center" style="padding-bottom:5%; text-align: center;">
		                <p>주문번호 (<%= orderDetail.getOrderUID() %>) | <%= user.getmName() %> 고객님, 감사합니다.&nbsp;&nbsp;&nbsp;<input type="button" class="btn7 detailBtn" value="주문내역 상세보기"></p>
		            </div>
		            <hr>
		            
		            <!-- 결제정보 목록 표시 글 -->
		            <div class="row" style="padding-top:5%; padding-bottom:2%;">
		                <h3><b><i class="fas fa-credit-card fa-lx"></i>&nbsp;&nbsp;결제 정보</b></h3>
		            </div>
		            <div class="row">
		                <table class="table table-bordered">
		                    <thead>
		                        <tr>
		                            <th>상품 금액</th>
		                            <th>배송비</th>
		                            <th>할인 금액</th>
		                            <th>결제 금액</th>
		                            <th>적립 금액</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <tr>
		                            <td><%= df.format(orderTotal) %> 원</td>
		                            <td><%= df.format(deliveryPay) %> 원</td>
		                            <td><%= df.format(orderDetail.getDiscount()) %> 원</td>
		                            <td><%= df.format(orderDetail.getPrice()) %> 원</td>
		                            <td><%= df.format(orderDetail.getPoint()) %> 원</td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		
		             <!-- 배송정보 목록 표시 글 -->
		             <div class="row" style="padding-top:5%; padding-bottom:2%;">
		                <h3><b><i class="fas fa-truck fa-lx"></i>&nbsp;&nbsp;배송 정보</b></h3>
		            </div>
		            <div class="row">
		                <table class="table table-bordered">
		                    <tr>
		                        <th>받으실 분</th>
		                        <td class="text-left" style="padding-left:3%;"><%= orderDetail.getReceiver() %></td>
		                    </tr>
		                    <tr>
		                        <th>주소</th>
		                        <td class="text-left" style="padding-left:3%;"><%= orderDetail.getShipping().replace(",", " ") %></td>
		                    </tr>
		                    <tr>
		                        <th>휴대폰 번호</th>
		                        <td class="text-left" style="padding-left:3%;"><%= orderDetail.getPhone() %></td>
		                    </tr>
		                </table>
		            </div>
		
		            <!-- 쇼핑 계속 버튼 -->
		            <div class="row text-right" style="padding-top:5%; padding-bottom:5%;">
		                <input type="button" class="btn3 shoppingBtn" value="쇼핑 계속하기">&nbsp;&nbsp;&nbsp;<input type="button" class="btn4 cartBtn" value="장바구니">&nbsp;&nbsp;&nbsp;<input type="button" class="btn5 detailBtn" value="주문내역 상세보기">
		            </div>
            	</div>
            </div>
        </div>
                
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
        
    </body>

</html>