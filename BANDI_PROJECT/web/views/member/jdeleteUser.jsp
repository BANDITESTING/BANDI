<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/js/member/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/member/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.sidebar {
	position: absolute;
    height: 700px;
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
<header>
	<%@include file ="../common/Header.jsp" %>
</header>
<body>
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
            	<h1 class="h2">회원 탈퇴</h1>       
            </div>
            <hr style="width:100%; height:3px;">
            <form id ="agreeForm">
	            <div class="table-responsive">
	            	<h5><strong>탈퇴 안내</strong></h5>
	            	<hr style="height:3px">
		            <table class="table table-bordered table-responsive">
		                <tr>
		                	<td>1. 마 자신있나?</td>
		                	<td>2. 마 후회 안 할 자신 있나?</td>
		                </tr>
		               	<tr>
		                	<td>1. 마 자신있나?</td>
		               		<td>2. 마 후회 안 할 자신 있나?</td>
		                </tr>
		                <tr>
		                	<td>1. 마 자신있나?</td>
		                	<td>2. 마 후회 안 할 자신 있나?</td>
		                </tr>
		             </table>
		             <label>
		                <input type="checkbox" name="checkdelete" id="checkdelete">&nbsp;&nbsp;회원 약관을 이해
		             </label>
	               	 <hr style="width:100%; height:3px;">
	            	 <div class="col-sm-11 text-center">
	            	 	<button class="btn btn-lg btn-primary" id="deleteUser1" type="button">회원 탈퇴</button>
	           		 </div>
				</div>
            </form>
            <form class="changeForm" id="deleteUserform" method="post" style="display:none;">
                <table class="table table-bordered">
                    <tr>
                        <td class="col-sm-2">이메일</td>
                        <td class="col-sm-8 form-group">
                        	<input type="email" style="width:200px; height:23px" id="deleteEmail" name="deleteEmail" value="<%=user.getmEmail()%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-2">패스워드</td>
                        <td class="col-sm-8 form-group">
                        	<input type="password" style="width:200px; height:23px" id="deletePassword" name="deletePassword">
                        </td>
                    </tr>
                </table>
           		<div class="col-sm-11 text-center">
           	    	<button class="btn btn-lg btn-primary" type="button" id="deleteUser2">회원 탈퇴</button>
           		</div>
			</form>
			<script>
				$('#deleteUser1').on('click', function(event){
					if($('#checkdelete').is(":checked")){
						$('#agreeForm').css('display',"none");
						$('#deleteUserform').css('display',"block");
					} else {
						alert("회원 약관 체크해라.");
					}
					event.preventDefault();
				});
				
				$('#deleteUser2').on('click', function(event){
					if($('#deletePassword').val() == '') 
						alert("비밀번호를 입력하세요.");
					else{
						$.ajax({
						url : '/BANDI/deleteUser.me',
						type : 'post',
						data : {
							email : $('#deleteEmail').val(),
							password : $('#deletePassword').val()},
							success : function(data){
								if(data == "0"){
									alert("회원 탈퇴가 완료되었습니다.");
									location.href="<%=request.getContextPath()%>/index.jsp";
								}else{
									alert("비밀 번호가 다릅니다. 다시 입력해주세요.");
								}
							}
						});
					}
					event.preventDefault();
				});
				
			</script>
            <br /><br /><br /><br /><br />
		</div>
	</div>
</div>
</body>
</html>

























