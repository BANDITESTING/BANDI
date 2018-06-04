<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
  <head>
    <title>회원가입</title>
    <link href="<%=request.getContextPath()%>/resources/css/admin/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js"></script> 
  </head>
  
  <body>
  <header>
  	<%@include file ="../common/Header.jsp" %>
  </header>
      <article class="container">
        <div class="page-header">
          <h1>회원가입</h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
        <form role="form" id="signUpForm" action="/BANDI/signUp.me" method="post">
          <div class="form-group">
            <label for="email">이메일 인증</label>
              <div class="input-group">
              <input type="email" class="form-control" id="email" name="userEmail" placeholder="이메일이 아이디 입니다">
              <span class="input-group-btn">
              	<button class="btn btn-primary" type="button" id="emailcheck">이메일 중복 확인</button>
                <button class="btn btn-success" type="button" id="emailOk">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
              </span>
            </div>
          </div>
          <div class="form-group">
            <label for="num">인증번호 입력</label>
              <div class="input-group">
                <input type="text" class="form-control" id="emailNum" placeholder="인증번호">
                  <span class="input-group-btn">
                    <button class="btn btn-success" type="button" id="emailReallyOk">인증번호 확인<i class="fa fa-edit spaceLeft"></i></button>
                  </span>
              </div>
          </div>
          
          <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="userPwd" name="mPassword" placeholder="비밀번호">
          </div>
          
          <div class="form-group">
            <input type="password" class="form-control" id="userPwd2" name="mPassword2" placeholder="비밀번호 재확인">
          </div>
          
          <div class="form-group">
            <label for="userName">이름</label>
            <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해 주세요">
          </div>
          <div class="form-group">
              <label for="userGender">성별</label>
                <div class="input-group">
                 	<input type="radio" id="man" name="gender" value="M">남성 &nbsp;
					<input type="radio" id="woman" name="gender" value="F">여성 &nbsp;
                </div>
          </div>
          <div class="form-group">
          	<label for="userAge">생년월일</label>
          	<div>
          	<input id="userBirth" name="userBirth" type="text" class="form-control" />
          	</div>
          </div>
          <div class="form-group">
            <label for="addr1">우편번호</label>
            <div class="input-group">
            <input type="text" class="form-control" id="addr1" name="addr1">
              <span class="input-group-btn">
              <button class="btn btn-success" type="button" onclick="daumPostcode();">우편번호<i class="fa fa-mail-forward spaceLeft"></i></button>
              </span>
            </div>
          </div>
          <div class="form-group">
            <label for="addr2">상세주소</label>
              <input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소를 입력해 주세요">
          </div>
          <div>
              <input type="text" class="form-control" id="addr3" name="addr3" placeholder="상세주소를 입력해 주세요">
          </div>
          <div>
            <label for="phone">휴대폰 번호</label>
              <input type="tel" class="form-control" id="phone" name="phone" placeholder="-없이 입력해 주세요">
          </div>
            <div class="form-group">
                <label>약관 동의</label>
              <div class="input-group">
              <label class="btn btn-primary active">
                  <input id="agree" type="checkbox" >
              </label>
              <a href="#">이용약관</a>에 동의합니다.
              </div>
            </div>
            <div class="form-group text-center">
             <button type="button" class="btn btn-info" id="signUp">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="button" class="btn btn-warning" id="goMain" >메인으로<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
      </article>
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      <script>
     	 $(function() {
    	  $("#userBirth").datepicker({
    	    dateFormat: 'yy-mm-dd'
    	  });
    	});
     	 
     	 
  		// 플레그 값
    	var flag = false; //이메일 인증 확인을 했을때 true로 바뀔 플레그 값
    	
  		// 인증번호 값 받아옴
      	var result;
      	//이메일 인증번호 넘기기
      	$('#emailOk').on('click', function(){
      		$.ajax({
      			url : "<%=request.getContextPath()%>/email.do",
          		data : {email :  $('#email').val()},
          		type : "POST",
      			success : function (responseText) {
      				alert("인증번호 전송");
      				result = responseText;
      				$('#email').attr("readonly", true);
      			},
      			error : function(){
      			alert("에러발생");
      			}
      			
      		});
      		
      		
      	});   
      	
      	//이메일 인증 확인하기
      	$('#emailReallyOk').on('click', function(){
      		if($('#emailNum').val() == result){
      			alert("이메일 인증 성공");
      			flag = true;
      			$('#emailNum').attr("readonly",true);
      		} else {
      			alert("인증 번호를 정확히 입력해주세요");
      		}
      		
      	});
      	
        //다음 주소 api따오기
        function daumPostcode() {
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
                    $('#addr1').val(data.zonecode);
                    $('#addr2').val(fullAddr);

                    // 커서를 상세주소 필드로 이동한다.
                    $('#addr3').focus();
                }
            }).open();
        }
		
        
        //메인으로 버튼
        $('#goMain').on('click', function(){
        	location.href = '<%=request.getContextPath()%>/main/Main.jsp';
        })
        
        
        //회원가입에 쓸 정규식 
        var reg_pwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
        var reg_name = /^[가-힣]{2,10}$/; 
        var reg_phone = /^(01[016789]{1})\d{3,4}\d{4}$/;
        var reg_birth = /^[12]{1}$/
        // ^ $ : 시작과 끝
        // (?=) : 긍정형 전방탐색
        // . : 공백을 포함한 어떠한 문자 하나
        // * : 회수 0회 이상 
        // + : 회수 1회 이상 
        
        
        //회원가입 버튼 눌렀을 경우 
       	$('#signUp').on('click', function(){
       		if(flag == true && $('input:checkbox[id=agree]').is(":checked") == true){
       			$('#signUpForm').submit();	
       		}else if(flag == false){
       			alert("이메일 인증을 해주세요");
       		}else {
       			alert("이용약관에 동의 해주세요");
       		}
       		        	
       	});
			
        $('#signUpForm').submit(function(event){
        	//규식이를 이용해 비교할 값들 
        	 var pwd = $('#userPwd').val();
        	 var pwd2 = $('#userPwd2').val();
             var name = $('#userName').val();
             var phone = $('#phone').val();
             var birthArr = $('#userBirth').val().split('-');
             var birth = birthArr[0]+birthArr[1]+birthArr[2];			 
			 var birthMin = 19000101;
			 var birthMax = 20180101;
             if( !reg_pwd.test(pwd) ){
                 alert("비밀번호는 영문자, 숫자, 특수문자(!@#$%^&*)를 포함한 8~15글자입니다");
             }else if(pwd != pwd2){
             	 alert("동일한 비밀번호를 입력해주세요")
             }else if(!reg_name.test(name)){
            	 alert("이름은 한글 2~10글자까지 입력해주세요");	
             }else if(!reg_phone.test(phone)){
                 alert("올바른 휴대폰 번호를 입력해주세요");
             }else if(birth < birthMin && birthMax < birth){
            	 alert("올바른 생년월일을 입력해주세요");
             }else return;
             event.preventDefault();
        });
		
        $('#emailcheck').on('click', function(){
        	$.ajax({
        		url : '/BANDI/emailcheck.me',
        		type : 'post',
        		data : {email : $('#email').val()},
        		success : function(data){
        			if(data == 0) alert("사용하셔도 좋은 이메일 입니다.");
        			else alert("이미 가입된 회원입니다.");
        		}
        	});
        });
            
      </script>
  </body>
</html>


























