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
                   	  		  	<input type="text" style="width:200px; height:23px" id="mEmail" value="<%=user.getmEmail()%>"/>
                			</td>
                		</tr>
                		<tr>
                    		<td class="col-sm-2">비밀번호</td>
                     	    <td class="col-sm-8 form-group">
                   	  		  	<input type="password" style="width:200px; height:23px" id="mPassword">
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
                        	<input type="password" style="width:200px; height:23px" id="newPwd1" name="mPassword">
                        	<input type="hidden" name="userId" value="<%=user.getmEmail()%>">
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-2">새 비밀번호 확인</td>
                        <td class="col-sm-8 form-group">
                        	<input type="password" style="width:200px; height:23px" id="newPwd2" name="newPwd2">
                        </td>
                    </tr>
                </table>
                <div class="border:1px solid black">
                	<ol>
                    	<li>그거안돼</li>
                        <li>이거안돼</li>
                        <li>그것도안돼</li>
                    </ol>
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
				
				$("#modiPwd").on('click', function(event){
					if($("#newPwd1").val() == "" || $("#newPwd2").val() == "") alert("비밀번호를 입력해주세요.");
					else if($("#newPwd1").val() != $("#newPwd2").val()) alert("비밀번호가 다릅니다.");
					else return;
					
					event.preventDefault();
				});
			</script>
		</div>
	</div>
</div>
</body>
</html>


















