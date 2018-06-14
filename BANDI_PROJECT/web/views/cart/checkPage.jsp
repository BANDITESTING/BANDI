<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.bandi.model.vo.*, java.util.*, java.text.*"%>
<%
	ArrayList<OrderDetail> orderTable = (ArrayList<OrderDetail>)request.getAttribute("orderTable");
	ArrayList<OrderTable> orderDetail = (ArrayList<OrderTable>)request.getAttribute("orderDetail");
	ArrayList<OrderTable> orderCnt = (ArrayList<OrderTable>)request.getAttribute("orderCnt");
	DecimalFormat df = new DecimalFormat("###,###");
	int bookTotal = 0;
	int forCnt = 0;
	System.out.println("1 : " + orderTable);
	System.out.println("2 : " + orderDetail);
	System.out.println("3 : " + orderCnt);
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8?">
        <title>주문 / 배송조회</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="<%=request.getContextPath()%>/resources/js/cart/jquery-3.3.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/checkPage.js"></script>
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
            
		            <!-- 주문/배송조회 목록 표시 글 -->
		            <div class="row" style="padding-top:5%;">
		                <h3><i class="fas fa-search fa-lx"></i><b>&nbsp;&nbsp;주문 / 배송 조회</b></h3>
		            </div>
		
		            <!-- 주문자 정보 확인 테이블 -->
		            <div class="row" style="padding-top:5%;">
		            	<p><h5><b>- 주문자 정보</b></h5></p>
		            </div>
		            <div class="row">
		                <table class="table table-bordered"> <!-- bootstrap.min.css 에서 table-bordered 안에 text-align:center 추가해줌 -->
		                    <tr>
		                        <th scope="col">주문하신 분</th>
		                        <td colspan="3" class="text-left" style="padding-left:3%;"><%= user.getmName() %></td>
		                    </tr>
		                    <tr>
		                        <th>휴대폰 번호</th>
		                        <td class="text-left" style="padding-left:3%;"><%= user.getmPhone() %></td>
		                        <th>이메일</th>
		                        <td class="text-left" style="padding-left:3%;"><%= user.getmAddress() %></td>
		                    </tr>
		                </table>
		            </div>
		
		            <!-- 배송 정보 -->
		            <div class="row" style="padding-top:5%;">
		                <p><h5><b>- 배송 정보</b></h5></p>
		            </div>
		            
		            <% if (orderDetail != null || orderCnt!= null || orderTable != null) {
		            	for (int i = 0 ; i < orderTable.size() ; i++) { %>
		            
			            <div class="deliveryContain" style="padding-top:2%;">
				            <div class="row" style="background:rgb(247, 247, 247); vertical-align: middle;">
				                <div class="col-md-6" style="margin-top:1%; margin-bottom:1%;  vertical-align: middle;">
				                    <p><%= orderTable.get(i).getShipping() %></p>
				                </div>
				                <div class="col-md-6 text-right" style="margin-top:1%; margin-bottom:1%; vertical-align: middle;"> 
				                	<input type="button" class="btn6 allCancleBtn" value="주문 전체 취소">&nbsp;&nbsp;&nbsp;
				                    <input type="button" class="btn6 cancleBtn" value="주문 선택 취소">
				                </div>
				            </div>
				
				            <!-- 배송 정보 테이블 -->
				            <div class="row deliveryData" style="padding-top:1%;">
				                <table class="table table-bordered"> <!-- bootstrap.min.css 에서 table-bordered 안에 text-align:center 추가해줌 -->
			                        <tr>
			                            <th class="orderTh" scope="col">주문번호</th>
			                            <th scope="col">상품정보</th>
			                            <th scope="col">수량</th>
			                            <th scope="col">판매가 합계</th>
			                            <th scope="col">주문상태</th>
			                            <th scope="col"><input type="checkbox" class="chkAll"></th>
			                        </tr>
			                        
			                        <% 
			                        	bookTotal = 0;
			                        	for (int j = forCnt ; j < orderCnt.get(i).getCnt() + forCnt ; j++) { 
			                        	bookTotal += orderDetail.get(j).getPrice();
			                        %>
				                        <tr>
				                        	<% if (j == forCnt) { %>
					                            <td class="tdOrderNum orderTh" rowspan="<%= orderCnt.get(i).getCnt() %>" style="vertical-align:middle;">
					                            	<span class="order_UID"><%= orderTable.get(i).getOrderUID() %></span><br>(<%= orderTable.get(i).getOrderDate() %>)
				                            	</td>
			                            	<% } %>
				                            <td class="text-left tdBook" style="vertical-align:middle;">
				                            	<a href = "<%=request.getContextPath()%>/detail.show?ISBN=<%= orderDetail.get(j).getIsbn()%>" style="font-size:12pt;">
				                            		<img class="bookImg" src="<%=request.getContextPath()%>/resources/bookimage/<%= orderDetail.get(j).getImage() %>" alt="<%= orderDetail.get(j).getTitle() %>" style="margin-right:5%; margin-left:5%;">
				                            		<% if (orderDetail.get(j).getTitle().length() > 10) {%>
				                            			<%=orderDetail.get(j).getTitle().substring(0, 10) %>...
				                            		<% } else { %>
				                            			<%=orderDetail.get(j).getTitle() %>
				                            		<% } %>
			                            		</a>
				                            	<input type="hidden" class="bookUID" id="bookUID<%= j+1 %>" value="<%= orderDetail.get(j).getBookUID() %>">
			                            	</td>
				                            <td class="tdQuan" style="vertical-align:middle;">
				                            	<%= orderDetail.get(j).getAmout() %>
			                            	</td>
				                            <td class="tdPrice" style="vertical-align:middle;">
				                            	<%= df.format(orderDetail.get(j).getPrice()) %> 원
			                            	</td>
				                            <td class="tdState" style="vertical-align:middle;">
				                            	<%= orderTable.get(i).getShippingSate() %>
				                            </td>
				                            <td class="tdChk" style="vertical-align:middle;">
				                            	<input type="checkbox" class="chk" id="chk<%= j+1 %>">
				                            </td> <!-- bootstrap.min.css 에서 .table td,.table th 안에 vertical-align:middle로 변경 -->
				                        </tr>
			                        <% } forCnt += orderCnt.get(i).getCnt(); %>
				                </table>
				            </div>
				            <div class="row">
				                <table class="table table-bordered">
				                    <tr>
				                        <th class="orderTh">받으실 분</th>
				                        <td class="text-left" style="padding-left:3%;"><%= orderTable.get(i).getReceiver() %></td>
				                    </tr>
				                    <tr>
				                        <th class="orderTh">주소</th>
				                        <td class="text-left" style="padding-left:3%;"><%= orderTable.get(i).getShipping() %></td>
				                    </tr>
				                    <tr>
				                        <th class="orderTh">휴대폰 번호</th>
				                        <td class="text-left" style="padding-left:3%;"><%= orderTable.get(i).getPhone() %></td>
				                    </tr>
				                </table>
				            </div>
				            
				            <!-- 결제 정보 -->
				            <div class="row" style="padding-top:5%;">
				                <p><h5><b>- 결제 정보</b></h5></p>
				            </div>
				            <div class="row priceTable">
				                <table class="table table-bordered">
			                       <tr>
			                           <th>상품 금액</th>
			                           <th>할인 금액</th>
			                           <th>최종 결제 금액</th>
			                           <th>적립 예정 금액</th>
			                       </tr>
			                       <tr>
			                           <td class="totalTd"><span class="bookTotalTd"><%= df.format(bookTotal) %></span> 원</td>
			                           <td class="priceTd"><span class="finalPrice"><%= df.format(orderTable.get(i).getDiscount()) %></span> 원</td>
			                           <td><%= df.format(orderTable.get(i).getPrice()) %> 원</td>
			                           <td><%= df.format(orderTable.get(i).getPoint()) %> P</td>
			                       </tr>
				                </table>
				            </div>
						</div>
	            		<hr>
					<% }} else { %>
						<div class="deliveryContain" style="padding-top:2%;">
							<table class="table table-bordered"> <!-- bootstrap.min.css 에서 table-bordered 안에 text-align:center 추가해줌 -->
		                        <thead>
			                        <tr>
			                            <th class="orderTh" scope="col">주문번호</th>
			                            <th scope="col">상품정보</th>
			                            <th scope="col">수량</th>
			                            <th scope="col">판매가 합계</th>
			                            <th scope="col">주문상태</th>
			                            <th scope="col"><input type="checkbox" class="chkAll"></th>
			                        </tr>
		                        </thead>
		                        <tbody>
			                        <tr>
			                        	<td colspan="6"><h3>주문 내역이 없습니다.</h3></td>
			                        </tr>
		                        </tbody>
	                        </table>
	                    </div>
					<% } %>
					
		            <!-- 쇼핑 버튼 -->
		            <div class="row text-right" style="padding-top:5%; padding-bottom:5%;">
		                <input type="button" class="btn3 shoppingBtn" value="쇼핑 계속하기">
		            </div>
			            
				</div>
			</div>
        </div>
        
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
    </body>

</html>