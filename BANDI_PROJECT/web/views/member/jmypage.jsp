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

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: absolute; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
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
            	<h1 class="h2">회원 정보 수정</h1>       
            </div>
            <hr style="width:100%; height:3px;">
            <div class="table-responsive">
            	<h5><strong>필수정보</strong></h5><br>
                <table class="table table-bordered">
                	<tr>
                    	<th class="col-sm-2">회원번호</th>
                        <td class="col-sm-8"><%=user.getmUser_UID() %></td>
                    </tr>
                    <tr>
                    	<th class="col-sm-2">회원등급</th>
                        <td class="col-sm-8"><%=user.getmGrade() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	<button id="myBtn" class="btn btn-xs btn-primary">혜택 보기</button>
                        </td>
                    </tr>
                    <tr>
                    	<th class="col-sm-2">회원포인트</th>
                        <td class="col-sm-8"><%=user.getmBandi_Point()%></td>
                    </tr>
                    <tr>
                        <th class="col-sm-2">이메일</th>
                        <td class="col-sm-8"><%=user.getmEmail() %></td>
                    </tr>
                    <tr>
                    	<th class="col-sm-2">이름</th>
                    	<td class="col-sm-8"><%=user.getmName() %></td>
                    </tr>
                    <tr>
                    	<th class="col-sm-2">성별</th>
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
                        <th class="col-sm-2">생년월일</th>
                        <td class="col-sm-8 form-group radio">
                        	<%=user.getmIdentified().substring(0,2) %>년
                            <%=user.getmIdentified().substring(2,4) %>월
                            <%=user.getmIdentified().substring(4,6) %>일
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
                    	<th class="col-sm-2">휴대폰</th>
                        <td class="col-sm-8">
                        	<input type="text" maxlength="3" name="tel1" size="2" id="tel1">-
                            <input type="text" maxlength="4" name="tel2" size="2" id="tel2">-
                            <input type="text" maxlength="4" name="tel3" size="2" id="tel3">
                            <input type="hidden" name="userId" value="<%=user.getmEmail()%>">
                        </td>
                    </tr>
                    <tr>
                    	<th class="col-sm-2">우편번호</th>
                    	<td class="col-sm-8">
                    		<input type="text" id="address1" name="address1" style="width:300px"/>&nbsp;&nbsp;&nbsp;
                    		<button class="btn btn-sm btn-primary" type="button" id="searchAdd">검색</button><br />
                    	</td>
                    </tr>
                    <tr>
                    	<th class="col-sm-2">주소</th>
                    	<td class="col-sm-8">
                    		<input type="text" id="address2" name="address2" style="width:500px"/>
                    	</td>
                    </tr>
                    <tr>
                    	<th class="col-sm-2">상세주소</th>
                    	<td class="col-sm-8">
                    		<input type="text" id="address3" name="address3" style="width:500px"/>
                    	</td>
                    </tr>
                </table>
			</div>
			<br /><br />
            <!-- Modal -->
            <div id="myModal" class="modal">
			  <!-- Modal content -->
			  <div class="modal-content">
			  	<div class="modal-header">
			    	<span class="close">&times;</span>
			    	<h4 class="modal-title">포인트 정책</h4>
			  	</div>
			  	<div class="modal-body">
        			<ol>
        				<li>B 브론즈 : 전체 구매 금액의 <strong>0.1%</strong> 할인</li>
        				<li>S 실버 : 전체 구매 금액의 <strong>0.2%</strong> 할인</li>
        				<li>G 골드 : 전체 구매 금액의 <strong>0.3%</strong> 할인</li>
        				<li>P 플래티넘 : 전체 구매 금액의 <strong>0.4%</strong> 할인</li>
        				<li>D 다이아 : 전체 구매 금액의 <strong>0.5%</strong> 할인</li>
        			</ol>
      			</div>
			  </div>
			</div>
			<!-- Modal -->
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
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                /* document.getElementById('sample6_postcode').value = data.zonecode; */ //5자리 새우편번호 사용
                $('#address1').val(data.zonecode);
                $('#address2').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                /* document.getElementById('sample6_address2').focus(); */
                $('#address3').focus();
            }
        }).open();
	});
	
	var addArr = '<%=user.getmAddress()%>'.split(', ');
	
	$('input[name*="address"]').each(function(index){
		$(this).val(addArr[index]);
	});
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
</script>
<%@ include file="../common/Footer.jsp" %>
</body>
</html>

























