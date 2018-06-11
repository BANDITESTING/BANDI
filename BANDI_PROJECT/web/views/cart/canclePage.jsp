<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.bandi.model.vo.*, java.util.*, java.text.*" %>
<%
	ArrayList<OrderTable> cancleData = (ArrayList<OrderTable>)request.getAttribute("cancleData");
	DecimalFormat df = new DecimalFormat("###,###");
	int price = (int)request.getAttribute("price");
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

            <!-- 주문취소 목록 표시 글 -->
            <div class="d-flex align-items-center" style="padding-top:5%;">
                <i class="fas fa-shopping-basket fa-2x"></i><h3><b>&nbsp;&nbsp;주문 취소</b></h3>
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
		                    <td class="text-left">
		                    	<img class="bookImg" src="<%=request.getContextPath()%>/resources/bookimage/<%= cancleData.get(i).getImage() %>" alt="<%= cancleData.get(i).getTitle() %>" style="margin-left:5%;margin-right:5%;"><%= cancleData.get(i).getTitle() %>
	                    		<input type="hidden" class="bookUID" id="bookUID<%= i+1 %>" value="<%= cancleData.get(i).getBookUID() %>">
	                    		<input type="hidden" class="orderUID" id="orderUID<%= i+1 %>" value="<%= cancleData.get(i).getOrderUID() %>">
	                    	</td>
		                    <td>
		                    	<%= cancleData.get(i).getAmout() %>
		                    </td>
		                    <td style="margin-right:3%;">
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
            <div class="row justify-content-end" style="padding-top:5%;">
                <div class="col-2" style="border-bottom-style:solid; border-bottom-color:rgb(210, 115, 143);">
                    <h5 style="color:rgb(210, 115, 143);"><b>환불 금액</b></h5>
                </div>
            </div>
            <div class="row justify-content-end" style="padding-top:1%;">
                <span id="canclePrice"><b><%= df.format(bookTotal - price) %></span> 원</b>
            </div>

            <!-- 쇼핑 계속 버튼 -->
            <div class="row justify-content-end" style="padding-top:5%; padding-bottom:5%;">
                <input type="button" class="btn3 detailBtn" value="주문 상세 가기">&nbsp;&nbsp;&nbsp;<input type="button" class="btn5 cancleBtn" value="주문 취소 하기">
            </div>

        </div>
        
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
        
    </body>

</html>