<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.bandi.model.vo.*, java.util.*, java.text.*"%>
<%
	ArrayList<OrderDetail> orderTable = (ArrayList<OrderDetail>)request.getAttribute("orderTable");
	ArrayList<OrderTable> orderDetail = (ArrayList<OrderTable>)request.getAttribute("orderDetail");
	ArrayList<OrderTable> orderCnt = (ArrayList<OrderTable>)request.getAttribute("orderCnt");
	DecimalFormat df = new DecimalFormat("###,###");
	int bookTotal = 0;
	int forCnt = 0;
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

            <!-- 주문/배송조회 목록 표시 글 -->
            <div class="d-flex align-items-center" style="padding-top:5%;">
                <i class="fas fa-search fa-2x"></i><h3><b>&nbsp;&nbsp;주문 / 배송 조회</b></h3>
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
            
            <% for (int i = 0 ; i < orderTable.size() ; i++) { %>
            
	            <div class="deliveryContain" style="padding-top:2%;">
		            <div class="row justify-content-between" style="background:rgb(247, 247, 247);">
		                <div class="col-6" style="padding-top:1%;">
		                    <p><%= orderTable.get(i).getShipping() %></p>
		                </div>
		                <div class="col-6 text-right" style="padding-top:1%;"> 
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
			                            <td class="tdOrderNum orderTh" rowspan="<%= orderCnt.get(i).getCnt() %>">
			                            	<span class="order_UID"><%= orderTable.get(i).getOrderUID() %></span><br>(<%= orderTable.get(i).getOrderDate() %>)
		                            	</td>
	                            	<% } %>
		                            <td class="text-left tdBook">
		                            	<img class="bookImg" src="<%=request.getContextPath()%>/resources/bookimage/<%= orderDetail.get(j).getImage() %>" alt="<%= orderDetail.get(j).getTitle() %>" style="margin-left:5%;margin-right:5%;">
		                            	<%= orderDetail.get(j).getTitle() %>
		                            	<input type="hidden" class="bookUID" id="bookUID<%= j+1 %>" value="<%= orderDetail.get(j).getBookUID() %>">
	                            	</td>
		                            <td class="tdQuan">
		                            	<%= orderDetail.get(j).getAmout() %>
	                            	</td>
		                            <td class="tdPrice">
		                            	<%= df.format(orderDetail.get(j).getPrice()) %> 원
	                            	</td>
		                            <td class="tdState">
		                            	<%= orderTable.get(i).getShippingSate() %>
		                            </td>
		                            <td class="tdChk">
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
	                           <td><%= df.format(bookTotal) %> 원</td>
	                           <td class="priceTd"><span class="finalPrice"><%= df.format(orderTable.get(i).getDiscount()) %></span> 원</td>
	                           <td><%= df.format(orderTable.get(i).getPrice()) %> 원</td>
	                           <td><%= df.format(orderTable.get(i).getPoint()) %> P</td>
	                       </tr>
		                </table>
		            </div>
				</div>
			
	            <hr>
		
			<% } %>
			
            <!-- 쇼핑 버튼 -->
            <div class="row justify-content-end" style="padding-top:5%; padding-bottom:5%;">
                <input type="button" class="btn3 shoppingBtn" value="쇼핑 계속하기">
            </div>

        </div>
        
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
        
    </body>

</html>