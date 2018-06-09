<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/bootstrap.min.css?ver=1">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/sb-admin-2.min.css?ver=1">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/font-awesome.min.css?ver=1" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/bandiContributor.css">
    
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
</style>

<title>관리자 정보</title>
</head>
<body>
	<div id="wrapper">
		<%@include file ="adminNav.jsp" %>
		
		<div id="page-wrapper">
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header font-header">관리자 [공헌자들]</h1>
                </div>
            </div>
            
            <div class = "row">
            	<div class = "col-lg-8" style="margin-top: 300px;">
            		<ul class="fan">
						  <li>
						    <div class="flip">
						      <div class="card">
						        <div class="face front" data-bgcolor="윤석이" style ="background: #5F4B8B">
						          Front
						        </div>
						        <div class="face back">
						                       책임
						        </div>
						      </div>
						    </div>
						  </li>
						
						  <li>
						    <div class="flip">
						      <div class="card">
						        <div class="face front" data-bgcolor="주현이" style ="background: #A82743">
						          Front
						        </div>
						        <div class="face back">
						          	주임
						        </div>
						      </div>
						    </div>
						  </li>
						  <li>
						    <div class="flip">
						      <div class="card">
						        <div class="face front" data-bgcolor="학균이" style ="background: #E15E32">
						          Front
						        </div>
						        <div class="face back">
						          	기획부장
						        </div>
						      </div>
						    </div>
						  </li>
						  <li>
						    <div class="flip">
						      <div class="card">
						            <div class="face front" data-bgcolor="재연이" style ="background:  #EFA5C8">
						          Front
						        </div>
						        <div class="face back">
						          	선임
						        </div>
						      </div>
						    </div>
						  </li>
						  <li>
						    <div class="flip">
						      <div class="card">
						        <div class="face front" data-bgcolor="태원이" style ="background: orange">
						          Front
						        </div>
						        <div class="face back">
						          	주임
						        </div>
						      </div>
						    </div>
						  </li>
						
						  <li>
						    <div class="flip">
						      <div class="card">
						        <div class="face front" data-bgcolor="한결이" style ="background: #00cdff; color:black; ">  
						        </div>
						        <div class="face back">
						          	대표이사
						        </div>
						      </div>
						    </div>
						  </li>	  
					</ul>
            	</div>
            	
            	<div class = "col-lg-4" style ="margin-left: -50px;">
            		<img src="<%=request.getContextPath()%>/resources/images/common/bandi.png"/>
            	    <h1 style="margin-top: 70px;">WE ARE BANDI TEAM</h1>
            		<div class="text" style="margin-top: 200px;">
					  <p>반디 관리자 : </p>
					  <p>
					    <span class="word ultraviolet">박윤석</span>
					    <span class="word pomegranate">주현</span>
					    <span class="word orange">변학균</span>
					    <span class="word green">배태원</span>
					    <span class="word redvio">박재연</span>
					    <span class="word belize">김한결</span>
					  </p>
					</div>
            	</div>
            </div>
            
		</div>
	</div>
	<script>
		$(document).ready(function () {
		$("body").bind("touchstart", function() { /* nothing needed here, see http://stackoverflow.com/a/23012580 */ });
		$(".fan li").hover(function() {
			$(this).nextAll().each(function(i) {
				$(this).addClass("after prefix_" + (i+1));
			});
			$(this).prevAll().each(function(i) {
				$(this).addClass("before prefix_" + (i+1));
			});
		}, function() {
			$(this).nextAll().each(function(i) {
				$(this).removeClass("after prefix_" + (i+1));
			});
			$(this).prevAll().each(function(i) {
				$(this).removeClass("before prefix_" + (i+1));
			});
		});
		/* add the "flip" function */
		$(".fan li").click(function(){
			$(this).find(".card").addClass("flipped").mouseleave(function(){
				$(this).removeClass("flipped");
			});
			return false;
		});
		/* set the card's data + bgcolor */
		$(".face.front").each(function(){
			$(this).css("background",$(this).data("bgcolor"));
			$(this).html($(this).data("bgcolor"));
		});
		$("a[rel='external']").attr("target", "_blank");
	});
	</script>
	
	<script>
		  var words = document.getElementsByClassName('word');
		var wordArray = [];
		var currentWord = 0;
		
		words[currentWord].style.opacity = 1;
		for (var i = 0; i < words.length; i++) {
		  splitLetters(words[i]);
		}
		
		function changeWord() {
		  var cw = wordArray[currentWord];
		  var nw = currentWord == words.length-1 ? wordArray[0] : wordArray[currentWord+1];
		  for (var i = 0; i < cw.length; i++) {
		    animateLetterOut(cw, i);
		  }
		  
		  for (var i = 0; i < nw.length; i++) {
		    nw[i].className = 'letter behind';
		    nw[0].parentElement.style.opacity = 1;
		    animateLetterIn(nw, i);
		  }
		  
		  currentWord = (currentWord == wordArray.length-1) ? 0 : currentWord+1;
		}
		
		function animateLetterOut(cw, i) {
		  setTimeout(function() {
				cw[i].className = 'letter out';
		  }, i*80);
		}
		
		function animateLetterIn(nw, i) {
		  setTimeout(function() {
				nw[i].className = 'letter in';
		  }, 340+(i*80));
		}
		
		function splitLetters(word) {
		  var content = word.innerHTML;
		  word.innerHTML = '';
		  var letters = [];
		  for (var i = 0; i < content.length; i++) {
		    var letter = document.createElement('span');
		    letter.className = 'letter';
		    letter.innerHTML = content.charAt(i);
		    word.appendChild(letter);
		    letters.push(letter);
		  }
		  
		  wordArray.push(letters);
		}
		
		changeWord();
		setInterval(changeWord, 4000);
</script>
	
</body>
</html>