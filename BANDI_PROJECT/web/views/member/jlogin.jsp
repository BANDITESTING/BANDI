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
<style>
 .container{
                padding-right: 15px;
                padding-left: 15;
                margin-right: auto;
                margin-left: auto;
            }
  .form-signin{
                max-width: 370px;
                padding: 15px;
                margin: 0 auto;
            }
</style>
</head>
<body>
<div class="container">
	<div class="row">
    	<div class="col-ms">
        	<img src="<%=request.getContextPath()%>/resources/images/member/logo.jpg" class="img-responsive" style="margin:0 auto;"
        	onclick="location='<%=request.getContextPath()%>/index.jsp'">
        </div>
	</div>
	<form class="form-signin" id="LoginForm" method="post" action="<%=request.getContextPath()%>/login.me">
		<input type="email" id="mEmail" name="mEmail" class="form-control input-lg" placeholder="E-mail"><br />
		<input type="password" id="mPassword" name="mPassword" class="form-control input-lg" placeholder="Password"><br /><br />
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	</form>
	<script>
	$("#LoginForm").submit(function(event){
		
		if($("#mEmail").val() == ""){
			alert("이메일을 입력해주세요.");
		}
		else if($("#mPassword").val() == ""){
			alert("비밀번호를 입력해주세요.");
		}
		else { 
			$.ajax({
				url : "/BANDI/cUser.me",
				data : {
					mEmail : $('#mEmail').val(),
					mPassword : $('#mPassword').val()},
				type : "post",
				async : false,
				success : function(data)
				{
					if(data == "0"){
						alert("회원 정보가 없습니다. 다시 확인해주세요.");
						event.preventDefault();
					} 
				
				}
			});
			
			return;
		}
		
		event.preventDefault();
	});
	</script>
	<div class="row">
		<div class="col-ms" style="text-align:center">
			<a href="http://www.iei.or.kr/" target="black"><img src="<%=request.getContextPath()%>/resources/images/member/ot.jpg" class="img-responsive" style="margin:0 auto; max-width: 440px;"></a>
		</div>
	</div>
</div>
</body>
</html>



























