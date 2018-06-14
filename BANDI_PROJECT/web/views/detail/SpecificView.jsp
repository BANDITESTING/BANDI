<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi.bandi.model.vo.*, java.util.*, com.semi.bandi.model.vo.detail.*" %>
<!DOCTYPE html>
<% 
	User cUser= (User)session.getAttribute("user");
	int uId = -1;
	String uName = "";
	String uGrade = "";
	if(cUser!=null)
	{
	 uId = cUser.getmUser_UID();
	 uName = cUser.getmName();
	 uGrade = cUser.getmGrade();
	}else
	{
		//GO TO ERROR
	}
%>
<%

	Detail detail = (Detail)request.getAttribute("detail"); 
	/* Shield  for null */
	
	if(detail == null) {
	} // go to error page.
	
	//페이징 처리에서 쓸 현제 isbn값
	String nowIsbn = detail.getIsbn();
	
	double point = 0;
	String noUser = "";
	switch(uGrade){
	case "B": point = 0.1*detail.getPrice(); break;
	case "S": point = 0.2*detail.getPrice(); break;
	case "G": point = 0.3*detail.getPrice(); break;
	case "P": point = 0.4*detail.getPrice(); break;
	case "D": point = 0.5*detail.getPrice(); break;
	default : noUser = "로그인 하시면 적립금을 보실 수 있습니다";
	}
%>

<%
	//Review nullReivew = new Review(-1,-1,"널","널",-1);
	ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
	/* if(reviewList == null){
		reviewList.add(nullReivew);
	} */
	ArrayList<Top4> top4list = (ArrayList<Top4>)request.getAttribute("top4");
%>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	System.out.print("맥스페이지"+maxPage);
	System.out.print("스타트페이지"+startPage);
	
	
	ArrayList<Review> pagingReview = (ArrayList<Review>)request.getAttribute("pagingReview"); 
%>

<html>
<head>
<title>상세보기</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/detail/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href = "<%=request.getContextPath()%>/resources/css/detail/owl.carousel.css" rel ="stylesheet">
    <link href = "<%=request.getContextPath()%>/resources/css/detail/detail.css" rel ="stylesheet">
    <link href = "<%=request.getContextPath()%>/resources/css/detail/owl.theme.default.css" rel = "stylesheet">
    <link href = "<%=request.getContextPath()%>/resources/css/detail/animate.css" rel = "stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Black+And+White+Picture|Black+Han+Sans|Dokdo|Gugi|Hi+Melody|Gamja+Flower|Jua|Poor Story|" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/detail/component.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/detail/demo.css" />
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/detail/owl.carousel.js"></script>  

<title>Insert title here</title>
</head>


<body>
	
	 <header>
		<!-- Here is Need to Header Line -->
		<%@include file ="../common/Header.jsp" %>
	</header>

    <article class="container"> 
    <div class="container-fluid">
        <div class="row" id="bookName" >
            <span id="detailTitle"><%= detail.getTitle() %></span><br>
            <span><span style="color:#1876FB"><%=detail.getWriter_name()%></span> 지음 | <span style="color:#1876FB"><%=detail.getPublisher() %></span> 펴냄 | 출간일 : <%= detail.getIssue_date() %></span>
        </div>  
    	
        <div class="row" id="bookP" >
            <div class="col-xs-3"  style="padding:0;">
                <img onclick="sizeUp();" id="bookPicture" src="<%=request.getContextPath()%>/resources/bookimage/<%=detail.getImage()%>">
            </div> 
            
            <div class="col-xs-4" id="bookPrice">
                <i class="fa fa-star-o"></i><span style="font-family:'Jua'; font-size: 20px;">오픈 기념 빵빵한 포인트</span><br><br>
                <i class="fa fa-krw" style="color:orangered"></i><span style="color :orangered; font-family:'Jua'; font-size: 20px;"><%=detail.getPrice()%>원</span><br>
                <i class="fa fa-krw"></i>
                <span style="font-family:'Jua'; font-size: 20px;">
                 	<% if(uId != -1) { %>
                 		[적립금]<%=point%>POINT
	              	<% } else { %>
	              		<%= noUser %>
	              	<% } %>
                </span><br><br>
                <input id="quantity" style="font-family:'Jua'; font-size: 20px;" type="number" max="100" min="1" value="1" step="1"><br><br>
                <i class="fa fa-plane" style="font-size:20px"></i><span style="font-family:'Jua'; font-size: 20px;">해외배송은 준비중입니다.</span><br>
                <button id="basket" class="btn btn-info" style="font-family:'Jua'; font-size: 20px;" onclick="bascketGo()">
                	장바구니
                </button>
                <button id="buyNow" class="btn btn-success" style="font-family:'Jua'; font-size: 20px;" onclick="buNowGo()">바로구매</button>
            </div>
        </div>
        
        <div class="row" id="choice" > 
        	<nav class="menu">
					<ul class="menuBar">
						<li style="display:inline" class="menuLink" ><a href="#"  onclick="move('bookInfo');">품목정보</a></li>
						<li style="display:inline" class="menuLink"><a href="#"  onclick="move('bookField');">관련분야</a></li>
						<li style="display:inline" class="menuLink"><a href="#"  onclick="move('bookContent');">책 소개</a></li>
						<li style="display:inline" class="menuLink"><a href="#"  onclick="move('bookWriter');">저자소개</a></li>
						<li style="display:inline" class="menuLink"><a href="#"  onclick="move('bookReview');">독자리뷰</a></li>
					</ul>
			</nav>    
        </div >

        <div class="row" id="bookInfo">
            <p class="boardTitle">품목정보</p>
            <span class="detailContent">페이지 | <%=detail.getPage()%>쪽<br>
            	  ISBN | <%=detail.getIsbn() %><br>           	  
            </span>
        </div>

        <div class="row" id="bookField">
            <p class="boardTitle">관련분야</p>
            <span class="detailContent"><%= detail.getOrigin() %> > <%=detail.getGenre()%> > <%=detail.getSub_genre()%></span>
        </div>
 
		<!-- ....이  -->
        <div class="row" id="bookContent">
            <p class="boardTitle">책 소개</p> 
            <span class="more" id="introButton" style="float: right;" onclick="intro();">더보기+</span><br>
            	<span class="detailContent">
            	<% if (detail.getBook_introduce().length() > 80) { %>
            	<%=detail.getBook_introduce().substring(0,80)%><span id=skipBook>.....</span>
            	<% } else { %>
            	<%=detail.getBook_introduce()%>
            	<% } %>
            	</span> 
            <span class="hide" id="bookIntro">
            	<% if (detail.getBook_introduce().length() > 80) { %>
                <%=detail.getBook_introduce().substring(80,detail.getBook_introduce().length())%>
            	<% } %>  
           </span>
        </div>
        
        <div class="row" id="bookWriter">
            <p class="boardTitle">저자소개</p> 
            <span class="more" id="writerButton" style="float: right;" onclick="writer();">더보기+</span><br>
            	<span class="detailContent">
            	<% if (detail.getWriter_introduce().length() > 80) { %>
				<%=detail.getWriter_introduce().substring(0,80)%><span id=skipWriter>.....</span>
            	<% } else { %>
            	<%=detail.getWriter_introduce()%>
            	<% } %>
            	</span> 
            <span class="hide" id="writerIntro">
	  			<% if (detail.getWriter_introduce().length() >80) { %>
                <%=detail.getWriter_introduce().substring(80,detail.getWriter_introduce().length())%>
                <% } %>  
           </span>
        </div>

        <div class="row" id="bookReview">
        	<p class="boardTitle">독자리뷰
        		<!-- 누르면 모달 창 띄울꺼임 -->
        		<% boolean isExistID= true;%>
        		<% if(reviewList != null) { %>
        			<%for(Review rev : reviewList) { %>
        					<%if(rev.getUser_uid() == uId){ isExistID = false;%>
	        					<a id="modalButton" href="#" onclick="deleteReview();" style="font-size:25px; color:#F23920">삭제하기</a>
	        					<a id="modalButton" href="#" onclick="updateReview();" style="font-size:25px; color:#6FA0BF">수정하기</a>
        					<%}%>
        			<%} %>
 			  	<%}else { %>
        				<a id="modalButton" href="#" onclick="checkLogin();" style="font-size:25px">리뷰쓰기</a>
        		<%} %>	
        		<%if(isExistID){ %>
        			<a id="modalButton" href="#" onclick="checkLogin();" style="font-size:25px">리뷰쓰기</a>
        		<%} %>		
        		
        	</p> 
        
            
            
            <div id="bookReviews"> 
            	<span class="detailContent">
            	<span class="reviewPaging">       	
              	<% if(pagingReview != null){
              		for(Review list : pagingReview){  %>
	              		<div style="border-bottom:2px solid gray">
	              		 	<p class="reviewShow">
		              			<%if(list.getRateing() <= 2) {%>	
		              			<span>제목 : </span><span><%=list.getComment_title() %></span><br>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : lightgray">★</a>
		              			<a style="color : lightgray">★</a>
		              			<a style="color : lightgray">★</a>
		              			<a style="color : lightgray">★</a>
		              			<span><%= list.getName()%></span>
		              			<span><%= list.getWriteDate() %></span> <br>     
		              			<span>내용 : </span><span><%= list.getBook_comment() %></span>
		              			
		              			<%}	else if(list.getRateing() <= 4) {%>
		              			<span>제목 : </span><span><%=list.getComment_title() %></span><br>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : lightgray">★</a>
		              			<a style="color : lightgray">★</a>
		              			<a style="color : lightgray">★</a>
		              			<span><%= list.getName()%></span>
		              			<span><%= list.getWriteDate() %></span> <br>		              
		              			<span>내용 : </span><span><%= list.getBook_comment() %></span>		              	
		              			
		              			<%}	else if(list.getRateing() <= 6) {%>
		              			<span>제목 : </span><span><%=list.getComment_title() %></span><br>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : lightgray">★</a>
		              			<a style="color : lightgray">★</a>
		              			<span><%= list.getName()%></span>
		              			<span><%= list.getWriteDate() %></span> <br>
		              			<span>내용 : </span><span><%= list.getBook_comment() %></span>
		              			
		              			<%}	else if(list.getRateing() <= 8) {%>
		              			<span>제목 : </span><span><%=list.getComment_title() %></span><br>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : lightgray">★</a>
		              			<span><%= list.getName()%></span>
		              			<span><%= list.getWriteDate() %></span> <br>
		              			<span>내용 : </span><span><%= list.getBook_comment() %></span>
		              			
		              			<%}	else {%>
		              			<span>제목 : </span><span><%=list.getComment_title() %></span><br>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<a style="color : limegreen">★</a>
		              			<span><%= list.getName()%></span>
		              			<span><%= list.getWriteDate() %></span> <br>
		              			<span>내용 : </span><span><%= list.getBook_comment() %></span>
		              			<% } %>
	              			</p>
	              		</div>
              	<% } }%>
              	</span>
              	</span>
             </div>
              <!-- 동기식 독자 리뷰 페이징 처리 부분  -->
            <div style="text-align:center;">
	            <%if(maxPage != 0){ %>
				<%  if(currentPage <= 1) {  %>
				<button class="btn btn-default" disabled><i class="fa fa-angle-double-left"></i></button>
				<button class="btn btn-default" disabled><i class="fa fa-angle-left"></i></button>
				<%  } else { %>
				<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/detail.show?ISBN=<%=nowIsbn%>&currentPage=1'"><i class="fa fa-angle-double-left"></i></button>
				<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/detail.show?ISBN=<%=nowIsbn%>&currentPage=<%=currentPage - 1 %>'"><i class="fa fa-angle-left"></i></button>
				<%  } %>
				
				<% for(int p = startPage; p <= endPage; p++) {
						if(p == currentPage) {
				%>
					<button class="btn btn-default" disabled ><%= p %></button>
				<%      } else { %>
					<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/detail.show?ISBN=<%=nowIsbn%>&currentPage=<%= p %>'"><%= p %></button>
				<%      } %>
				<% } %>
					
				<%  if(currentPage >= maxPage) {  %>
				<button class="btn btn-default" disabled><i class="fa fa-angle-right"></i></button>
				<button class="btn btn-default" disabled><i class="fa fa-angle-double-right"></i></button>
				<%  } else { %>
				<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/detail.show?ISBN=<%=nowIsbn%>&currentPage=<%=currentPage + 1 %>'"><i class="fa fa-angle-right"></i></button>
				<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/detail.show?ISBN=<%=nowIsbn%>&currentPage=<%= maxPage %>'"><i class="fa fa-angle-double-right"></i></button>
				<%  } %>           	            
	           	<% }else{ %>
	           	<span style="font-family:'Poor Story'; font-size:25px">처음으로 리뷰를 남겨주세요</span>
	           	<% } %>
           	</div> 
           	
           	
           	<%--  <!-- 비동기식 페이징 처리 -->
           <div class="pageShow" style="text-align:center;">
           		<ul class="pagination">
           		 	<!-- 처음으로 가는 <<버튼  -->
				 	<li class="page-item"><a href="#"> <button class="page-link" onclick="paging(1)"><i class="fa fa-angle-double-left"></i></button> </a></li>
				 	<!-- 한칸 전으로 가는 < 버튼 -->
				 	<% if(currentPage <= 1){ %>
				 	<li class="page-item disabled"><a href="#"> <button class="page-link" onclick="pageing(<%=currentPage%>-1)"><i class="fa fa-angle-left"></i></button> </a></li>
				 	<% } else { %>
				 	<li class="page-item"><a href="#"> <button class="page-link"><i class="fa fa-angle-left"></i></button> </a></li>
				 	<% } %>
				 	
				 	<!-- 페이지 이동 버튼 -->
				 	<% for(int p = startPage; p <= endPage; p++) { %>
					 	<% if(p == currentPage) { %>	
					 		<li class="page-item disabled"><a href="#"><button class="page-link"><%= p %></button></a></li>
					 	<% } else { %>
					 		<li class="page-item"><a href="#"><button class="page-link" onclick="paging(<%= p %>)"><%= p %></button></a></li>
					 	<% } %>
					<% } %>
					
					
				 	<!-- 한칸 후로 가는 > 버튼 -->
				 	<% if(currentPage >= maxPage){ %>
				 	<li class="page-item disabled"><a href="#"> <button class="page-link"><i class="fa fa-angle-right"></i></button> </a></li>
				 	<%  } else { %>
				 	<li class="page-item"><a href="#"> <button class="page-link" onclick="paging(<%=currentPage%>+1)"><i class="fa fa-angle-right"></i></button> </a></li>
				    <% } %>
				    
				    <!-- 끝으로 가는 >>버튼  -->
				    <li class="page-item"><a href="#"> <button class="page-link" onclick="paging(<%=maxPage%>);"><i class="fa fa-angle-double-right"></i></button> </a></li>
				</ul>
           	</div> --%>
           	
           <!-- RETRY -->
           	<!-- <ul class="pagination">

				<li class="disabled"><a><<</a></li>
				
				<li class="disabled"><a><</a></li>
				
				<li class="active" disabled><a>1</a></li>
				
				<li class="goPage" data-page="2"><a>2</a></li>
				
				<li class="goPage" data-page="3"><a>3</a></li>
				
				<li class="disabled"><a>></a></li>
				
				<li class="goLastPage"><a>>></a></li>
				
			</ul>  -->

    	</div>  
      

        <!-- 이미지 확대 모달 창 -->
		  <div class="modal fade" data-backdrop="static" id="sizeUpModal" role="dialog">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">크게보기</h4>
		        </div>
		        <div class="modal-body">
		        	<img id="sizeUpPicture" src="<%=request.getContextPath()%>/resources/bookimage/<%=detail.getImage()%>">
		        </div>	
		      </div>	      
		    </div>
		  </div>    
        
        <!-- 독자 리뷰 모달 창 -->
    	<!-- 리뷰 등록 Modal -->
		  <div class="modal fade" data-backdrop="static" id="reviewModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">리뷰쓰기</h4>
		          <span><%=uName%>님의 생각을 나눌 수 있는 리뷰를 작성해 주세요!</span>
		        </div>
		        <div class="modal-body">
		        	<div>
		        		<p class="starRating">
		        			<span>별점  </span>
		        			<a href="#" class="star">★</a>
		        			<a href="#" class="star">★</a>
		        			<a href="#" class="star">★</a>
		        			<a href="#">★</a>
		        			<a href="#">★</a>
		        		</p>
		        	</div>
		          	<div class="modalBody1">
		          		<textarea name="reviewTitle" id="reviewTitle" cols="70" rows="1" 
		          		placeholder="제목은 30자 제한" maxlength="30" ></textarea>
		          		&nbsp;&nbsp;&nbsp;<span id="titleCounter">###</span>
		          	</div>
		          	
		          	<div class="modalBody2">
		          		<textarea name="reviewContent" id="reviewContent" cols="70" rows="10" 
		          		placeholder="내용은 300자 제한" maxlength="300"></textarea>
		          		&nbsp;&nbsp;&nbsp;<span id="contentCounter">###</span>	
		          	</div>
		      	
		        </div>
		        <div class="modal-footer" style="text-align:center;">
		        	
		       		<button type="button" class="btn btn-success" id="reviewEnroll" onclick="registerBtn();">등록</button>	 
		         	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>       
		  
		<!-- 독자 리뷰 수정 용 모달 창 -->
    	<!-- 리뷰 수정 Modal -->
		  <div class="modal fade" data-backdrop="static" id="updateModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">리뷰수정하기</h4>
		          <span><%=uName%>님의 생각을 나눌 수 있는 리뷰를 작성해 주세요!</span>
		        </div>
		        <div class="modal-body">
		        	<div>
		        		<p class="starRating">
		        			<span>별점  </span>
		        			<a href="#" class="star">★</a>
		        			<a href="#" class="star">★</a>
		        			<a href="#" class="star">★</a>
		        			<a href="#">★</a>
		        			<a href="#">★</a>
		        		</p>
		        	</div>
		          	<div class="modalBody1">
		          		<textarea name="updateTitle" id="updateTitle" cols="70" rows="1" 
		          		placeholder="제목은 30자 제한" maxlength="30" ></textarea>
		          		&nbsp;&nbsp;&nbsp;<span id="updateTCounter">###</span>
		          	</div>
		          	
		          	<div class="modalBody2">
		          		<textarea name="updateContent" id="updateContent" cols="70" rows="10" 
		          		placeholder="내용은 300자 제한" maxlength="300"></textarea>
		          		
		          		&nbsp;&nbsp;&nbsp;<span id="updateCounter">###</span>	
		          	</div>
		      
		          	
		        </div>
		        <div class="modal-footer" style="text-align:center;">
		       		<button type="button" class="btn btn-success" id="reviewUpdate" onclick="updateBtn();">등록</button>	 
		         	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>  
		<!-- 캐러셀 부분 -->
        <div class="row" style="padding:0">
        	<span style="font-family : Jua; color:#DA70D5; font-size:25px">BANDI BOOK BEST SELLER TOP4</span>
        	<div  id="bestBook" class="owl-carousel" >
        	<%if (top4list != null) {%>
        	<%for(Top4 list : top4list) { %>
        	  
            	<img class="detailGo" id="carouselPicture" onclick="location.href='<%= request.getContextPath() %>/detail.show?ISBN=<%=list.getIsbn() %>'"  src="<%=request.getContextPath()%>/resources/bookimage/<%=list.getImage() %>">
                                   
            <% } } %>           
            </div>	 
        </div>
        
    </div>	
    	
    	
    </article>
    
    <script>
   
    
    
    /* 회전 목마 */
  	$('.owl-carousel').owlCarousel({
    items:3,
    loop:true,
    center:true,
    nav:true,
    navText:["<span id='left' class='fa fa-chevron-left'>Previous / </span>",   "<span id='right'>&nbsp;Next<span> <span id='right' class='fa fa-chevron-right'></span>"]
    });
 	
   
	//책소개 더보기 접기
    function intro(){
        $('#bookIntro').toggleClass("hide");
        $('#skipBook').toggleClass("hide");
        if($('#introButton').text() == "더보기+"){
            $('#introButton').text("접기-");
        }
        else{
            $('#introButton').text("더보기+");
        }
    }
   
   	//작가소개 더보기 접기
    function writer(){
        $('#writerIntro').toggleClass("hide");
        $('#skipWriter').toggleClass("hide");
        if($('#writerButton').text() == "더보기+"){
            $('#writerButton').text("접기-");
        }
        else{
            $('#writerButton').text("더보기+");
        }
    }
    
    
   	
    //네비창 움직이기
    function move(divId){
    	//$('#bookContent').offset();
    	
        var offset = $("#"+divId).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
    
    //로그인한 사용자가 리뷰를 쓴 적이 없을경우 
    function checkLogin(){
    	
    	var userId = '<%=uId%>';
    	
    	if(userId == -1 || userId == '-1'){
    		if(confirm('로그인한 회원만 사용 가능합니다. 로그인 화면으로 이동하시겠습니까?'))
    			location.href="<%=request.getContextPath()%>/views/member/jlogin.jsp";
    	}
    	else{
    		$('#reviewModal').modal();
    	}
    }
   
    //로그인한 사용자가 리뷰를 쓴 경험이 있을 경우 수정창으로 
   	function updateReview(){
   		var userId = '<%=uId%>';
   		
    	if(userId == -1 || userId == '-1'){
    		if(confirm('로그인한 회원만 사용 가능합니다. 로그인 화면으로 이동하시겠습니까?'))
    			location.href="<%=request.getContextPath()%>/views/member/jlogin.jsp";
    	}
    	else{
    		$('#updateModal').modal();
    	}
    }
    
   //이미지 확대 모달창
   function sizeUp(){
	   $('#sizeUpModal').modal();
   }
    
    
    //리뷰 등록 모달창 제목과 본문 내용의 글자수 제한하기 
   	//제목 본문 글자수 제한
    $(function(){
   		$('#reviewTitle').keyup(function(){
   			var title = $(this).val();
   			$('#titleCounter').text(title.length + '/30');
   		});
   		$('#reviewTitle').keyup();
   		
   		$('#reviewContent').keyup(function(){
    		var content = $(this).val();
    		$('#contentCounter').text(content.length + '/300');
    	});
   		
   		$('#reviewContent').keyup();
   	});
    
    //리뷰 수정 모달용 
    $(function(){
   		$('#updateTitle').keyup(function(){
   			var title = $(this).val();
   			$('#updateTCounter').text(title.length + '/30');
   		});
   		$('#updateTitle').keyup();
   		
   		$('#updateContent').keyup(function(){
    		var content = $(this).val();
    		$('#updateCounter').text(content.length + '/300');
    	});
   		
   		$('#updateContent').keyup();
   	});
    //별점기능
    $('.starRating a').on('click', function(){ 	
    	$('.starRating').children('a').removeClass('star');
    	$(this).addClass('star').prevAll('a').addClass('star');
    
    });
    
 	
   
    
    //리뷰 등록 버튼 기능 
    
    function registerBtn()
    {	/* 페이지가 실행되고 나서 바로 값을 먼저 받기 때문에 user가 null이 아닐때 조건을 걸어야된다 */
    	
    	
    	<% if(user != null) { %> 
		
    	var misbn = '<%=detail.getIsbn()%>';
    	
    	var mBookUid = '<%=detail.getBook_uid()%>';
    	
    	var muserUid = '<%=uId%>';
    	
    	var muserName = '<%=uName%>';	
    	
    	var reviewTitle = $('#reviewTitle').val();
    	
    	var reviewContent = $('#reviewContent').val();
    	
    	<% } %>
    	if (reviewTitle == "" || reviewContent == ""){
    		alert('제목과 내용에는 빈 값이 들어갈 수 없습니다.');
    	}else{
	    	$.ajax({
	    		url : "/BANDI/reviewInsert.show",
	    		data : {rate : $('.star').length,
	    				isbn : misbn, // 일단 보내놓긴 해보자
						bookUid : mBookUid, 
						userUid : muserUid, 
						userName : muserName, // 일단 보내놓긴 해보자
	    				reviewTitle : reviewTitle,
	    				reviewContent : reviewContent
	    				},
	    				
	    		type : "post",
	    		success : function(data){
	    			console.log(data);
	    			if(data == "success")
	    			{
	    				alert("리뷰 등록에 성공하셨습니다");
	    				location.reload();
	    			}
	    			else if(data == "nullReview")
	    			{
	    				alert("리뷰 등록에 실패하셨습니다");
	    			}
	    		}, 
	    		error: function(request,status,error)
				{
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
	    	});
    	}
    }
    
    //리뷰 수정하기 버튼
    function updateBtn()
    {
    	//수정하기는 무조건 유저가 들어와 있기 때문에 null처리  안할꺼임 
		var misbn = '<%=detail.getIsbn()%>';
    	
    	var mBookUid = '<%=detail.getBook_uid()%>';
    	
    	var muserUid = '<%=uId%>';
    	
    	var muserName = '<%=uName%>';
    
		var updateTitle = $('#updateTitle').val();
    	
    	var updateContent = $('#updateContent').val();
    	
    	if (updateTitle == "" || updateContent == ""){
    		alert('제목과 내용에는 빈 값이 들어갈 수 없습니다.');
    	}else{
	    	$.ajax({
	    		url : "/BANDI/reviewUpdate.show",
	    		data : {rate : $('.star').length*2,
	    				isbn : misbn, // 일단 보내놓긴 해보자
	    				bookUid : mBookUid, 
	    				userUid : muserUid, 
	    				userName : muserName, // 일단 보내놓긴 해보자
	    				updateTitle : $('#updateTitle').val(),
	    				updateContent : $('#updateContent').val()
	    				},
	    		type : "post",
	    		success : function(data){
	    			if(data == "success")
	    			{
	    				alert("리뷰 수정에 성공하셨습니다");
	    				location.reload();
	    			}else
	    			{
	    				// go to error page.
	    			}
	    		}, 
	    		error: function(request,status,error)
				{
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
	    	});
    	}
    }
    
    //삭제
   	function deleteReview(){
   		var userId = '<%=uId%>'; 
		var bookUid = '<%=detail.getBook_uid()%>';
		$.ajax({
    		url : "/BANDI/reviewDelete.show",
    		data : {userUid : userId,
    				bookUid : bookUid
    		},
    		type : "post",
    		success : function(data){
    			if(data == "success")
    			{
    				alert("리뷰 삭제에 성공하셨습니다");
    				location.reload();
    			}else
    			{
    				// go to error page.
    			}
    		}, 
    		error: function(request,status,error)
			{
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
    	});
    }
    
   
  	//장바구니
   	function bascketGo(){
   		var userId = '<%=uId%>'; 
		var bookUid = '<%=detail.getBook_uid()%>';
		var bookCount = $('#quantity').val();
		
		if(userId != -1){
			$.ajax({
				url : "/BANDI/insertCart.ct",
				type : "GET",
				data : {
					userId : userId, 
					bookId : bookId,
					bookCount : bookCount
				},
				dataType : "json",
				success : function(data){
					if(data >= 1){
						if(confirm('상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?'))
			    				location.href="<%=request.getContextPath()%>/cart.ct";
					}else{
						if(confirm('상품이 이미 장바구니에 담겨있습니다. 장바구니로 이동하시겠습니까?'))
						location.href="<%=request.getContextPath()%>/cart.ct";
					}	
				}, error : function(data){
					console.log(data);
				}
			});
		}else{
			if(confirm('로그인한 회원만 사용 가능합니다. 로그인 화면으로 이동하시겠습니까?'))
				location.href="<%=request.getContextPath()%>/views/member/jlogin.jsp";
		}
  		
  	}
  	
    
    //바로구매
   	function buNowGo(){
   		var userId = '<%=uId%>'; 
		var bookUid = '<%=detail.getBook_uid()%>';
		var bookCount = $('#quantity').val();
		
		if( userId != -1){
			$.ajax({
				url : "/BANDI/insertCart.ct",
				type : "GET",
				data : {
					userId : userId,
					bookId : bookId,
					bookCount : bookCount
				},
				dataType : "json",
				success : function(data){
					location.href="<%=request.getContextPath()%>/order.ct?bookUID="+bookId;
				}, error : function(data){
					console.log(data);
				}
				
			});
		}else{
			if(confirm('로그인이 필요한 기능입니다. 로그인 페이지로 넘어가시겠습니까?')){
				location.href="<%=request.getContextPath()%>/views/member/jlogin.jsp";
			}
		}
    } 
    
   <%--  //리뷰 페이징
    function paging(currentPage){
    	$.ajax({
    		url : "/BANDI/detail.show",
    		type : "GET",
    		data : {
        		currentPage : '<%=currentPage%>'
        		},
        		dataType : "json",
        		success : function(data){
        			var review = data.pagingReview;
        			var pi = data.pi;
        			    			
        			//리뷰를 쫙 뽑아보자..
        			if(review != null){
	        			for(var list : review){
	        				var innerHtmlReivew =
	        					'<div style="border-bottom:2px solid gray">
	        						<p class="reviewShow">'+
	        							if(+list.getRateing() <= 2) {+'
	        								<span>제목 : </span><span>list.getComment_title()</span><br>
	        								<a style="color : limegreen">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<span>list.getName</span>
	        		              			<span>list.getWriteDate()</span><br>
	        		              			<span>내용 : </span><span>list.getBook_comment()</span>'+
	        							} else if(list.getRateing() <= 4) {	
	        		              			+'<span>제목 : </span><span>list.getComment_title()</span><br>
	        								<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<span>list.getName</span>
	        		              			<span>list.getWriteDate()</span><br>
	        		              			<span>내용 : </span><span>list.getBook_comment()</span>'+
	        							} else if(list.getRateing() <= 6) {+'
	        								<span>제목 : </span><span>list.getComment_title()</span><br>
	        								<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<span>list.getName</span>
	        		              			<span>list.getWriteDate()</span><br>
	        		              			<span>내용 : </span><span>list.getBook_comment()</span>'+
	        							} else if(list.getRateing() <= 8){+'
	        								<span>제목 : </span><span>list.getComment_title()</span><br>
	        								<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : lightgray">★</a>
	        		              			<span>list.getName</span>
	        		              			<span>list.getWriteDate()</span><br>
	        		              			<span>내용 : </span><span>list.getBook_comment()</span>'+
	        							} else {+'
	        								<span>제목 : </span><span>list.getComment_title()</span><br>
	        								<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<a style="color : limegreen">★</a>
	        		              			<span>list.getName</span>
	        		              			<span>list.getWriteDate()</span><br>
	        		              			<span>내용 : </span><span>list.getBook_comment()</span>'+
	        							}+
	        						</p>
	        					</div>';			
	        				$('reviewPaging').append(innerHtmlReivew);
	        			} 
	        			/* 페이징 처리  */	
	        			var currentPage = pi.currentPage;
	        			var startPage = pi.startPage;
	        			var maxPage = pi.maxPage;
	        			var endPage = pi.endPage;
	        			var listCount = pi.listCount;
	        			var limit = pi.limit;
	        			 
	        			var innerHtmlPage = 
	        				'<ul class="pagination">
	        					<li class="page-item"><a href="#"> <button class="page-link" onclick="paging(1)"><i class="fa fa-angle-double-left"></i></button></a></li>'
	        						if(currentPage <= 1){ 
	        							innerHtmlPage += '<li class="page-item disabled"><a href="#"> <button class="page-link" onclick="pageing(<%=currentPage%>-1)"><i class="fa fa-angle-left"></i></button> </a></li>';
	        						} else { 
	        							innerHtmlPage += '<li class="page-item"><a href="#"> <button class="page-link"><i class="fa fa-angle-left"></i></button> </a></li>';
	        						}
	        					for(var p = startPage; p <= endPage; p++) {
	        						if(p == currentPage) {
	        							innerHtmlPage += '<li class="page-item active"><a href="#"><button class="page-link" disabled>'+p+'</button></a></li>';
	        						} else { 
	        							innerHtmlPage += '<li class="page-item"><a href="#"><button class="page-link" onclick="paging('+p+');">'+p+'</button></a></li>';
	        						}
	        					}
	        					
	        					
	        					if(currentPage >= maxPage){
	        	                	innerHtmlPage += '<li class="page-item disabled"><button class="page-link">i class="fa fa-angle-right"></i></button></li>';
	        	                } else {
	        	                	innerHtmlPage += '<li class="page-item"><a href="#"><button class="page-link" onclick="paging('+(currentPage+1)+');"><i class="fa fa-angle-right"></i></</button></a></li>';
	        	                }
	        					
	        					 innerHtmlPage += '<li class="page-item"><a href="#"><button class="page-link" onclick="paging(+maxPage+);"><i class="fa fa-angle-double-right"></i></button></a></li>
	        		             </ul>';
	        			$('.pageShow').append(innerHtmlPage);
        			}else{
        				var innerHtmlReivew = 
        					'<span style="font-family:'Poor Story'; font-size:25px">+"처음으로 리뷰를 남겨주세요"+</span>';
        			}
        			
        		}, error : function(data){
        			console.log(data);
        		} 
    		});
    	
    }  --%>
    
    </script>
    <footer>
		<%@include file ="../common/Footer.jsp" %>
	</footer>
</body>
</html>