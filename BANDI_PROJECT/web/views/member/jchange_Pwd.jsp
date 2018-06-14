<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<script src="<%=request.getContextPath()%>/resources/js/member/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/member/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.sidebar {
	position: absolute;
    height: 800px;
    left: 0;
    display: block;
    padding: 20px;
    overflow-x: hidden;
    overflow-y: auto;
    background-color: #773376;
    opacity : 0.8;
    color:snow;
    border-right: 1px solid #eee;
}

#tel{
	width:50px;
    height:23;
}
</style>
</head>
<body>

<header>
	<%@include file ="../common/Header.jsp" %>
</header>
<div class="container">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="active"><a href="jmypage.jsp">My Page</a></li>
				<li class="active"><a href="jchange_Pwd.jsp">비밀번호 변경</a></li>
            	<li class="active"><a href="jdeleteUser.jsp">회원 탈퇴</a></li>
            	<li class="active"><a href="<%= request.getContextPath()%>/cart.ct">장바구니</a></li>
                <li class="active"><a href="<%= request.getContextPath()%>/check.ct">주문 상세보기</a></li>
            </ul>
        </div>
        <div role="main" class="col-xs-10 col-xs-offset-2 col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
        	<div>
            	<h1 class="h2">비밀번호 변경</h1>       
            </div>
            <hr style="width:100%; height:3px;">
            <form class="changeForm" id="current-pwd" method="post">
            	<div class="table-responsive">
                	<table class="table table-bordered" id="presentPwd">
                		<tr>
                			<td class="col-sm-2">이메일</td>
                			<td class="col-sm-8 form-group">
                   	  		  	<input type="text" style="width:350px; height:23px" id="mEmail" value="<%=user.getmEmail()%>"/>
                			</td>
                		</tr>
                		<tr>
                    		<td class="col-sm-2">비밀번호</td>
                     	    <td class="col-sm-8 form-group">
                   	  		  	<input type="password" style="width:350px; height:23px" id="mPassword">
                        	</td>
                    	</tr>
                	</table>
                	<div class="col-sm-11 text-center">
           	    		<button class="btn btn-lg btn-primary" type="button" id="pPwd">확인</button>
           			</div> <br /><br /><br />
           		</div>
           	</form>
           	<form class="changeForm" action="<%=request.getContextPath()%>/change.me" id="newPassword" method="post" style="display:none;">
                <table class="table table-bordered">
                    <tr>
                        <td class="col-sm-2">새 비밀번호</td>
                        <td class="col-sm-8 form-group">   
                        	<input type="password" style="width:350px; height:23px" id="newPwd1" name="mPassword">
                        	<input type="hidden" name="userId" value="<%=user.getmEmail()%>">
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-2">새 비밀번호 확인</td>
                        <td class="col-sm-8 form-group">
                        	<input type="password" style="width:350px; height:23px" id="newPwd2" name="newPwd2">
                        </td>
                    </tr>
                </table>
                <br /><br />
                <div class="border:1px solid black">
                	<p><strong>비밀번호 사용이 불가한 경우는 아래와 같습니다.</strong></p>
                	<ol>
                    	<li>지금 사용하시는 비밀번호와 동일한 경우</li>
                        <li>8자리 미만의 비밀번호일 경우</li>
                        <li>15자리 초과의 비밀번호일 경우</li>
                        <li>아이디와 같은 비밀번호의 경우</li>
                    </ol>
                    <p>가장 최적의 비밀번호 조합은 13~15자리의 영문+숫자+특수문자를 조합하였을 때이며, 비밀번호 안전도가 가장 높습니다.</p>
                </div>
           		<div class="col-sm-11 text-center">
           	    	<button class="btn btn-lg btn-primary" type="submit" id="modiPwd">수정</button>
           		</div>
			</form>
			<script>
				$("#pPwd").on('click', function(event){
					if($("#mEmail").val() == "") alert("이메일을 입력해주세요.");
					else if($("#mPassword").val() == "") alert("비밀번호를 입력해주세요.");
					else {
						$.ajax({
							url: "/BANDI/cPwd.me",
							data : {
								mEmail : $('#mEmail').val(),
								mPassword : $('#mPassword').val() },
							type : "post",
							success: function(data){
								if(data == "1"){
									$('#current-pwd').remove();
									$('#newPassword').css('display', 'block');
								} else {
									alert("로그인 정보가 다릅니다!");
								}
							},
						});
					}
					event.preventDefault();
				});
				
				var reg_pwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
				
				$("#modiPwd").on('click', function(event){
					if($("#newPwd1").val() == "" || $("#newPwd2").val() == "") alert("비밀번호를 입력해주세요.");
					else if(!reg_pwd.test($('#newPwd1').val())) alert("비밀번호는 영문자, 숫자, 특수문자(!@#$%^&*)를 포함한 8~15글자입니다.");
					else if($("#newPwd1").val() != $("#newPwd2").val()) alert("동일한 비밀번호를 입력해주세요.");
					else return;
					
					event.preventDefault();
				});
			</script>
		</div>
	</div>
</div>
</body>
</html>


















