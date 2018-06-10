<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi.bandi.model.vo.*" %>
<!DOCTYPE html>
<% 
	User user = (User)session.getAttribute("user"); 
	if(user == null) response.sendRedirect(request.getContextPath() + "/views/common/errorPage.jsp");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/bootstrap.min.css?ver=1">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/sb-admin-2.min.css?ver=1">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/font-awesome.min.css?ver=1" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
<script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js?ver=1"></script>
<script src ="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js?ver=1"></script>
<script src ="<%=request.getContextPath()%>/resources/js/admin/metisMenu.min.js?ver=1"></script>
<script src ="<%=request.getContextPath()%>/resources/js/admin/sb-admin-2.min.js?ver=1"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gugi">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gaegu">

<style>
	.font-header{
		font-family: 'Gugi', sans-serif;
		font-style: italic;
	}
	
	figure {
		width: 100%;
		height: 320px;
		margin: 0;
		padding: 0;
		background: #fff;
		overflow: hidden;
	}
	
	  .hover14 figure {
		position: relative;
	}
	.hover14 figure::before {
		position: absolute;
		top: 0;
		left: -75%;
		z-index: 2;
		display: block;
		content: '';
		width: 50%;
		height: 100%;
		background: -webkit-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,.3) 100%);
		background: linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,.3) 100%);
		-webkit-transform: skewX(-25deg);
		transform: skewX(-25deg);
	}
	.hover14 figure:hover::before {
		-webkit-animation: shine .75s;
		animation: shine .75s;
	}
	@-webkit-keyframes shine {
		100% {
			left: 125%;
		}
	}
	@keyframes shine {
		100% {
			left: 125%;
		}
	}
	
	img{
	  padding:1%;
	  width: 100%; height:100%;
	}
	
	.card {
	  color: #d4cd96;
	  font-family: 'Fira Sans', sans-serif;
	  height: 100%;
	  left: 0;
	  position: absolute;
	  top: 0;
	  -webkit-transform-origin: 100% 50%;
	          transform-origin: 100% 50%;
	  -webkit-transform-style: preserve-3d;
	          transform-style: preserve-3d;
	  width: 100%;
	  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	  transition: -webkit-transform 0.6s cubic-bezier(0.49, 0.23, 0.58, 0.49);
	  transition: transform 0.6s cubic-bezier(0.49, 0.23, 0.58, 0.49);
	  transition: transform 0.6s cubic-bezier(0.49, 0.23, 0.58, 0.49), -webkit-transform 0.6s cubic-bezier(0.49, 0.23, 0.58, 0.49);
	}
	.card.flipped {
	  -webkit-transform: translateX(-100%) rotateY(-180deg);
	          transform: translateX(-100%) rotateY(-180deg);
	}
	
	.card-front,
	.card-back {
	  -webkit-backface-visibility: hidden;
	          backface-visibility: hidden;
	  background: repeating-linear-gradient(135deg, rgba(0, 0, 0, 0.3), transparent 1px, rgba(0, 0, 0, 0.3) 2px);
	  background-size: 3px 3px;
	  background-color: #302f34;
	  border-radius: 1px;
	  box-shadow: 0px -6px 8px 0px rgba(0, 0, 0, 0.1), 0px 6px 8px 0px rgba(0, 0, 0, 0.1), 6px 0px 8px 0px rgba(0, 0, 0, 0.1), -6px 0px 8px 0px rgba(0, 0, 0, 0.1);
	  cursor: pointer;
	  height: 100%;
	  left: 0;
	  padding: 5%;
	  position: absolute;
	  top: 0;
	  width: 100%;
	}
	
	.card-back {
	  -webkit-transform: rotateY(180deg);
	          transform: rotateY(180deg);
	}
	.card-back .layer {
	  background: repeating-linear-gradient(135deg, rgba(76, 71, 31, 0.3), transparent 1px, rgba(76, 71, 31, 0.3) 2px);
	  background-size: 3px 3px;
	  background-color: #d4cd96;
	  color: #302f34;
	  height: 100%;
	  position: relative;
	  width: 100%;
	}
	.card-back .layer:after {
	  background: linear-gradient(135deg, rgba(0, 0, 0, 0.2), transparent);
	  content: '';
	  display: block;
	  height: 100%;
	  left: 0;
	  position: absolute;
	  top: 0;
	  width: 100%;
	}
	.card-back .layer .top,
	.card-back .layer .bottom {
	  left: 8%;
	  position: absolute;
	  z-index: 1;
	}
	.card-back .layer .top {
	  top: 12%;
	}
	.card-back .layer .bottom {
	  bottom: 12%;
	}
	.card-back .layer h2, .card-back .layer h3, .card-back .layer h4 {
	  font-weight: 400;
	  margin: 2px 0;
	}
	.card-back .layer h2 {
	  font-size: 18px;
	  font-weight: 500;
	  text-transform: uppercase;
	}
	.card-back .layer h3 {
	  font-size: 16px;
	}
	.card-back .layer h4 {
	  font-size: 16px;
	  font-style: italic;
	}
	
	.card-front .layer {
	  -webkit-backface-visibility: hidden;
	          backface-visibility: hidden;
	  display: flex;
	  flex-direction: column;
	  height: 100%;
	  justify-content: center;
	  position: relative;
	  width: 100%;
	}
	.card-front .layer h1 {
	  font-size: 32px;
	  font-weight: 400;
	  letter-spacing: -2px;
	  margin: 0 auto;
	  padding: 6px 18px 4px;
	  text-align: center;
	}
	.card-front .layer .corner {
	  -webkit-backface-visibility: hidden;
	          backface-visibility: hidden;
	  border-right: 2px solid #d4cd96;
	  border-top: 2px solid #d4cd96;
	  height: 12px;
	  position: absolute;
	  width: 12px;
	}
	.card-front .layer .corner:nth-of-type(1) {
	  right: 0;
	  top: 0;
	}
	.card-front .layer .corner:nth-of-type(2) {
	  left: 0;
	  top: 0;
	  -webkit-transform: rotateZ(-90deg);
	          transform: rotateZ(-90deg);
	}
	.card-front .layer .corner:nth-of-type(3) {
	  bottom: 0;
	  left: 0;
	  -webkit-transform: rotateZ(180deg);
	          transform: rotateZ(180deg);
	}
	.card-front .layer .corner:nth-of-type(4) {
	  bottom: 0;
	  right: 0;
	  -webkit-transform: rotateZ(90deg);
	          transform: rotateZ(90deg);
	}
	
	.card-wrapper {
	  height: 171.7647058824px;
	  max-width: 420px;
	  -webkit-perspective: 600px;
	          perspective: 600px;
	  position: relative;
	  margin-left:20px;
	  width: 100%;
	  transition: -webkit-transform 1s;
	  transition: transform 1s;
	  transition: transform 1s, -webkit-transform 1s;
	}
	
	.informText{
	 	margin-top: 10px;
	 	margin-bottom: 10px;
	}
	
	.myButt {
	  outline: none;
	  border: none;
	  padding: 20px;
	  display: block;
	  margin: 50px auto;
	  cursor: pointer;
	  font-size: 20px;
	  background-color: transparent;
	  position: relative;
	  border: 2px solid #fff;
	  transition: all 0.5s ease;
	  -webkit-transition: all 0.5s ease;
	  -moz-transition: all 0.5s ease;
	  -o-transition: all 0.5s ease;
	  -ms-transition: all 0.5s ease;
	}
	
	.one {
	  border-color: black;
	  overflow: hidden;
	  color: black;
	}
	.one .insider {
	  background-color: #fff;
	  width: 100%;
	  height: 20px;
	  position: absolute;
	  left: -135px;
	  transform: rotateZ(45deg);
	  -webkit-transform: rotateZ(45deg);
	  -moz-transform: rotateZ(45deg);
	  -o-transform: rotateZ(45deg);
	  -ms-transform: rotateZ(45deg);
	}
	.one:hover {
	  background-color: #5F4B8B;
	  border-color: #fff;
	  color: #fff;
	}
	.one:hover .insider {
	  transition: all 0.3s ease;
	  -webkit-transition: all 0.3s ease;
	  -moz-transition: all 0.3s ease;
	  -o-transition: all 0.3s ease;
	  -ms-transition: all 0.3s ease;
	  left: 135px;
	}
	
</style>

<title>반디 추천</title>
</head>
<body>
	<div id="wrapper">
		<%@include file ="adminNav.jsp" %>
		
		<div id="page-wrapper">
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header font-header">추천 BOOK 10!</h1>
                </div>
            </div>
            
  		<div class="panel-body">
            <div class= "col-lg-8" style ="border-right: 1px dotted purple">
            	 <div class ="row">
            		<div class ="hover14 col-lg-3">
      					<figure><img id ="img1" onclick="getInfo(name);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img2" onclick="getInfo(name);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img3" onclick="getInfo(name);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img4" onclick="getInfo(name);"/></figure>
				    </div>
            	</div>
            	
            	<div class ="row" style="margin-top:50px;">
            		<div class ="hover14 col-lg-3">
      					<figure><img id ="img5" onclick="getInfo(name);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img6" onclick="getInfo(name);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img7" onclick="getInfo(name);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img8" onclick="getInfo(name);"/></figure>
				    </div>
            	</div>
            	
            	<div class ="row" style="margin-top:50px;">
            		<div class ="hover14 col-lg-3">
      					<figure><img id ="img9" onclick="getInfo(name);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img10" onclick="getInfo(name);"/></figure>
				    </div>
				    
				    
            	</div>
            </div>
            
            <div class ="col-lg-4">
            	<div class ="row">
            		<div class='card-wrapper'>
					  <div class='card' data-toggle-class='flipped'>
					    <div class='card-front'>
					      <div class='layer'>
					        <h1>관리자</h1>
					        <div class='corner'></div>
					        <div class='corner'></div>
					        <div class='corner'></div>
					        <div class='corner'></div>
					      </div>
					    </div>
					    <div class='card-back'>
					      <div class='layer'>
					        <div class='top'>
					          <h2>BANDI 관리자</h2>
					        </div>
					        <div class='bottom'>
					          <h3>
					            Name:
					            <span><%=user.getmName()%></span>
					          </h3>
					          <h3>
					            Email:
					            <span><%=user.getmEmail()%></span>
					          </h3>
					          <h3>
					            Phone:
					            <span><%=user.getmPhone()%></span>
					          </h3>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
            	</div>
            	
            	<div class ="row" style ="margin-top: 50px; margin-left: 20px; margin-right :50px; border :3px dotted #5F4B8B;" >
            	
             		<div class ="col-lg-12 informText">
             			제목 : <span id ="inTitle"></span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			ISBN : <span id ="inISBN"> </span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			 장르 : <span id ="inGenre"></span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			 작가 : <span id ="inWriter"></span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			 페이지 : <span id ="inPage"></span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			 가격 : <span id ="inPrice"></span>
             		</div>
            	</div>
            	
            	<div class ="row">
             			<button class='myButt one' onclick="changeBtn();">
							<div class='insider'></div>
								CHANGE
						</button>
             	</div>
            </div>
          </div>       
		</div>
	</div>
	<script>
	$(function(){
		$.ajax({
			url : "/BANDI/getRecBooks.find",
			type: "POST",
			success: function(data){
				var imagePath = "<%=request.getContextPath()%>/resources/bookimage/";
				$('#img1').attr('src',imagePath + data[0].mImagePath);
				$('#img1').attr('name',data[0].mISBN);
				
				$('#img2').attr('src',imagePath + data[1].mImagePath);
				$('#img2').attr('name',data[1].mISBN);
				
				$('#img3').attr('src',imagePath + data[2].mImagePath);
				$('#img3').attr('name',data[2].mISBN);
				
				$('#img4').attr('src',imagePath + data[3].mImagePath);
				$('#img4').attr('name',data[3].mISBN);
				
				$('#img5').attr('src',imagePath + data[4].mImagePath);
				$('#img5').attr('name',data[4].mISBN);
				
				$('#img6').attr('src',imagePath + data[5].mImagePath);
				$('#img6').attr('name',data[5].mISBN);
				
				$('#img7').attr('src',imagePath + data[6].mImagePath);
				$('#img7').attr('name',data[6].mISBN);
				
				$('#img8').attr('src',imagePath + data[7].mImagePath);
				$('#img8').attr('name',data[7].mISBN);
				
				$('#img9').attr('src',imagePath + data[8].mImagePath);
				$('#img9').attr('name',data[8].mISBN);
				
				$('#img10').attr('src',imagePath + data[9].mImagePath);
				$('#img10').attr('name',data[9].mISBN);
			},
			error : function(data){
				alert('erorr');
			}
		});
	});
	
	function getInfo(name)
	{
		$.ajax({
			url: "/BANDI/getRecInfo.get",
			type:"POST",
			data: {ISBN:name},
			success: function(data)
			{
				if(data.error == "error"){} // GO TO ERROR PAGE
				
				$('#inTitle').text(data.mTitle);
				$('#inISBN').text(data.mISBN);
				$('#inGenre').text(data.mGenreCode);
				$('#inWriter').text(data.mWriterName);
				$('#inPage').text(data.mPage);
				$('#inPrice').text(data.mPrice);
			},
			error: function(data)
			{	
			}
		});
	}
	
	function changeBtn()
	{
		var text  = $('#inTitle').text();
		
		if(text == "" || text == null)
		{
			alert('책을 선택하셔야 합니다.');
		}
		else
		{
			// MODAL OPEN
			
		}
	}
		
	</script>
	
	<script>
	 (function () {
		    let card  = document.getElementsByClassName('card')[0],
		        moved = 0,
		        interval;

		    if (!card) return;
		    
		    card.addEventListener('click', function (event) {
		        clearInterval(interval);
		        card.style.transform = '';
		        
		        // Do not flip the card if the user is trying to
		        // tap a link.
		        if (event.target.nodeName === 'A') {
		            return;
		        }
		        
		        let cName   = card.getAttribute('data-toggle-class');
		        let toggled = card.classList.contains(cName);
		        card.classList[toggled ? 'remove' : 'add'](cName);
		    });
		    
		    interval = setInterval(function () {
		        moved = moved ? 0 : 10;
		        card.style.transform = 'translateY(' + moved + 'px)';
		    }, 1500);
		})();
	</script>
</body>
</html>