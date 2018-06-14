<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
<script src="<%=request.getContextPath()%>/resources/js/member/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/member/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}
.active {
    background-color: #4CAF50;
}
.form-signin{
	max-width: 1000px;
  	padding: 30px;
  	margin: 0 auto;
  	margin-left: 30%;
  	margin-right: auto;
}
img {
	margin-left:20%; 
	margin-top:-5%; 
	margin-bottom:7%; 
	cursor: pointer;
}
.button1 {
	width:300px;
	height:40px;
	margin-top:10%;
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
</head>
<body>
<ul>
  	<li><a href="<%=request.getContextPath()%>/views/member/jfindUser.jsp">아이디 찾기</a></li>
  	<li><a href="<%=request.getContextPath()%>/views/member/jfindPwd.jsp">비밀번호 찾기</a></li>
  	<li style="float:right"><a class="active" href="<%=request.getContextPath()%>/views/member/jlogin.jsp">로그인</a></li>
</ul>
<form class="w3-container form-signin" id="findUser">
	<div class="w3-row w3-col m6">
		<img src="<%=request.getContextPath() %>/resources/images/member/logo.jpg" onclick="location='<%=request.getContextPath()%>/index.jsp'"/>
		<h2>아이디 찾기</h2>
	  	<p>이름과 생년월일로 아이디를 찾을 수 있습니다.</p>
		<hr />
		<div class="w3-col" id="findclass">
		  	<p><input class="w3-input w3-border w3-hover-red" type="text" placeholder="이름" id="findName"></p>
		  	<p><input class="w3-input w3-border w3-hover-blue" type="text" placeholder="생년월일" id="findBirth" readonly></p>
		  	<p><input class="w3-input w3-border w3-hover-green" type="text" placeholder="전화번호 '-' 빼고 입력해주세요." id="findPhone"></p>
		</div>
		<div class="w3-center">
			<button class="w3-button w3-block w3-teal" id="findId" type="button">아이디 찾기</button>
		</div>
  	</div>
</form>
<br /><br />
<div class="w3-container" style="display:none" id="findEmail">
	<div class="w3-content" style="max-width:500px">
	    <div id="cEmail" class="w3-center menu w3-padding-48 w3-card" style="display: block;">
	    	<h5>회원님의 아이디</h5><br />
	      	<p class="w3-text-grey">회원님의 가입된 이메일은</p><br />
	      	<div id=finalEmail>
	      		
	      	</div><br />
	      	<p class="w3-text-grey">입니다.</p>
	    </div>
	    <br /><br />
	    <div class="w3-center">
			<button class="w3-button w3-block w3-teal" type="button" name="button" onclick="location='<%=request.getContextPath()%>/views/member/jfindPwd.jsp'">비밀번호 찾기</button>
		</div>
	</div>
</div>
<script>
	$(function() {
		$("#findBirth").datepicker({
			changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+0d"
		});
	});
	
	var reg_name = /^[가-힣]{2,10}$/; 
	var reg_phone = /^(01[016789]{1})\d{3,4}\d{4}$/;
	 
	$('#findId').on('click', function(){
		if($('#findName').val() == ""){
			alert("이름을 입력해주세요.");
		}
		else if($('#findBirth').val() == ""){
			alert("생년월일을 입력해주세요.");
		}
		else if($('#findPhone').val() == ""){
			alert("전화번호를 입력해주세요.");
		}
		else {
			$('#findclass').submit();
		}
		event.preventDefault();
	});
	
	$('#findclass').submit(function(event){
		var name = $('#findName').val();
		var phone = $('#findPhone').val();
		var birthArr = $('#findBirth').val().split('-');
		var birth = birthArr[0]+birthArr[1]+birthArr[2];			 
		var birthMin = 19000101;
		var birthMax = 20180101;
		
		if(!reg_name.test(name)){
       	 	alert("이름은 한글 2~10글자까지 입력해주세요");	
        }
		else if(birth < birthMin && birthMax < birth){
       	 alert("올바른 생년월일을 입력해주세요");
		}
		else if(!reg_phone.test(phone)){
            alert("올바른 휴대폰 번호를 입력해주세요");
        }
		else {
			$.ajax({
				url: '/BANDI/findEmail.me',
				type: 'post',
				data: {
					name: $('#findName').val(),
					birth: $('#findBirth').val(),
					phone: $('#findPhone').val()
				},
				success: function(data){
					if(data != "error"){
						$('#findUser').remove();
						$('#findEmail').css('display', 'block');
						$('#finalEmail').append("<strong>" + data +"</strong>");
					} else {
						alert("회원 정보가 없습니다.");
					}
				},
			});
		}
		event.preventDefault();
	});
</script>
</body>
</html>



























