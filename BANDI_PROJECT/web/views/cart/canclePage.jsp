<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.bandi.model.vo.*, java.util.*, java.text.*" %>
<%
	ArrayList<OrderTable> cancleData = (ArrayList<OrderTable>)request.getAttribute("cancleData");
	DecimalFormat df = new DecimalFormat("###,###");
	int point = (int)request.getAttribute("point");
	int cnt = (int)request.getAttribute("cnt");
	int flag = (int)request.getAttribute("flag");
	int bookPrice = (int)request.getAttribute("bookTotal");
 	int bookTotal = 0;
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8?">
        <title>주문취소</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="<%=request.getContextPath()%>/resources/js/cart/jquery-3.3.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/canclePage.js"></script>
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
		            <!-- 주문취소 목록 표시 글 -->
		            <div class="row" style="padding-top:5%;">
		                <h3><b><i class="fas fa-shopping-basket fa-lx"></i>&nbsp;&nbsp;주문 취소</b></h3>
		            </div>
		
		            <!-- 취소 상품 확인 테이블 -->
		            <div class="row" style="padding-top:5%;">
		                <p><b>- 취소하실 상품 내역</b></p>
		            </div>
		            <div class="row">
		                <table class="table table-bordered"> <!-- bootstrap.min.css 에서 table-bordered 안에 text-align:center 추가해줌 -->
			                <tr>
			                    <th scope="col">상품정보</th>
			                    <th scope="col">수량</th>
			                    <th scope="col">판매가 합계</th>
			                </tr>
			
							<% for (int i = 0 ; i < cancleData.size() ; i++) { 
								bookTotal += cancleData.get(i).getPrice() * cancleData.get(i).getAmout(); %>
				                <tr>
				                    <td class="text-left" style="vertical-align:middle;">
				                    	<a href="<%= request.getContextPath()%>/detail.show?ISBN=<%= cancleData.get(i).getIsbn()%>"><img class="bookImg" src="<%=request.getContextPath()%>/resources/bookimage/<%= cancleData.get(i).getImage() %>" alt="<%= cancleData.get(i).getTitle() %>" style="margin-left:5%;margin-right:5%;"><%= cancleData.get(i).getTitle() %></a>
			                    		<input type="hidden" class="bookUID" id="bookUID<%= i+1 %>" value="<%= cancleData.get(i).getBookUID() %>">
			                    		<input type="hidden" class="orderUID" id="orderUID<%= i+1 %>" value="<%= cancleData.get(i).getOrderUID() %>">
			                    	</td>
				                    <td style="vertical-align:middle;">
				                    	<%= cancleData.get(i).getAmout() %>
				                    </td>
				                    <td style="margin-right:3%; vertical-align:middle;">
				                    	<%= df.format(cancleData.get(i).getPrice() * cancleData.get(i).getAmout()) %> 원
				                    </td>
				                </tr>
			                <% } %>
		                </table>
		            </div>
		
		            <!-- 주문 취소 사유 -->
		            <div class="row" style="padding-top:5%;">
		                <p><b>- 주문 취소 사유</b></p>
		            </div>
		            <div class="row">
		                <select name="cancle" id="cancle">
		                    <option value="base">주문 취소 사유를 선택해주세요.</option>
		                    <option value="other">기타</option>
		                </select>
		                &nbsp;&nbsp;&nbsp;
		                <input type="text" id="writeText" placeholder="내용을 입력해주세요." size="50" disabled>
		            </div>
		
		            <!-- 환불 금액 -->
		            <div class="row text-right" style="padding-top:5%;">
		                <div class="col-2 text-right" style="display:inline-block; border-bottom-style:solid; border-bottom-color:rgb(210, 115, 143); width:150px;">
		                    <h5 style="color:rgb(210, 115, 143);"><b>환불 금액</b></h5>
		                </div>
		            </div>
		            <div class="row text-right" style="padding-top:1%;">
		                <span id="canclePrice"><b><% if (cnt != flag) { %><%= df.format(bookTotal) %><% } else { %><%= df.format(bookPrice) %><% } %></span> 원</b>
		            </div>
		
		            <!-- 쇼핑 계속 버튼 -->
		            <div class="row text-right" style="padding-top:5%; padding-bottom:5%;">
		                <input type="button" class="btn3 detailBtn" value="주문 상세 가기">&nbsp;&nbsp;&nbsp;<input type="button" class="btn5 cancleBtn" value="주문 취소 하기">
		            </div>
	            </div>
			</div>
        </div>
        
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
        
        <script>
        	var cnt = <%= cnt %>;
        	var flag = <%= flag %>;
        	var bookPrice = <%= bookPrice %>;
        	var point = <%= point %>;
        </script>
        
    </body>

</html>