<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.semi.bandi.model.vo.*, java.util.*, java.text.*" %>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>)request.getAttribute("cartList");
	DecimalFormat df = new DecimalFormat("###,###,###,###,###");
	int bookTotal = 0;
	double pointRate = (Double)request.getAttribute("pointRate");
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>장바구니</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="<%=request.getContextPath()%>/resources/js/cart/jquery-3.3.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/shoppingBasket.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cart/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cart/shopping.css">
        <link href="<%=request.getContextPath()%>/resources/css/cart/fontawesome-all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
		            <!-- 장바구니 목록 표시 글 -->
		            <div class="row" style="padding-top:5%;">
		                <h3><i class="fas fa-shopping-basket fa-lx"></i><b>&nbsp;&nbsp;장바구니</b></h3>
		            </div>
		
		            <!-- 장바구니 목록 테이블 -->
		            <div class="row" style="margin-top:5%;">
		                <table class="table table-bordered" id="bookTb"> <!-- bootstrap.min.css 에서 table-bordered 안에 text-align:center 추가해줌 -->
		                    <thead>
		                        <tr>
		                            <th scope="col"><input type="checkbox" id="chkAll"></th>
		                            <th scope="col">상품정보</th>
		                            <th scope="col">판매가</th>
		                            <th scope="col">수량</th>
		                            <th scope="col">합계</th>
		                            <th scope="col">선택</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<!-- 조회 한 장바구니 데이터 수만큼 tr태그 생성 -->
		                    	<% if (cartList != null) {
		                    			for (int i = 1; i <= cartList.size(); i++) { 
		                    			bookTotal += cartList.get(i-1).getPrice() * cartList.get(i-1).getBookQuantity(); %>
			                    	<tr>
			                            <td class="tdChk" style="vertical-align:middle;">
			                            	<input type="checkbox" class="chk" id="chk<%= i %>"><input type="hidden" id="bookUID" value="<%= cartList.get(i-1).getBookUID() %>">
			                            </td> <!-- bootstrap.min.css 에서 .table td,.table th 안에 vertical-align:middle로 변경 -->
			                            <td class="text-left tdBook">
			                            	<a href = "<%=request.getContextPath()%>/detail.show?ISBN=<%= cartList.get(i-1).getIsbn()%>" style="font-size:12pt;">
			                            		<img id="bookImg<%= i %>" class="bookImg" src="<%=request.getContextPath()%>/resources/bookimage/<%= cartList.get(i-1).getImage() %>" alt="<%= cartList.get(i-1).getTitle() %>" style="margin-right:5%; margin-left:5%;">
			                            		<% if (cartList.get(i-1).getTitle().length() > 12) {%>
			                            			<%=cartList.get(i-1).getTitle().substring(0, 12) %>...
			                            		<% } else { %>
			                            			<%=cartList.get(i-1).getTitle() %>
			                            		<% } %>
		                            		</a>
			                            </td>
			                            <td class="tdPrice" id="sale<%= i %>" style="vertical-align:middle;">
			                            	<span class="onePrice"><%= df.format(cartList.get(i-1).getPrice())%></span> 원
			                            </td>
			                            <td class="tdQuan" style="vertical-align:middle;">
			                            	<input type="number" class="quan" id="quan<%= i %>" min="0" max="100" value="<%= cartList.get(i-1).getBookQuantity() %>">
			                            </td>
			                            <td class="tdPrice tdTotal" id="quan<%= i %>" style="vertical-align:middle;">
			                            	<span class="bookPrice"><%= df.format(cartList.get(i-1).getPrice() * cartList.get(i-1).getBookQuantity()) %></span> 원
			                            </td>
			                            <td class="tdBtn" style="vertical-align:middle;">
			                            	<input type="button" class="btn1 pickBtn" value="바로구매">&nbsp;&nbsp;&nbsp;<input type="button" class="btn2 delBtn" value="삭제">
			                            </td>
			                        </tr>
		                    	<% 	}
		                    		} else {%>
		                    			<tr>
		                    				<td colspan=6><h3>장바구니에 담긴 상품이 없습니다.</h3></td>
		                    			</tr>                    			
		                    	<% } %>
		                    </tbody>
		                </table>
		            </div>
		            
		            <!-- 삭제 버튼 -->
		            <div class="row">
		            	<input type="button" class="btn9" id="selectDelBtn" value="선택 삭제">&nbsp;&nbsp;&nbsp;
		                <input type="button" class="btn1" id="allDelBtn" value="전체 삭제">
		            </div>
		
		            <!-- 금액 테이블 -->
		            <div class="row" style="margin-top:5%;">
		                <table class="table table-bordered">
		                    <thead>
		                        <tr>
		                            <th scope="col">상품 금액</th>
		                            <th scope="col">배송비</th>
		                            <th scope="col">결제 예정 금액</th>
		                            <th scope="col">적립 예정</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <tr>
		                            <td id="total"><%= df.format(bookTotal) %> 원</td>
		                            <td id="delivery">
		                            	<% if (bookTotal > 30000 || cartList == null) { %>
		                            		0 
		                            	<% } else {%>
		                            		2,500
		                            	<% } %> 원
		                            </td>
		                            <td id="orderPrice">
		                            	<% if (bookTotal > 30000 || cartList == null) { %>
		                            		<%= df.format(bookTotal) %>
		                            	<% } else { %>
		                            		<%= df.format((bookTotal + 2500)) %>
		                            	<% } %>       원                 
		                            </td>
		                            <td id="point">
		                            	<% if (bookTotal > 30000 || cartList == null) { %>
		                            		<%= df.format(bookTotal * pointRate) %>
		                            	<% } else { %>
		                            		<%= df.format((bookTotal + 2500) * pointRate) %>
		                            	<% } %>  P
		                           	</td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		
		            <!-- 구매 버튼 -->
		            <div class="row justify-content-end" style="margin-top:5%; margin-bottom:5%;">
		                <div class="col-4 text-right">
			                <input type="button" class="btn3" id="shopBtn" name="shopBtn" value="쇼핑 계속하기">&nbsp;&nbsp;&nbsp;
			                <input type="button" class="btn4" id="orderBtn" name="orderBtn" value="선택상품 주문하기">&nbsp;&nbsp;&nbsp;
			                <input type="button" class="btn5" id="allBtn" name="allBtn" value="전체상품 주문하기">
		            	</div>
		            </div>
             	</div>
            </div>
        </div>
        
        <script>
        	var bookTotal ="<%=bookTotal%>";
        	var user_uid = "<%= user.getmUser_UID() %>";
        	var point = "<%=pointRate%>";
        </script>
        
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
    </body>

</html>