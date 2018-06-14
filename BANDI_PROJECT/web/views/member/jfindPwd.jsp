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
    background-color: red; /* Green */
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
<form class="w3-container form-signin" id="findPwdform">
	<div class="w3-row w3-col m6">
		<img src="<%=request.getContextPath() %>/resources/images/member/logo.jpg" onclick="location='<%=request.getContextPath()%>/index.jsp'"/>
		<h2>비밀번호 찾기</h2>
	  	<p>이름과 이메일을 확인 후, 임시 비밀번호를 만듭니다.</p>
		<hr />
		<div class="w3-col" id="findclass">
		  	<p><input class="w3-input w3-border w3-hover-red" type="text" placeholder="이름" id="findPwdName"></p>
		  	<p><input class="w3-input w3-border w3-hover-green" type="email" placeholder="Email" id="findPwdEmail"></p>
		</div>
		<div class="w3-center">
			<button class="w3-button w3-block w3-teal" id="findPwdbtn" type="button">비밀번호 찾기</button>
		</div>
  	</div>
</form>
<script>
	
	var reg_name = /^[가-힣]{2,10}$/; 
	var reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	 
	$('#findPwdbtn').on('click', function(){
		if($('#findPwdName').val() == ""){
			alert("이름을 입력해주세요.");
		} else if($('#findPwdEmail').val() == ""){
			alert("이메일을 입력해주세요.");
		} else if(!reg_name.test($('#findPwdName').val())){
			alert("이름은 한글 2~10글자까지 입력해주세요");
		} else if(!reg_email.test($('#findPwdEmail').val())){
			alert("이메일을 제대로 입력해주세요.");
		} else {
			$.ajax({
				url: '/BANDI/findPwd.me',
				type: 'post',
				data: {
					name: $('#findPwdName').val(),
					email: $('#findPwdEmail').val()
				},
				success: function(data){
					if(data == 1){
						$('#findPwdform').remove();
						alert("이메일로 임시 비밀번호를 발송했습니다. 임시 비밀번호로 로그인 후 새로운 비밀번호 변경해주세요.");
						location.href="<%=request.getContextPath()%>/views/member/jlogin.jsp";
						
					} else {
						alert("가입된 회원이 아닙니다.");
					}
				}
			});
		}
		event.preventDefault();
	});
</script>
</body>
</html>



























