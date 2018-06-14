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
        
        <!-- 결제  -->
        <script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
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
		                <h3><b><i class="fas fa-credit-card fa-lx"></i>&nbsp;&nbsp;주문 / 결제</b></h3>
		            </div>
		
		            <!-- 01. 주문 상품 목록 -->
		            <div class="d-flex align-items-center" style="padding-top:5%;">
		               <b style="color:rgb(132, 141, 197); font-size: 20pt;">01</b>&nbsp;&nbsp;&nbsp;<b>주문 상품 목록</b>
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
			                            <td class="text-left tdBook" style="vertical-align:middle;">
			                            	<a href = "<%=request.getContextPath()%>/detail.show?ISBN=<%= cartList.get(i-1).getIsbn()%>" style="font-size:12pt;">
			                            		<img id="bookImg<%= i %>" class="bookImg" src="<%=request.getContextPath()%>/resources/bookimage/<%= cartList.get(i-1).getImage() %>" alt="<%= cartList.get(i-1).getTitle() %>" style="margin-right:5%; margin-left:5%;">
			                            		<% if (cartList.get(i-1).getTitle().length() > 17) {%>
			                            			<%=cartList.get(i-1).getTitle().substring(0, 17) %>...
			                            		<% } else { %>
			                            			<%=cartList.get(i-1).getTitle() %>
			                            		<% } %>
		                            		</a>
			                            	<input type="hidden" id="bookUID" value="<%= cartList.get(i-1).getBookUID() %>">
			                            </td>
			                            <td class="tdPrice" id="sale<%= i %>" style="vertical-align:middle;">
			                            	<span class="onePrice"><%= df.format(cartList.get(i-1).getPrice())%></span> 원
			                            </td>
			                            <td class="tdQuan" style="vertical-align:middle;">
			                            	<span class="bookQuan"><%= cartList.get(i-1).getBookQuantity() %></span>
			                            </td>
			                            <td class="tdPrice tdTotal" id="quan<%= i %>" style="vertical-align:middle;">
			                            	<span class="bookPrice"><%= df.format(cartList.get(i-1).getPrice() * cartList.get(i-1).getBookQuantity()) %></span> 원
			                            </td>
			                        </tr>
		                    	<% 	} %>
		                    </tbody>
		                </table>
		            </div>
		            
		            <div class="row">
		                <p>상품 변경을 원하시면 &nbsp;&nbsp; <input type="button" class="btn6" id="returnBtn" value="장바구니가기"></p>
		            </div>
		            
		            <div class="row" style="padding-top:2%;">
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
		                <b style="color:rgb(132, 141, 197); font-size: 20pt;">02</b>&nbsp;&nbsp;&nbsp;<b>배송지 정보</b>
		            </div>
		            <div class="row" style="padding-top:2%;">
		                <table class="table table-bordered deliveryTb">
		                    <tr>
		                        <th style="vertical-align:middle;">주문자 정보</th>
		                        <td class="text-left" style="padding-left:3%;" colspan="4"><%= orderUser.getmName() %>&nbsp;&nbsp;|&nbsp;&nbsp;<%= orderUser.getmEmail() %>&nbsp;&nbsp;|&nbsp;&nbsp;<%= orderUser.getmPhone() %></td>
		                    </tr> 
		                    <tr>
		                        <th style="vertical-align:middle;">배송 방법</th>
		                        <td class="text-left" style="padding-left:3%;" colspan="4"><input type="radio" name="delivery" class="delivery" id="delivery1" value="basic" checked="checked"><label for="delivery1">&nbsp;&nbsp;[국내]일반택배</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="delivery" class="delivery" id="delivery2" value="store"><label for="delivery2">&nbsp;&nbsp;편의점배송</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="delivery" class="delivery" id="delivery3" value="foreign"><label for="delivery3">&nbsp;&nbsp;해외배송</label></td>
		                    </tr>  
		                    <tbody class="basicUserTB"> 
		                        <tr>
		                            <th rowspan="4" style="vertical-align:middle;">배송지 정보</th>
		                            <td class="text-left" style="padding-left:3%;" colspan="4"><input type="radio" name="addr" class="addr" id="memD" value="basicUser" checked="checked"><label for="memD">&nbsp;&nbsp;회원정보동일</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="addr" class="addr" id="newD" value="newUser"><label for="newD">&nbsp;&nbsp;새로입력</label></td>
		                        </tr>   
		                        <tr>
		                            <td style="vertical-align:middle;"><b>받으실 분</b></td>
		                            <td class="text-left" style="padding-left:3%;" colspan="3"><%= user.getmName() %></td>
		                        </tr> 
		                        <tr>
		                            <td style="vertical-align:middle;"><b>휴대폰</b></td>
		                            <td class="text-left" style="padding-left:3%;">
		                            	<%= user.getmPhone() %>
		                            </td>
		                        </tr> 
		                        <tr>
		                            <th style="vertical-align:middle;">주소</th>
		                            <td class="text-left" style="padding-left:3%;"><%= user.getmAddress().replace("|", " ") %></td> 
		                        </tr>  
		                        <tr>
		                            <th style="vertical-align:middle;">택배기사 메세지</th>
		                            <td class="text-left" style="padding-left:3%; vertical-align: middle;" colspan="4"><input type="text" id="msg1" size="80" placeholder="배송시 유의사항 등 택배회사 직원에게 전달하실 내용을 입력하세요." disabled></td>
		                        </tr>  
		                        <tr>
		                            <th style="vertical-align:middle;">전달 메세지</th>
		                            <td class="text-left" style="padding-left:3%; vertical-align: middle;" colspan="4"><input type="text" id="msg2" size="80" placeholder="상품을 받는 분께 전달하실 내용을 입력하세요." disabled></td>
		                        </tr>         
		                    </tbody>
		                    <tbody class="newUserTB"> 
		                        <tr>
		                            <th rowspan="6" style="vertical-align:middle;">배송지 정보</th>
		                            <td class="text-left" style="padding-left:3%;" colspan="4"><input type="radio" name="addr" class="addr" id="memD_new" value="basicUser"><label for="memD_new">&nbsp;&nbsp;회원정보동일</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="addr" class="addr" id="newD_new" value="newUser"><label for="newD_new">&nbsp;&nbsp;새로입력</label></td>
		                        </tr>  
		                       	<tr>
		                            <td style="vertical-align:middle;"><b>받으실 분</b></td>
		                            <td class="text-left" style="padding-left:3%;" colspan="3"><input type="text" id="nameText" size="15">&nbsp;&nbsp;(10자 내외 입력)</td>
		                        </tr> 
		                        <tr>
		                            <td style="vertical-align:middle;"><b>휴대폰</b></td>
		                            <td class="text-left" style="padding-left:3%;">
		                                <select name="userPh" id="userPh1">
		                                    <option value="010">010</option>
		                                    <option value="019">019</option>
		                                    <option value="011">011</option>
		                                </select>&nbsp;-&nbsp;<input type="text" id="userPh2" size="4">&nbsp;-&nbsp;<input type="text" id="userPh3" size="4">
		                            </td>
		                        </tr> 
		                        <tr>
		                            <th rowspan="3" style="vertical-align:middle;">주소</th>
		                            <td colspan="3" class="text-left" style="padding-left:3%;"><input type="text" id="stamp" size="15" placeholder="우편번호">&nbsp;&nbsp;&nbsp;<input type="button" class="btn8" id="addrSearch" value="주소 찾기"></td> 
		                        </tr> 
		                        <tr>
		                            <td colspan="3" class="text-left" style="padding-left:3%;"><input type="text" id="addr1" size="70" placeholder="주소"></td>
		                        </tr> 
		                        <tr>
		                            <td colspan="3" class="text-left" style="padding-left:3%;"><input type="text" id="addr2" size="70" placeholder="상세주소"></td>
		                        </tr> 
		                        <tr>
		                            <th style="vertical-align:middle;">택배기사 메세지</th>
		                            <td class="text-left" style="padding-left:3%; vertical-align: middle;" colspan="4"><input type="text" id="msg1_new" size="80" placeholder="배송시 유의사항 등 택배회사 직원에게 전달하실 내용을 입력하세요." disabled></td>
		                        </tr>  
		                        <tr>
		                            <th style="vertical-align:middle;">전달 메세지</th>
		                            <td class="text-left" style="padding-left:3%; vertical-align: middle;" colspan="4"><input type="text" id="msg2_new" size="80" placeholder="상품을 받는 분께 전달하실 내용을 입력하세요." disabled></td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		
		            <!-- 03. 할인 정보 -->
		            <div class="d-flex align-items-center" style="padding-top:5%;">
		                <b style="color:rgb(132, 141, 197); font-size: 20pt;">03</b>&nbsp;&nbsp;&nbsp;<b>할인 정보</b>
		            </div>
		            <div class="row" style="padding-top:2%;">
		                <table class="table table-bordered">
		                    <tr>
		                        <th style="vertical-align:middle;">포인트(적립금)</th>
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
		            <!-- <div class="d-flex align-items-center" style="padding-top:5%;">
		                <b style="color:rgb(132, 141, 197); font-size: 20pt;">04</b>&nbsp;&nbsp;&nbsp;<b>결제 정보</b>
		            </div>
		            <div class="row" style="padding-top:2%;">
		                <table class="table table-borderless" style="background:rgb(239, 239, 239);">
		                    <tr>
		                        <th class="text-center">신용카드</th>
		                        <td style="text-align:left;"><input type="radio" name="pay" id="card1"><label for="card1">&nbsp;&nbsp;신용카드(일반)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="card2"><label for="card2">&nbsp;&nbsp;제휴 신용카드</label></td>
		                    </tr>
		                    <tr>
		                        <th class="text-center">간편결제</th>
		                        <td style="text-align:left;"><input type="radio" name="pay" id="pay1" checked="checked"><label for="pay1">&nbsp;&nbsp;카카오페이</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="pay2"><label for="pay2">&nbsp;&nbsp;PAYCO</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="pay3"><label for="pay3">&nbsp;&nbsp;네이버페이</label></td>
		                    </tr>
		                    <tr>
		                        <th class="text-center">현금결제</th>
		                        <td style="text-align:left;"><input type="radio" name="pay" id="cart1"><label for="cart1">&nbsp;&nbsp;실시간 계좌이체</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay" id="cart2"><label for="cart2">&nbsp;&nbsp;무통장 입금</label></td>
		                    </tr>
		                    <tr>
		                        <th class="text-center">기타결제</th>
		                        <td style="text-align:left;"><input type="radio" name="pay" id="other1"><label for="other1">&nbsp;&nbsp;휴대폰 결제</label></td>
		                    </tr>
		                </table>
		            </div> -->
		
		            <!-- 최종 결제 금액 표시 -->
		            <div class="row text-right" style="padding-top:5%;">
		                <div class="col-2 text-right" style="display:inline-block; border-bottom-style:solid; border-bottom-color:rgb(210, 115, 143); width:150px;">
		                    <h5 style="color:rgb(210, 115, 143);"><b>최종 결제 금액</b></h5>
		                </div>
		            </div>
		            <div class="row text-right" style="padding-top:1%;">
		                <b>
		                	<span id="payTotal"><% if (bookTotal > 30000 || cartList == null) { %><%= df.format(bookTotal) %><% } else { %><%= df.format((bookTotal + 2500)) %><% } %>  
		                	</span> 원
		                </b>
		            </div>
		
		            <!--결제 버튼 -->
		            <div class="row text-right" style="padding-top:5%; padding-bottom:5%;">
		                <input type="button" class="btn5" id="payBtn" value="결제하기">
		            </div>
				</div>
			</div>
        </div>
        
        <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
        <script>
        	var bookTotal = <%= bookTotal %>;
        	var allPoint = <%= user.getmBandi_Point() %>;
        	var email = "<%= user.getmEmail() %>";
        	var name = "<%= user.getmName() %>";
        	var tel = "<%= user.getmPhone() %>";
        	var address = "<%= user.getmAddress() %>";
        </script>
        
        <footer>
        	<%@include file ="../common/Footer.jsp" %>
        </footer>
        
    </body>
	
</html>