<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.bandi.model.vo.Book" %>
<%@ page import="java.util.*" %>
<%@ page import="com.semi.bandi.model.vo.mainVo.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	String[] array = (String[])session.getAttribute("eventBanner");
	Book[] bookArray = (Book[])session.getAttribute("recommend");
	
	// Best Seeler Book
	Book[] bestSellerArray = (Book[])session.getAttribute("bestSeller");
	
	// 4 * 2 => Show 8 Books
	final int bestSellerHalfCount = 4;
	
	// Rating Area
	RankedBookInfo rateBook = (RankedBookInfo)session.getAttribute("ratedBook");
	
	@SuppressWarnings("unchecked")
	ArrayList<CommentUserInfo> comArray = (ArrayList<CommentUserInfo>)session.getAttribute("commentArray");
   
	// If Wrong Access This Page. Move to Index.jsp
	 if(array == null || bookArray == null || rateBook == null || comArray ==null){
		 response.sendRedirect(request.getContextPath() + "/views/common/errorPage.jsp");
	  }
%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gugi">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gaegu">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gamja Flower">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/main/Maincss.css?ver=3">
<script src ="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
<script src ="<%=request.getContextPath()%>/resources/js/main/owl.carousel.js"></script>
<script src ="<%=request.getContextPath()%>/resources/js/main/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href = "<%=request.getContextPath()%>/resources/css/main/owl.carousel.css" rel ="stylesheet">
<link href = "<%=request.getContextPath()%>/resources/css/main/owl.theme.default.css" rel = "stylesheet">
<script src ="<%=request.getContextPath()%>/resources/js/main/main.js?ver=1" type="text/javascript"></script>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/ico/bandicon.ico">

<title>반딧불이 책방</title>
<style>

@media only screen and (min-width: 1651px) {
	.bannerImage{
		display:block;
		border: 2px solid black;
	}
}

@media only screen and (max-width: 1650px) {
	.bannerImage{
		display:none;	
	}
}
</style>
</head>
<body>
	 <header>
		<!-- Here is Need to Header Line -->
		<%@include file ="../common/Header.jsp" %>
	</header>
	
	<div class ="w3-wide" style ="background-image: url(<%=request.getContextPath()%>/resources/images/eventBanner/back6.jpg); padding-bottom:20px; padding-top:20px; border-bottom: 5px ridge #5F4B8B; border-top: 5px ridge #5F4B8B;">
	<div class="w3-content" style="max-width:900px; margin-top:10px;margin-bottom:10px">
  
  <div id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li class="item1 active"></li>
      <li class="item2"></li>
      <li class="item3"></li>
      <li class="item4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
	<%if(array != null) { %>
      <div class="item active">
        <img src="<%=request.getContextPath()%>/resources/images/eventBanner/<%=array[0]%>" name ="eventBanner">  
      </div>

      <div class="item">
        <img src="<%=request.getContextPath()%>/resources/images/eventBanner/<%=array[1]%>" name ="eventBanner">
      </div>
    
      <div class="item">
        <img src="<%=request.getContextPath()%>/resources/images/eventBanner/<%=array[2]%>" name ="eventBanner">
      </div>

      <div class="item">
        <img src="<%=request.getContextPath()%>/resources/images/eventBanner/<%=array[3]%>" name ="eventBanner">
      </div>
  <%} %>
    </div>

    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" role="button">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	   
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      
	    </a>
	  </div>
	</div>
	</div>
	
	<!-- recommend by BANDI START -->
	<div class ="w3-row w3-container">
      <div class ="w3-center w3-padding-64">
              <div class="first-container share">
              <h1><span id="one">반</span><span>디</span><span>의</span> <span>추</span><span>천</span></h1>
              </div>
      </div>
  	</div>
  	  	
  	<div class="w3-content" style="max-width:1300px; margin-top:10px; margin-bottom:10px; border-top: 3px solid #5F4B8B;
  		border-bottom:3px solid #5F4B8B;">
    
	    <div class="loop owl-carousel owl-theme" id ="bandirecommend">
	    <% if(bookArray != null) { %>
	    <% for(int i = 0; i < bookArray.length; i++) { %>
	        <div class="item">
	          <img src ="<%=request.getContextPath()%>/resources/bookimage/<%=bookArray[i].getmImagePath()%>?ver=1" class ="owl_carousel_img_sheet w3-hover-shadow" name ="recommendBooks" 
	          id="<%=bookArray[i].getmISBN()%>" onclick="imageEvent(this);">
	        </div>
	    <% } } %>
      	</div>
  	</div>
	<!-- recommend by BANDI END -->
	
	<!--  BEST SELLER START TITLE -->
	<div class ="w3-row w3-container">
      <div class ="w3-center w3-padding-64">
          <div class="first-container share">
              <h1><span id="one">베</span><span>스</span><span>트</span><span>셀</span><span>러</span></h1>
          </div>
      </div>
  	</div>
	<!--  BEST SELLER END TITLE -->
	
	<!-- CATEGORY BUTTON START [BESTSELLER] -->
	<div class="w3-content" style="max-width:1100px; margin-top:10px;margin-bottom:40px; text-align: center;">
	    <div class ="w3-row">
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick1 TAGbutton' 
	          id = "bsLiterary" name ="bsLiterary" value="문학" onclick="bestSellBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">문학</b></button>
	      </div>
	
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick2 TAGbutton'
	           id = "bsEdu" name ="bsEdu" value ="교육" onclick="bestSellBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">교육</b></button>
	      </div>
	
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick3 TAGbutton' 
	          id ="bsHobby" name = "bsHobby" value ="취미" onclick="bestSellBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">취미</b></button>
	      </div>
	      
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick4 TAGbutton' 
	          id ="bsHuman" name ="bsHuman"  value ="인문" onclick="bestSellBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">인문</b></button>
	      </div>
	
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick5 TAGbutton' 
	          id = "bsSociety" name ="bsSociety" value ="사회" onclick="bestSellBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">사회</b></button>
	      </div>
	      
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick6 TAGbutton' id ="bsScience" name ="bsScience" value ="과학"  onclick="bestSellBtn(id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">과학</b></button>
	      </div>
	    </div>
  	</div>
	<!-- CATEGORY BUTTON END [BESTSELLER] -->
	
	<!-- Event Banner -->
	<img src ="<%=request.getContextPath()%>/resources/images/eventBanner/flower.png"
	style ="width:10em; height:30em; right:120px; position:absolute;" class ="bannerImage">
	
	<!--  Best Seller Book[VIEW] START -->
	<div class="w3-content" style="max-width:1100px; margin-top:10px;margin-bottom:10px">
		<div class="w3-row">
		  <% if(bestSellerArray != null) { %>
		  <% for(int i = 0; i < bestSellerArray.length/2; i++) { %>
			  <div class="w3-col l3 s6">
			  	<div class="w3-container sellerDiv1" style = "margin-bottom: 50px;">
			  		<div class="w3-display-container">
			  			<img src="<%=request.getContextPath()%>/resources/bookimage/<%=bestSellerArray[i].getmImagePath()%>?${RANDOM_STRING}" style="width:100%; height:350px;" class = "w3-hover-opacity">
			  			<span class="w3-display-topleft Sparking_Grape rank_number"><%=i+1%></span>
			  			<div class="w3-display-hover w3-display-middle">      
                  			<a href="<%=request.getContextPath()%>/detail.show?ISBN=<%=bestSellerArray[i].getmISBN()%>" class="main_spec_view_a"><span>상세보기</span></a>
              			</div>
			  		</div>
			  			<span class = "TypeOf_Span"><% if(bestSellerArray[i].getmTitle().length() < 15){%><%=bestSellerArray[i].getmTitle()%>  <%}else{ %><%=bestSellerArray[i].getmTitle().substring(0, 9)+".."%><% } %></span><br>
            			<span class = "TAG_SPAN_PRICE_TEXT"><%=bestSellerArray[i].getmPrice()%>원</span>
            		
			  	</div>
			  		
            	<div class="w3-container sellerDiv2">
		            <div class="w3-display-container">
		              <img src="<%=request.getContextPath()%>/resources/bookimage/<%=bestSellerArray[i+bestSellerHalfCount].getmImagePath()%>?${RANDOM_STRING}" style="width:100%; height:350px;" class = "w3-hover-opacity">
		              <span class="w3-display-topleft Sparking_Grape rank_number"><%=i+1+bestSellerHalfCount%></span>
		              	<div class="w3-display-middle w3-display-hover">
		                  	<a href="<%=request.getContextPath()%>/detail.show?ISBN=<%=bestSellerArray[i+bestSellerHalfCount].getmISBN()%>" class="main_spec_view_a"><span>상세보기</span></a>
		              	</div>
		            </div>
		            <span class = "TypeOf_Span"><% if(bestSellerArray[i+bestSellerHalfCount].getmTitle().length() < 15){%><%=bestSellerArray[i+bestSellerHalfCount].getmTitle()%>  <%}else{ %><%=bestSellerArray[i+bestSellerHalfCount].getmTitle().substring(0, 9)+".."%><% } %></span><br>
            		<span class = "TAG_SPAN_PRICE_TEXT"><%=bestSellerArray[i+bestSellerHalfCount].getmPrice()%>원</span>
		          </div>
			  </div>
			  <%} }%>
		</div>
	</div>
	<!--  Best Seller Book[VIEW] END -->
	
	<!-- USER RECOMMEND TITLE START -->
	<div class ="w3-row w3-container">
    	<div class ="w3-center w3-padding-64">
        	<div class="first-container share">
            	<h1><span id="one">유</span><span>저</span><span>의</span> <span>추</span><span>천</span></h1>
        	</div>
    	</div>
	</div>
	
	<img src ="<%=request.getContextPath()%>/resources/images/eventBanner/bandibanner.jpg"
	style ="width:10em; height:30em; right:120px; position:absolute;" class ="bannerImage">
		
	<div class="w3-content" style="max-width:1100px; margin-top:10px;margin-bottom:40px; text-align: center;">
	    <div class ="w3-row">
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick1 TAGbutton' 
	          id = "urLiterary" name ="urLiterary" value="문학" onclick="userRecBtn(this.id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">문학</b></button>
	      </div>
	
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick2 TAGbutton'
	           id = "urEdu" name ="urEdu" value ="교육" onclick="userRecBtn(this.id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">교육</b></button>
	      </div>
	
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick3 TAGbutton' 
	          id ="urHobby" name ="urHobby" value ="취미" onclick="userRecBtn(this.id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">취미</b></button>
	      </div>
	      
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick4 TAGbutton' 
	          id ="urHuman" name ="urHuman"  value ="인문" onclick="userRecBtn(this.id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">인문</b></button>
	      </div>
	
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick5 TAGbutton' 
	          id = "urSociety" name ="urSociety" value ="사회" onclick="userRecBtn(this.id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">사회</b></button>
	      </div>
	      
	      <div class ="w3-col l2 m4 s4" style ="padding:15px;">
	          <button class='thick6 TAGbutton' id ="urScience" name ="urScience" value ="과학" onclick="userRecBtn(this.id);"><b style ="font-family: 'Gaegu'; font-size: 1.5em;">과학</b></button>
	      </div>
	    </div>
  	</div>
	<!-- USER RECOMMEND TITLE END -->
	
	<!-- USER RECOMMEND DATA START -->
	<div class="w3-content" style="max-width:1100px; margin-top:10px; margin-bottom:10px; border:3px dashed #5F4B8B;" id ="userContent">
		<div class ="w3-row">
			<div class ="w3-col l4 s12 m6 w3-center">
				<% if(rateBook != null) { %>
        		<img src ="<%=request.getContextPath()%>/resources/bookimage/<%=rateBook.getmImagePath()%>" class ="owl_carousel_img_sheet w3-hover-shadow userbookimg" id ="recUserImg" name="<%=rateBook.getmISBN()%>">
        		<%} %>
      		</div>
      		
      		<div class ="w3-col l8 s12 m6" style ="text-align: center;">
      		  <% if(rateBook != null) { %>
      			<span style ="font-size: 4em; font-family: 'Gaegu'" id ="recUserTitle"><%=rateBook.getmTitle()%></span> <br>
      			<span style ="font-family :'Gaegu'; font-size:1.5em; color:darkslategray;" id ="recUserWriter">[<%=rateBook.getWriterName() %>]</span> <br>
      		   <% } %>
      			 <div id ="startDiv" style="display: inline;">
      			 <% if(rateBook != null) {%>
      			 <%for(int i = 0; i < 10; i= i+2){ 
      			 	if(i < rateBook.getAvgPoint()) {
      			 %>      			 
      				<span class="fa fa-star checked starRate"></span> 
      			 <%}else{ %>
      			 	<span class="fa fa-star unchecked starRate"></span>
      			<%} %>
          		
          		<%} %>
          		<span style ="font-family: bold; font-size:1.5em; margin-left: 5px;"> <span style ="color:red" id ="recAvgPoint"> <%=rateBook.getAvgPoint()%></span> / 10 </span>
          		</div>
          		
          		<div class="button-container-2" style ="margin-right:20px;">
          		 
              		<span class="mas" id ="recUserPrice"><%=rateBook.getmPrice()%>원</span>
              	 <%} %>
              		<button type="button" name="Hover">
                	Price
              	</button>
            </div> 
            
            <div style ="text-align: center; margin-bottom: 20px; font-family: Gugi; font-size: 2em; margin-top:10px;">반디들의
             <b style ="color:#A35776">소리</b></div>
             <% if(comArray != null) {%>
	             <% for(int i = 0; i < comArray.size(); i++) { %>
		      		<div class = "w3-row  comment_box">
		              <div class = "w3-col l10 s10 m10 comment_id">
		              	<% String uEmail = comArray.get(i).geteMail(); String uComment = comArray.get(i).getComment_Content(); %>
		              	<% String uEmailA[] = uEmail.split("@");%>
		              	<%
		              		/* prevent from Over Flow Text  */
		              		String dot= "";
							for(int j = 0; j < uEmailA[0].length()/2 + 1; j++) dot += "*";				
							uEmailA[0] = uEmailA[0].substring(0, uEmailA[0].length()/2 + 1) + dot;
							if(uComment.length() > 29) uComment = uComment.substring(0,26) + "...";
		              	%>
		                <%=uEmailA[0]%> : <%=uComment%>
		              </div>
		              <div class ="w3-col l2 s2 m2 comment_date">
		                <%=comArray.get(i).getWritedDate()%>
		              </div> 
		            </div>
	            <% } } %>
      		</div>
		</div>
	</div>
	<!-- USER RECOMMEND DATA END -->
	<script>
		$('#recUserImg').on('click',function(){
			window.location.href = CONTEXTPATH+"/detail.show?ISBN="+$(this).attr('name');
		});
	</script>
	<!-- FOOTER START -->
	<footer>
		<%@include file ="../common/Footer.jsp" %>
	</footer>
	<!-- FOOTER END -->
</body>
</html>