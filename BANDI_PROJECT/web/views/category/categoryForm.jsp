<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.bandi.model.vo.*,java.util.*"%>
<%@ page import="com.semi.bandi.model.vo.*" %>
<%@ page import="java.util.*" %>
<%
	@SuppressWarnings("unchecked")
	ArrayList<Category> array = (ArrayList<Category>)session.getAttribute("CategoryList1");

	@SuppressWarnings("unchecked")
	ArrayList<Category> rateBook = (ArrayList<Category>)session.getAttribute("CategoryList3");	


	for(int i=0; i <array.size(); i++) array.get(i).toString();
	
	Book[] bookArray = (Book[])session.getAttribute("categoryRec");
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>category form</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=request.getContextPath()%>/resources/css/admin/bootstrap.min.css" rel="stylesheet">
        <script src="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="<%=request.getContextPath()%>/resources/css/category/category.css?ver=3" rel="stylesheet">
        <link rel="stylesheet"
			href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
		<script src ="<%=request.getContextPath()%>/resources/js/main/owl.carousel.js"></script>
		<link href = "<%=request.getContextPath()%>/resources/css/main/owl.carousel.css" rel ="stylesheet">
		<link href = "<%=request.getContextPath()%>/resources/css/main/owl.theme.default.css" rel = "stylesheet">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gugi">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gaegu">
     
</head>
<body>
	<%@include file ="../common/Header.jsp" %>
       	<!-- Design for Category Banner -->
		<div class ="w3-wide" style ="background-image: url(<%=request.getContextPath()%>/resources/images/eventBanner/back4.jpg); padding-bottom:20px; padding-top:20px; border-bottom: 5px ridge #5F4B8B; border-top: 5px ridge #5F4B8B;  height: 100px;">
		</div>
		<br>
  		
  		<!-- Content All BOX -->
        <div class ="w3-content" style="max-width:1100px; margin-top:10px;margin-bottom:10px">
        	   <div class ="w3-row">
        	   		<!-- Left Item Box -->
	        	   <div class="w3-col m3 jg">
						<ul class="leftbar leftdiv" style="min-width: inherit;">
							<li><span id="A%" class="gSearch">문학</span>
								<ul>
									<li><span id="A1" class="gSearch">&nbsp;&nbsp;&nbsp; 소설</span></li>
									<li><span id="A2" class="gSearch">&nbsp;&nbsp;&nbsp; 시</span></li>
									<li><span id="A3" class="gSearch">&nbsp;&nbsp;&nbsp; 에세이</span></li>
								</ul></li>
							<li><span id="B%" class="gSearch">인문</span>
								<ul>
									<li><span id="B1" class="gSearch">&nbsp;&nbsp;&nbsp; 역사/문화</span></li>
									<li><span id="B2" class="gSearch">&nbsp;&nbsp;&nbsp; 종교</span></li>
									<li><span id="B3" class="gSearch">&nbsp;&nbsp;&nbsp; 심리</span></li>
								</ul></li>
							<li><span id="C%" class="gSearch">과학</span>
								<ul>
									<li><span id="C1" class="gSearch">&nbsp;&nbsp;&nbsp; 기술/공학</span></li>
									<li><span id="C2" class="gSearch">&nbsp;&nbsp;&nbsp; 컴퓨터/IT</span></li>
								</ul></li>
							<li><span id="D%" class="gSearch">취미</span>
								<ul>
									<li><span id="D1" class="gSearch">&nbsp;&nbsp;&nbsp; 가정(요리)</span></li>
									<li><span id="D2" class="gSearch">&nbsp;&nbsp;&nbsp; 운동(건강)</span></li>
									<li><span id="D3" class="gSearch">&nbsp;&nbsp;&nbsp; 여행</span></li>
									<li><span id="D4" class="gSearch">&nbsp;&nbsp;&nbsp; 음악(대중문화)</span></li>
									<li><span id="D5" class="gSearch">&nbsp;&nbsp;&nbsp; 스포츠</span></li>
								</ul></li>
							<li><span id="E%" class="gSearch">교육</span>
								<ul>
									<li><span id="E1" class="gSearch">&nbsp;&nbsp;&nbsp; 어린이/청소년</span></li>
									<li><span id="E2" class="gSearch">&nbsp;&nbsp;&nbsp; 참고서(초/중/고)</span></li>
								</ul></li>
							<li><span id="F%" class="gSearch">사회</span>
								<ul>
									<li><span id="F1" class="gSearch">&nbsp;&nbsp;&nbsp; 정치/사회</span></li>
									<li><span id="F2" class="gSearch">&nbsp;&nbsp;&nbsp; 경제/경영</span></li>
								</ul></li>
						</ul>
						<br>
						<img src="/BANDI/resources/images/eventBanner/cats.jpg" style="width:95%; height:250px;">
					</div>
	        	   
	        	   <!-- Right Item Box -->
	        	   <div class ="w3-col m9">
	        	   		
	        	   		<!-- Category Title -->
	        	   		<div class="w3-display-container">
	        	   			<img src="/BANDI/resources/images/eventBanner/cabk.png" style="width:100%; height:250px;">
	        	   			<h1 class= "w3-display-topleft jg" style ="color: snow; padding-left:20px; padding-top: 20px;">문학</h1>
	        	   			<h1 class= "w3-display-middle jg" style ="color: snow; padding-left:20px;">소설</h1>
	        	   		</div> <br>

						<!-- Category Wood owl-carousel -->
	        	   		<div class="w3-display-container">
	        	   			<img src="/BANDI/resources/images/eventBanner/wood.jpg" style="width:100%; height:400px; border-top: 2px solid #5F4B8B; border-bottom: 2px solid #5F4B8B;">
	        	   			<div class="loop owl-carousel owl-theme w3-display-middle" id ="bandirecommend" style="padding-left:10px; padding-right: 10px;">
							<% for(int i = 0; i < bookArray.length; i++) { %>
							 <div class="item">
							          <img src ="<%=request.getContextPath()%>/resources/bookimage/<%=bookArray[i].getmImagePath()%>?ver=1" class ="owl_carousel_img_sheet w3-hover-shadow" 
							          id="<%=bookArray[i].getmISBN()%>" onclick="imageEvent(this);">
							        </div>
							    <% } %>
      						</div>
      						<h3 class ="w3-display-bottomright jg" style = "color:black; padding-right: 20px;">이번주 최신 도서!</h3>
	        	   		</div>
	        	   		
	        	   		<br>
	        	   		
	        	   		<div class ="w3-center w3-padding-32">
				          	<div class="first-container share">
				            	  <h1><span id="one">T</span><span>O</span><span>P</span><span>3</span><span>!</span></h1>
				          	</div>
				      	</div>
	        	   		
	        	   		<!-- Rank Book -->
	        	   		<%for(int j = 0; j < rateBook.size(); j++) { %>
	        	   		<div class="w3-row" style="margin-top:30px; border:3px dashed #5F4B8B;">
	        	   			<div class ="w3-col l4 w3-center">
	        	   				<img src ="<%=request.getContextPath()%>/resources/bookimage/<%=rateBook.get(j).getcImage()%>" 
	        	   				class ="rankImage userbookimg" id ="" name="<%=rateBook.get(j).getcISBN()%>">
	        	   			</div>
	        	   			
	        	   			<div class ="w3-col l8 w3-center">
	        	   				<span style ="font-size: 4em; font-family: 'Gaegu'"><%=rateBook.get(j).getcTitle()%></span> <br>
	        	   				<span style ="font-family :'Gaegu'; font-size:1.5em; color:darkslategray;">[<%=rateBook.get(j).getcWriter()%>]</span> 
	        	   				
	        	   				<br>
	        	   				<br>
	        	   				<% String temp = rateBook.get(j).getcIntroduce(); 
	        	   				if(temp.length() > 200){temp = temp.substring(0,197) + "...";} %>
	        	   				<span style ="font-size: 1.3em; font-family: 'Gaegu'"><%=temp%></span> <br>
	        	   			</div>
	        	   		</div>
	        	   		<%} %>
	        	   </div>
        	   </div>
        </div> 
        
        <!-- Display Books  -->
        <div class ="w3-content" style="max-width:1100px; margin-top:10px;margin-bottom:10px">
        		<!-- Display Button for Order -->
     	   		<div class ="w3-row" style ="margin-top:30px; padding-left:20px;">
     	   			<div class ="w3-col l3 m4 s4" style ="padding:15px;">
       	   		<button class='thick1 TAGbutton' 
         				id = "cRecent" name ="" value="최신" onclick="orderBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">최신순</b></button>
        			</div>
        			
        			<div class ="w3-col l3 m4 s4" style ="padding:15px;">
       	   		<button class='thick2 TAGbutton' 
         				id = "cTitle" name ="" value="최신" onclick="orderBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">제목순</b></button>
        			</div>
        			
        			<div class ="w3-col l3 m4 s4" style ="padding:15px;">
         			<button class='thick3 TAGbutton' 
         				id = "cWriter" name ="" value="최신" onclick="orderBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">작가순</b></button>
        			</div>
        			
        			<div class ="w3-col l3 m4 s4" style ="padding:15px;">
         			<button class='thick4 TAGbutton' 
         				id = "cBS" name ="" value="최신" onclick="orderBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">베스트셀러</b></button>
        			</div>
       			</div>
        </div>
        
		<footer>
			<%@include file ="../common/Footer.jsp" %>
		</footer>
		
        <script>
        
        $(function(){
    		$('#cRecent').addClass('thick1Ck');
    	});
        
        function orderBtn(id)
        {
        	var order;
        	switch(id)
        	{
        		case "cRecent": order= "RE"; break;
        		case "cTitle": order= "TI"; break;
        		case "cWriter": order= "WR"; break;
        		case "cBS": order= "BS"; break;
        		default:
        			order = "RE";
        	}
        	
        	orderByBook(order);
        }
        
        function orderByBook(order)
    	{
    		$cRecent = $('#cRecent');
    		$cTitle  = $('#cTitle');
    		$cWriter = $('#cWriter');
    		$cBS    = $('#cBS');
    		
    		if($cRecent.hasClass('thick1Ck') == true) $cRecent.removeClass('thick1Ck');
    		if($cTitle.hasClass('thick2Ck') == true) $cTitle.removeClass('thick2Ck');
    		if($cWriter.hasClass('thick3Ck') == true) $cWriter.removeClass('thick3Ck');
    		if($cBS.hasClass('thick4Ck') == true) $cBS.removeClass('thick4Ck');
    		
    		switch(order)
    		{
    			case "RE": $cRecent.addClass('thick1Ck'); break;
    			case "TI": $cTitle.addClass('thick2Ck'); break;
    			case "WR": $cWriter.addClass('thick3Ck'); break;
    			case "BS": $cBS.addClass('thick4Ck'); break;
    		}
    		
    		/* Order Array [HanStar] */
    		$.ajax({
    			url: "/BANDI/sortCategory.do",
    			type: "POST",
    			data:{"category":order},
    			success: function(data){
    				// Change Array by Data
    			},
    			error: function(){
    				alert('error');
    			}
    		});
    	}
        
        jQuery(document).ready(function($) {
            $('.loop').owlCarousel({
              center: false,
              items: 2,
              loop: true,
              margin: 40,
              autoplay:true,
              autoplayTimeout: 2000,
              autoplayHoverPause:true,
              responsive:{
                
                100 : {
                  items : 1
                },

                400 : {
                  items : 2
                },

                600: {
                  items : 3
                },
                
                1100: {
                  items: 3
                }, 
              }
            }); 

            
          });
        </script>
</body>
</html>