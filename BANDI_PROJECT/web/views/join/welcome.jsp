<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html><head><title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.button {
    position: relative;
    background-color: #4CAF50;
    border: none;
    font-size: 18px;
    color: #FFFFFF;
    padding: 20px;
    width: 200px;
    text-align: center;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    text-decoration: none;
    overflow: hidden;
    cursor: pointer;
}

.button:after {
    content: "";
    background: #f1f1f1;
    display: block;
    position: absolute;
    padding-top: 300%;
    padding-left: 350%;
    margin-left: -20px !important;
    margin-top: -120%;
    opacity: 0;
    transition: all 0.8s
}

.button:active:after {
    padding: 0;
    margin: 0;
    opacity: 1;
    transition: 0s
}
</style>
</head>
<body>
	<div class="w3-container w3-white">
		<br /><br />
		<div class="w3-center">
			<img src="<%=request.getContextPath() %>/resources/images/member/bandi.png" onclick="location='<%=request.getContextPath() %>/index.jsp'" style="cursor:pointer;" />
	  	</div>
	  	<br /><br />
	  	<div class="w3-center">
	    	<h2>회원 가입을 환영합니다!!!!</h2>
	    	<p>반딧불이 책방의 직원들은 당신의 회원가입을 진심으로 기뻐합니다.</p>
	    	<p>자주 들러주세요.</p>
	    	<p>문의 사항은 : 01033333333 로 문의주세요.</p>
	  	</div>
	  	<br /><br />
	  	<div class="w3-center w3-bar">
  			<button class="button w3-button w3-black" onclick="location='<%=request.getContextPath()%>/views/member/jlogin.jsp'">로그인</button>
  			<button class="button w3-button w3-teal" onclick="location='<%=request.getContextPath() %>/index.jsp'">메인 화면</button>
		</div>
	</div>
</body>
</html>