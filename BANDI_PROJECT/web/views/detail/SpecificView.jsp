<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi.bandi.model.vo.*" %>
<!DOCTYPE html>
<% 
	User user= (User)session.getAttribute("user");
	int uId = -1;
	String uName = "";
	if(user!=null) uId = user.getmUser_UID();
	if(user!=null) uName = user.getmName();
%>
<html>
<head>
<title>상세보기</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/detail/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href = "<%=request.getContextPath()%>/resources/css/detail/owl.carousel.css" rel ="stylesheet">
    <link href = "<%=request.getContextPath()%>/resources/css/detail/owl.theme.default.css" rel = "stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
    <script src="<%=request.getContextPath()%>/resources/js/detail/owl.carousel.min.js"></script>
<title>Insert title here</title>
</head>
<style>
   
    a:hover{
        text-decoration: none;
    }
    a:link{
        text-decoration: none;
    }
    .owl-carousel {
        margin:0;
        padding:0;
        }
    #carouselPicture{
        width:200px;
        height:200px;
    }
    .row{
        outline: 1px solid gray;
        width: 1120px;
        max-width: none !important;
    }

    #choice{
        background-color: lightgray;
        padding: 10px 50px 10px 70px;
    }
    #menu ul li{
        list-style: none;
        color : black;
        float: left;
        vertical-align: middle;
        text-align: center;
        font-size : 25px;
        
    }
    .menuLink{
        text-decoration: none;
        color:black;
        display: block;
        font-size: 25px;
        font-weight: bold; 
        
     
    }
    .menuLink:hover{
        color: lightslategrey;
    }
   
    .more {
        display:block;
        width: 55px;
        height: 16px;
    
    }

    .blind {
        position: absolute;
        overflow: hidden;
        clip: rect(0 0 0 0);
        margin: -1px;
        width: 1px;
        height: 1px;
    }

    .more:hover, .close:hover {
         cursor:pointer;
    }

    .close {
        display:block;
        width: 42px;
        height: 16px;
        background-position: -166px -78px;
    }

    .boardTitle{
        font-weight: bold;
    }
    
    .more{
        color: orange;
    }
    
    #modalButton{
        color :limegreen;
        text-decoration: underline;
        font-weight :bold;
        float: right;
    }
    
    .modal-title{
    	color :limegreen;
    }
    
    #reviewTitle, #reviewContent{
    	resize : none;
    	
    }
    
    .modalBody1, .modalBody2{
    	position: relative;

    }
    .modalBody1 span{
    	position: absolute;
    }
    
    .modalBody2 span{
    	position: absolute;	
    }
    
    #titleCounter{
    	background-color:tomato;
 		border-radius: 0.5em;
 	 	padding: 0.1em 0.1em;
	 	font-size: 1em;
    }
    
    #contentCounter{
    	background-color:dodgerblue;
 		border-radius: 0.5em;
 	 	padding: 0.1em 0.1em;
	 	font-size: 1em;
    }
    
    .starRating a{
    	color : lightgray;
    	font-size : 20px;
    }
    .starRating a.star {
    	color : limegreen;
    }  
    
    
</style>
<body>
    <article class="container"> 
    <div class="container-fluid">
        <form>
        <div class="row" id="bookName" >
            <span style="font-size: 1.5em">시를 잊은 그대에게</span><br>
            <span>공대생을 울린 시 강의</span><br>
            <span><a href="#">정재찬</a> 지음 | <a href="#">휴머니스트</a> 펴냄 | 출간일 : 2015-06-15</span>
        </div>  
    
        <div class="row" id="bookP" >
            <div class="col-xs-2" name="bookPicture">
                <img class="img-responsive" alt="Responsive image" id="bookPicture"src="../practice/img/뇌자극 JAVA.jpg">
            </div> 
            <div class="col-xs-4" name="bookPrice">
                <i class="fa fa-star-o"></i><span >베스트 셀러 10위(문학)</span><br><br>
                <i class="fa fa-krw"></i><span><s>15000원</s></span><br>
                <i class="fa fa-krw" style="color:orangered"></i><span style="color :orangered">[10%할인] 13,500원</span><br>
                <i class="fa fa-krw"></i><span>[5%적립]750포인트</span><br><br>
                <input type="number" max="100" min="1" value="1" step="1"><br><br>
                <button class="btn btn-info" onclick="shopping-basket();">장바구니</button>
                <button class="btn btn-success" onclick="buy();">바로구매</button>
                <button class="btn btn-danger" onclick="dibs();">찜</button>
            </div>
        </div>
        
        <div class="row" id="choice" >     
                <ul class="nav nav-pills nav-justified">
                    <li><a class="menuLink" onclick="move('bookContent')">책 소개 </a></li>
                    <li><a class="menuLink" onclick="move('bookIndex')">목차</a></li>
                    <li><a class="menuLink" onclick="move('bookWriter')">저자소개 </a></li>
                    <li><a class="menuLink" onclick="move('bookReview')">독자리뷰</a></li>
                </ul>  
        </div >

        <div class="row" id="bookInfo">
            <p class="boardTitle">품목정보</p>
            <span>페이지 | 300쪽 <br> 판형/무게 | 145x200m <br> ISBN 213178132 | 123132</span>
        </div>

        <div class="row" id="bookField">
            <p class="boardTitle">관련분야</p>
            <span>국내도서 > 문학 > 소설/시 > 한국시 > 한국시 일반</span>
        </div>

        <div class="row" id="bookIndex">
            <p class="boardTitle">목차</p> 
            <span class="more" id="indexButton" style="float: right;" onclick="index();">더보기+</span><br> 
            <span class="hide" id="bookIndex1">
                	머리말
                 1. 가난한 갈대의 사랑노래
               		 어떻게 사랑이 변하니? 신경림 〈갈대〉
                	가난과 사랑은 숨길 수 없다 신경림 〈가난>
            </span>     
        </div>

        <div class="row" id="bookContent">
            <p class="boardTitle">책 소개</p> 
            <span class="more" id="introButton" style="float: right;" onclick="intro();">더보기+</span><br>
            <span class="hide" id="boodIntro">
                “눈물이 고일 정도로 감동받고, 소름 끼칠 정도로 감탄했다!”
                	그저 입시를 위해 문학 참고서로 시를 배워 온 당신. 껍데기는 가라고 사람만이 희망이라고 아무리 외쳐 봐야, 내 몸 뉘일 방 한 칸 없고, 열정을 불사르겠다는데도 부르는 곳은 없으며, 부장님은 퇴근 무렵 보고서를 내던지고, 오늘밤에도 월급은 통장을 스치운다. 그래도 우리 마음만은 가난하지 말자고, 〈죽은 시인의 사회〉 속 키팅 교수를 꿈꾸며 메마른 심장의 상징 공대생들과 함께 시를 읽기 시작한 사람이 있다. 한양대학교 국어교육학과 정재찬 교수는 때로는 지나간 유행가를 흥얼거리고, 때로는 누군가의 추억이 된 영화를 보고, 때로는 어떤 말보다 가슴을 후비는 욕 한 마디를 시 구절에 덧붙이면서 우리 시대를 풍미한 최고의 현대시들을 학생들과 함께 읽었다. 그렇게 낡은 교과서 속 시 지문은 공대생마저 눈물짓게 할 가슴을 적시는 불후의 명시로 되살아났다. 한 번쯤 그렁그렁 가슴에 고인 그리움이 왈칵 쏟아지는 그 순간, 시는 찾아오고, 청춘은 다시 시작된다. 기쁜 우리 젊은 날 좌절한 그대여, 지금은 바로 진짜 시를 만날 시간이다.   
           </span>
        </div>
        
        <div class="row" id="bookWriter">
            <p class="boardTitle">저자소개</p> 
            <span class="more" id="writerButton" style="float: right;" onclick="writer();">더보기+</span><br>
            <span class="hide" id="writerIntro">
                “눈물이 고일 정도로 감동받고, 소름 끼칠 정도로 감탄했다!”
                	그저 입시를 위해 문학 참고서로 시를 배워 온 당신. 껍데기는 가라고 사람만이 희망이라고 아무리 외쳐 봐야, 내 몸 뉘일 방 한 칸 없고, 열정을 불사르겠다는데도 부르는 곳은 없으며, 부장님은 퇴근 무렵 보고서를 내던지고, 오늘밤에도 월급은 통장을 스치운다. 그래도 우리 마음만은 가난하지 말자고, 〈죽은 시인의 사회〉 속 키팅 교수를 꿈꾸며 메마른 심장의 상징 공대생들과 함께 시를 읽기 시작한 사람이 있다. 한양대학교 국어교육학과 정재찬 교수는 때로는 지나간 유행가를 흥얼거리고, 때로는 누군가의 추억이 된 영화를 보고, 때로는 어떤 말보다 가슴을 후비는 욕 한 마디를 시 구절에 덧붙이면서 우리 시대를 풍미한 최고의 현대시들을 학생들과 함께 읽었다. 그렇게 낡은 교과서 속 시 지문은 공대생마저 눈물짓게 할 가슴을 적시는 불후의 명시로 되살아났다. 한 번쯤 그렁그렁 가슴에 고인 그리움이 왈칵 쏟아지는 그 순간, 시는 찾아오고, 청춘은 다시 시작된다. 기쁜 우리 젊은 날 좌절한 그대여, 지금은 바로 진짜 시를 만날 시간이다.   
           </span>
        </div>

        <div class="row" id="bookReview">
        	<p class="boardTitle">독자리뷰<a id="modalButton" href="javascript:checkLogin('<%=uId%>');">리뷰쓰기</a></p> 
        	<!-- 누르면 모달 창 띄울꺼임 -->
            <span class="more" id="reviewButton" style="float: right;" onclick="review();">더보기+</span><br>
            <span class="hide" id="boodReview">
                “눈물이 고일 정도로 감동받고, 소름 끼칠 정도로 감탄했다!”
                	그저 입시를 위해 문학 참고서로 시를 배워 온 당신. 껍데기는 가라고 사람만이 희망이라고 아무리 외쳐 봐야, 내 몸 뉘일 방 한 칸 없고, 열정을 불사르겠다는데도 부르는 곳은 없으며, 부장님은 퇴근 무렵 보고서를 내던지고, 오늘밤에도 월급은 통장을 스치운다. 그래도 우리 마음만은 가난하지 말자고, 〈죽은 시인의 사회〉 속 키팅 교수를 꿈꾸며 메마른 심장의 상징 공대생들과 함께 시를 읽기 시작한 사람이 있다. 한양대학교 국어교육학과 정재찬 교수는 때로는 지나간 유행가를 흥얼거리고, 때로는 누군가의 추억이 된 영화를 보고, 때로는 어떤 말보다 가슴을 후비는 욕 한 마디를 시 구절에 덧붙이면서 우리 시대를 풍미한 최고의 현대시들을 학생들과 함께 읽었다. 그렇게 낡은 교과서 속 시 지문은 공대생마저 눈물짓게 할 가슴을 적시는 불후의 명시로 되살아났다. 한 번쯤 그렁그렁 가슴에 고인 그리움이 왈칵 쏟아지는 그 순간, 시는 찾아오고, 청춘은 다시 시작된다. 기쁜 우리 젊은 날 좌절한 그대여, 지금은 바로 진짜 시를 만날 시간이다.   
           </span>
        </div>
        
    	<!-- 리뷰 페이징  -->
        <div class="row">
        	<a class="pagePrev"><i class="fa fa-angle-left" style="font-weight: bold"></i></a>
        	<strong>
        		<span class="pageCur">1</span>
        	</strong>
        	<a class="pageNext"><i class="fa fa-angle-right" style="font-weight: bold"></i></a>
        </div>
        
        <!-- 독자 리뷰 모달 창 -->
    	<!-- Modal -->
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
		          		<!-- 왜 이럴까  -->
		          		&nbsp;&nbsp;&nbsp;<span id="contentCounter">###</span>	
		          	</div>
		      
		          	
		        </div>
		        <div class="modal-footer" style="text-align:center;">
		       		<button type="button" class="btn btn-success" id="reviewEnroll">등록</button>	 
		         	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>        
		<!-- 캐러셀 부분 -->
        <div class="row">
            <div class="owl-carousel">
                <img id="carouselPicture" src="http://cfile25.uf.tistory.com/image/2711C13D5805FE99214C15" />
                <img id="carouselPicture" src="http://cfile1.uf.tistory.com/image/240B353D5805FE9A2760D9" />
                <img id="carouselPicture" src="http://cfile26.uf.tistory.com/image/247EEA3D5805FE9A31302E" />
            </div>
        </div>
        
    </div>  
	</form>
    </article>
    
    <script>
   
    
    
    /* 회전 목마 */
    $('.owl-carousel').owlCarousel({
    items:2,
    loop:true,
    center:true 
    });
	
    //접기, 더보기
    function index(){
        $('#bookIndex1').toggleClass("hide");
        if($('#indexButton').text() == "더보기+"){
            $('#indexButton').text("접기-");
        }
        else{
            $('#indexButton').text("더보기+");
        }
    }

    function intro(){
        $('#boodIntro').toggleClass("hide");
        if($('#introButton').text() == "더보기+"){
            $('#introButton').text("접기-");
        }
        else{
            $('#introButton').text("더보기+");
        }
    }
    
    function review(){
        $('#boodReview').toggleClass("hide");
        if($('#reviewButton').text() == "더보기+"){
            $('#reviewButton').text("접기-");
        }
        else{
            $('#reviewButton').text("더보기+");
        }
    }
    
    function writer(){
        $('#writerIntro').toggleClass("hide");
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
    
    //로그인했는지 체크하기 맞으면 리뷰 작성 모달창을 띄우겠다
    function checkLogin(id){
    	if(id == -1){
    		alert('로그인한 회원만 사용 가능합니다');
    		
    	}
    	else{
    		$('#reviewModal').modal();
    	}
    }
   
    //모달창 제목과 본문 내용의 글자수 제한하기 
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
    
    
    //별점 기능
    $('.starRating a').on('click', function(){ 	
    	$('.starRating').children('a').removeClass('star');
    	$(this).addClass('star').prevAll('a').addClass('star');
    
    });
    
    //리뷰 등록 버튼 기능 
    $('#reviewEnroll').on('click', function(){
    	$.ajax({
    		url : "detail.show",
    		date : {rate : $('.star').length,
    				reviewTitle : $('#reviewTitle').val(),
    				reviewContent : $('#reviewContent').val()},
    		}
    		type : "post",
    		success : function(){
    			alert("리뷰 등록에 성공하셨습니다");
    			location.reload();
    		}, error : function(){
    			alert("리뷰 등록에 실패하셨습니다");
    		}
    	});
    });
    
   
    </script>
</body>
</html>