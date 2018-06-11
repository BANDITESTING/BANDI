<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.semi.bandi.model.vo.*, java.util.*, java.text.*" %>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>)request.getAttribute("cartList");
	User orderUser = (User)session.getAttribute("user");
	DecimalFormat df = new DecimalFormat("###,###");
	int bookTotal = 0;
	double pointRate = (Double)request.getAttribute("pointRate");
%>
<!DOCTYPE html>
<html>

<head>
        <meta charset="utf-8?">
        <title>주문결제</title>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="<%=request.getContextPath()%>/resources/js/cart/jquery-3.3.1.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/cart/bootstrap.min.js"></script>
        <!-- <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script> -->
        <script src="<%=request.getContextPath()%>/resources/js/cart/productOrder.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cart/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cart/shopping.css">
        <link href="<%=request.getContextPath()%>/resources/css/cart/fontawesome-all.min.css" rel="stylesheet">
    </head>

    <body>
    
       	<header>
    		<%@include file ="../common/Header.jsp" %>
    	</header>
    	
        <div class="container">

            <!-- 주문완료 목록 표시 글 -->
            <div class="d-flex align-items-center" style="padding-top:5%;">
                <i class="fas fa-credit-card fa-2x"></i><h3><b>&nbsp;&nbsp;주문 / 결제</b></h3>
            </div>

            <!-- 01. 주문 상품 목록 -->
            <div class="d-flex align-items-center" style="padding-top:5%;">
                <h3 style="color:rgb(132, 141, 197);"><b>01</b></h3><span class="align-bottom"><b>&nbsp;&nbsp;주문 상품 목록</b></span>
            </div>
            <div class="row" style="padding-top:2%;">
                <table class="table table-bordered"> <!-- bootstrap.min.css 에서 table-bordered 안에 text-align:center 추가해줌 -->
                    <thead>
                        <tr>
                            <th scope="col">상품정보</th>
                            <th scope="col">판매가</th>
                            <th scope="col">수량</th>
                            <th scope="col">합계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 1; i <= cartList.size(); i++) {  
                        		bookTotal += cartList.get(i-1).getPrice() * cartList.get(i-1).getBookQuantity(); %>
	                    	<tr>
	                            <td class="text-left tdBook">
	                            	<img id="bookImg<%= i %>" class="bookImg" src="<%=request.getContextPath()%>/resources/bookimage/<%= cartList.get(i-1).getImage() %>" alt="<%= cartList.get(i-1).getTitle() %>" style="margin-right:5%; margin-left:5%;"><%= cartList.get(i-1).getTitle() %>
	                            	<input type="hidden" id="bookUID" value="<%= cartList.get(i-1).getBookUID() %>">
	                            </td>
	                            <td class="tdPrice" id="sale<%= i %>">
	                            	<span class="onePrice"><%= df.format(cartList.get(i-1).getPrice())%></span> 원
	                            </td>
	                            <td class="tdQuan">
	                            	<span class="bookQuan"><%= cartList.get(i-1).getBookQuantity() %></span>
	                            </td>
	                            <td class="tdPrice tdTotal" id="quan<%= i %>">
	                            	<span class="bookPrice"><%= df.format(cartList.get(i-1).getPrice() * cartList.get(i-1).getBookQuantity()) %></span> 원
	                            </td>
	                        </tr>
                    	<% 	} %>
                    </tbody>
                </table>
            </div>
            
            <div class="row">
                <p>상품 변경을 원하시면</p> &nbsp;&nbsp; <input type="button" class="btn6" id="returnBtn" value="장바구니가기">
            </div>
            
            <div class="row" style="padding-top:5%;">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>상품 금액</th>
                            <th>배송비</th>
                            <th>결제 예정 금액</th>
                            <th>적립 예정</th>
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
                            	<% } %> 원        
                            </td>
                            <td id="point">
                            	<% if (bookTotal > 30000 || cartList == null) { %>
                            		<%= df.format(bookTotal * pointRate) %>
                            	<% } else { %>
                            		<%= df.format((bookTotal + 2500) * pointRate) %>
                            	<% } %> P
                           	</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 02. 배송지 정보 -->
            <div class="d-flex align-items-center" style="padding-top:5%;">
                <h3 style="color:rgb(132, 141, 197);"><b>02</b></h3><span class="align-bottom"><b>&nbsp;&nbsp;배송지 정보</b></span>
            </div>
            <div class="row">
                <table class="table table-bordered deliveryTb">
                    <tr>
                        <th>주문자 정보</th>
                        <td class="text-left" style="padding-left:3%;" colspan="4"><%= orderUser.getmName() %>&nbsp;&nbsp;|&nbsp;&nbsp;<%= orderUser.getmEmail() %>&nbsp;&nbsp;|&nbsp;&nbsp;<%= orderUser.getmPhone() %></td>
                    </tr> 
                    <tr>
                        <th>배송 방법</th>
                        <td class="text-left" style="padding-left:3%;" colspan="4"><input type="radio" name="delivery" class="delivery" id="delivery1" value="basic" checked="checked"><label for="delivery1">&nbsp;&nbsp;[국내]일반택배</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="delivery" class="delivery" id="delivery2" value="store"><label for="delivery2">&nbsp;&nbsp;편의점배송</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="delivery" class="delivery" id="delivery3" value="foreign"><label for="delivery3">&nbsp;&nbsp;해외배송</label></td>
                    </tr>  
                    <tbody class="basicUserTB"> 
                        <tr>
                            <th rowspan="4">배송지 정보</th>
                            <td class="text-left" style="padding-left:3%;" colspan="4"><input type="radio" name="addr" class="addr" id="memD" value="basicUser" checked="checked"><label for="memD">&nbsp;&nbsp;회원정보동일</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="addr" class="addr" id="newD" value="newUser"><label for="newD">&nbsp;&nbsp;새로입력</label></td>
                        </tr>   
                        <tr>
                            <td><b>받으실 분</b></td>
                            <td class="text-left" style="padding-left:3%;" colspan="3"><%= user.getmName() %></td>
                        </tr> 
                        <tr>
                            <td><b>휴대폰</b></td>
                            <td class="text-left" style="padding-left:3%;">
                            	<%= user.getmPhone() %>
                            </td>
                        </tr> 
                        <tr>
                            <th>주소</th>
                            <td class="text-left" style="padding-left:3%;"><%= user.getmAddress() %></td> 
                        </tr>  
                        <tr>
                            <th>택배기사 메세지</th>
                            <td class="text-left" style="padding-left:3%;" colspan="4"><input type="text" id="msg1" size="90" placeholder="배송시 유의사항 등 택배회사 직원에게 전달하실 내용을 입력하세요."></td>
                        </tr>  
                        <tr>
                            <th>전달 메세지</th>
                            <td class="text-left" style="padding-left:3%;" colspan="4"><input type="text" id="msg2" size="90" placeholder="상품을 받는 분께 전달하실 내용을 입력하세요."></td>
                        </tr>         
                    </tbody>
                    <tbody class="newUserTB"> 
                        <tr>
                            <th rowspan="6">배송지 정보</th>
                            <td class="text-left" style="padding-left:3%;" colspan="4"><input type="radio" name="addr" class="addr" id="memD_new" value="basicUser"><label for="memD_new">&nbsp;&nbsp;회원정보동일</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="addr" class="addr" id="newD_new" value="newUser"><label for="newD_new">&nbsp;&nbsp;새로입력</label></td>
                        </tr>  
                       	<tr>
                            <td><b>받으실 분</b></td>
                            <td class="text-left" style="padding-left:3%;" colspan="3"><input type="text" id="nameText" size="15">&nbsp;&nbsp;(10자 내외 입력)</td>
                        </tr> 
                        <tr>
                            <td><b>휴대폰</b></td>
                            <td class="text-left" style="padding-left:3%;">
                                <select name="userPh" id="userPh1">
                                    <option value="010">010</option>
                                    <option value="019">019</option>
                                    <option value="011">011</option>
                                </select>&nbsp;-&nbsp;<input type="text" id="userPh2" size="4">&nbsp;-&nbsp;<input type="text" id="userPh3" size="4">
                            </td>
                        </tr> 
                        <tr>
                            <th rowspan="3">주소</th>
                            <td colspan="3" class="text-left" style="padding-left:3%;"><input type="text" id="stamp" size="15" placeholder="우편번호">&nbsp;&nbsp;&nbsp;<input type="button" class="btn8" id="addrSearch" value="주소 찾기"></td> 
                        </tr> 
                        <tr>
                            <td colspan="3" class="text-left" style="padding-left:3%;"><input type="text" id="addr1" size="79" placeholder="주소"></td>
                        </tr> 
                        <tr>
                            <td colspan="3" class="text-left" style="padding-left:3%;"><input type="text" id="addr2" size="79" placeholder="상세주소"></td>
                        </tr> 
                        <tr>
                            <th>택배기사 메세지</th>
                            <td class="text-left" style="padding-left:3%;" colspan="4"><input type="text" id="msg1_new" size="90" placeholder="배송시 유의사항 등 택배회사 직원에게 전달하실 내용을 입력하세요."></td>
                        </tr>  
                        <tr>
                            <th>전달 메세지</th>
                            <td class="text-left" style="padding-left:3%;" colspan="4"><input type="text" id="msg2_new" size="90" placeholder="상품을 받는 분께 전달하실 내용을 입력하세요."></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 03. 할인 정보 -->
            <div class="d-flex align-items-center" style="padding-top:5%;">
                <h3 style="color:rgb(132, 141, 197);"><b>03</b></h3><span class="align-bottom"><b>&nbsp;&nbsp;할인 정보</b></span>
            </div>
            <div class="row">
                <table class="table table-bordered">
                    <tr>
                        <th>포인트(적립금)</th>
                        <td class="text-left" style="padding-left:3%;"><input type="text" id="pointT" size="13" style="text-align:right; padding-right:2px;">&nbsp;&nbsp;원 / <%= df.format(user.getmBandi_Point()) %> 원&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="pointAll" id="pointAll"><label for="pointAll">&nbsp;모두 사용</label></td>
                    </tr>
                </table>
            </div>
            <div class="row">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>주문 금액 합계</th>
                            <th>배송비</th>
                            <th>할인 금액</th>
                            <th>결제 금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span id="orderTotal"><%= df.format(bookTotal) %></span> 원</td>
                            <td><span id="deliveryTotal"><% if (bookTotal > 30000 || cartList == null) { %>0<% } else {%>2,500<% } %></span> 원</td>
                            <td>
                            	<span id="discount">0</span> 원
                            </td>
                            <td>
                            <span id="priceTotal"><% if (bookTotal > 30000 || cartList == null) { %><%= df.format(bookTotal) %><% } else { %><%= df.format((bookTotal + 2500)) %><% } %></span> 원</td>
                        </tr>   
                    </tbody>
                </table>
            </div>

            <!-- 04. 결제 정보 -->
            <div class="d-flex align-items-center" style="padding-top:5%;">
                <h3 style="color:rgb(132, 141, 197);"><b>04</b></h3><span class="align-bottom"><b>&nbsp;&nbsp;결제 정보</b></span>
            </div>
            <div class="row">
                <table class="table table-borderless" style="background:rgb(239, 239, 239);">
                    <tr>
                        <th class="text-center">신용카드</th>
                        <td><input type="radio" name="pay" id="card1"><label for="card1">&nbsp;&nbsp;신용카드(일반)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="card2"><label for="card2">&nbsp;&nbsp;제휴 신용카드</label></td>
                    </tr>
                    <tr>
                        <th class="text-center">간편결제</th>
                        <td><input type="radio" name="pay" id="pay1" checked="checked"><label for="pay1">&nbsp;&nbsp;카카오페이</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="pay2"><label for="pay2">&nbsp;&nbsp;PAYCO</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="pay3"><label for="pay3">&nbsp;&nbsp;네이버페이</label></td>
                    </tr>
                    <tr>
                        <th class="text-center">현금결제</th>
                        <td><input type="radio" name="pay" id="cart1"><label for="cart1">&nbsp;&nbsp;실시간 계좌이체</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="cart2"><label for="cart2">&nbsp;&nbsp;무통장 입금</label></td>
                    </tr>
                    <tr>
                        <th class="text-center">기타결제</th>
                        <td><input type="radio" name="pay" id="other1"><label for="other1">&nbsp;&nbsp;휴대폰 결제</label></td>
                    </tr>
                </table>
            </div>

            <!-- 최종 결제 금액 표시 -->
            <div class="row justify-content-end" style="padding-top:5%;">
                <div class="col-2" style="border-bottom-style:solid; border-bottom-color:rgb(210, 115, 143);">
                    <h5 style="color:rgb(210, 115, 143);"><b>최종 결제 금액</b></h5>
                </div>
            </div>
            <div class="row justify-content-end" style="padding-top:1%;">
                <b>
                	<span id="payTotal">
                		<% if (bookTotal > 30000 || cartList == null) { %>
                   			<%= df.format(bookTotal) %>
                      	<% } else { %>
                      		<%= df.format((bookTotal + 2500)) %>
                      	<% } %>  
                	</span> 원
                </b>
            </div>

            <!--결제 버튼 -->
            <div class="row justify-content-end" style="padding-top:5%; padding-bottom:5%;">
                <input type="button" class="btn5" id="payBtn" value="결제하기">
            </div>

        </div>
        
        <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
        <script>
        	var bookTotal = <%= bookTotal %>;
        	var allPoint = <%= user.getmBandi_Point() %>;
        </script>
        
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
        
    </body>
	
</html>