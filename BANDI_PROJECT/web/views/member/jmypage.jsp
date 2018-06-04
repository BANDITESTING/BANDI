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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>      
.sidebar {
	position: absolute;
    height: 500px;
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
            	<!-- <li class="active">회원 탈퇴</li> -->
            </ul>
        </div>
        <div role="main" class="col-xs-10 col-xs-offset-2 col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 col-lg-10 col-lg-offset-2">
        	<div>
            	<h1 class="h2">회원 정보 수정</h1>       
            </div>
            <hr style="width:100%; height:3px;">
            <div class="table-responsive">
            	<h5><strong>필수정보</strong></h5>
                <table class="table table-bordered">
                	<tr>
                    	<td class="col-sm-2">회원번호</td>
                        <td class="col-sm-8"><%=user.getmUser_UID() %></td>
                    </tr>
                    <tr>
                        <td class="col-sm-2">이메일</td>
                        <td class="col-sm-8"><%=user.getmEmail() %></td>
                    </tr>
                    <tr>
                    	<td class="col-sm-2">이름</td>
                    	<td class="col-sm-8"><%=user.getmName() %></td>
                    </tr>
                    <tr>
                    	<td class="col-sm-2">성별</td>
                        <td class="col-sm-8 radio">
                        	<label>
                            	<input type="radio" name="gender" id="gender" value="M">여자&nbsp;&nbsp;&nbsp;
                            </label> 
                            <label>
                                <input type="radio" name="gender" id="gender" value="F">남자
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-2">생년월일</td>
                        <td class="col-sm-8 form-group radio">
                        	<%=user.getmIdentified().substring(0,2) %>년
                            <%=user.getmIdentified().substring(3,4) %>월
                            <%=user.getmIdentified().substring(5,6) %>일
                        </td>
                    </tr>
                </table>
			</div>
                <hr style="width:100%; height:3px;">
                <form action="<%=request.getContextPath()%>/changeinfo.me" method="post">
                <div class="table-responsive">
                <h5>기본 배송 정보</h5>
                <table class="table table-bordered">
                	<tr>
                    	<td class="col-sm-2">휴대폰</td>
                        <td class="col-sm-8">
                        	<input type="text" maxlength="3" name="tel1" size="2" id="tel1">-
                            <input type="text" maxlength="4" name="tel2" size="2" id="tel2">-
                            <input type="text" maxlength="4" name="tel3" size="2" id="tel3">
                            <input type="hidden" name="userId" value="<%=user.getmEmail()%>">
                        </td>
                    </tr>
                    <tr>
                        <td class="col-sm-2">우편번호</td>
                        <td class="col-sm-8">
                        	<input type="text" id="zipCode" name="zipCode"/>
                        	<button class="btn btn-sm btn-primary" type="button" id="searchAdd">검색</button>
                        </td>
                    </tr>
                    <tr>
                    	<td class="col-sm-2">주소</td>
                    	<td class="col-sm-8"><input type="text" id="address1" name="address1" style="width:500px"/></td>
                    </tr>
                    <tr>
                    	<td class="col-sm-2">상세주소</td>
                    	<td class="col-sm-8"><input type="text" id="address2" name="address2"/></td>
                    </tr>
                </table>
			</div>
			<br /><br />
            <!-- <hr style="width:100%; height:3px;">
            	<div class="table-responsive">
                <h5>선택정보</h5>
                <table class="table table-bordered">
                	<tr>
                    	<td class="col-sm-2">직업</td>
                        <td class="col-sm-8 form-group">
                        	<input type="text" style="width:150px; height:22px" name="job">
                        </td>
                    </tr>          
                    <tr>
                     	<td class="col-sm-2">관심종목</td>
                        <td class="col-sm-8">
                        	<label class="checkbox-inline"> 
                            	<input type="checkbox" id="inlineCheckbox1" value="option1"> 자바 
                            </label> 
                            <label class="checkbox-inline"> 
                                <input type="checkbox" id="inlineCheckbox2" value="option2"> 오라클
                            </label> 
                            <label class="checkbox-inline"> 
                                <input type="checkbox" id="inlineCheckbox3" value="option3"> HTML
                            </label>
                        </td>
                     </tr>
				</table>
			</div> -->
            <div class="col-sm-11 text-center">
            	<button class="btn btn-lg btn-primary" id="changeInfo">나의 정보 변경</button>
            </div>
            </form>
            <br /><br /><br /><br /><br />
		</div>
	</div>
</div>
<script>
	$(function(){
		$('input:radio').each(function(){
			if($(this).val() == '<%=user.getmGender()%>')
				$(this).prop('disabled', true);
			else
				$(this).prop('checked', true);
		});
		
		var phoneArr = '<%=user.getmPhone()%>'.split('-');
		
		$('input[name*="tel"]').each(function(index){
			$(this).val(phoneArr[index]);
		});
	});
	
	$('#searchAdd').on('click', function(event){
		new daum.Postcode({
			oncomplete: function(data){
				var fullAddr = '';
				var extraAddr = '';
				
				if(data.userSelectedType == 'R'){
					fullAddr = data.roadAddress;
				} else {
					fullAddr = data.jibunAddress;
				}
				
				if(data.userSelectedType == 'R'){
					if(data.bname != ''){
						extraAddr += data.bname;
					}
					
					if(data.buildingName != ''){
						extraAddr += (extraAddr != '' ? ', ' + data.buildingName : data.buildingName);
					}
					
					fullAddr += (extraAddr != '' ? ' (' + extraAddr + ')' : '');
				}
				
				$('#zipCode').val(data.zonecode);
				
				$('#address1').val(fullAddr);
				
				$('#address2').focus();
			}
		}).open();
	});
</script>
<%@ include file="../common/Footer.jsp" %>
</body>
</html>

























