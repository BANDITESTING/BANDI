<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/bootstrap.min.css?ver=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/sb-admin-2.min.css?ver=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/morris.css?ver=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/font-awesome.min.css?ver=1" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js?ver=1"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js?ver=1"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/metisMenu.min.js?ver=1"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/sb-admin-2.min.js?ver=1"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gugi">
<title>BANDI By Admin</title>
</head>
<body>
	<div id="wrapper">
	
			<%@include file ="adminNav.jsp" %>
		
            <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style ="font-family: Gugi">반디불이 작가</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style ="background-color:#5F4B8B; color:snow;">
                            BANDI WRITER INPUT
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form">
                                        <div class="form-group">
                                                <label>작가코드 : </label>
                                                <input type="text" placeholder="작가 CODE!" id ="writerCode">
                                                <button type ="button" id ="checkDup">중복확인</button>
                                            	<span id ="resultText"></span>
                                        </div>

                                        <div class="form-group">
                                            <label>작가이름</label>
                                            <input class="form-control" placeholder="작가이름을 입력해주세요" id = "writerName">
                                        </div>

                                        <div class="form-group">
                                            <label>작가소개</label>
                                            <textarea class="form-control" rows="3" id ="writerIntro"></textarea>
                                        </div>
                                       
                                        <button type="button" class="btn btn-default" id ="submitBtn">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
	</div>
	
	<script>
		var dupCheck = false;
	
		$('#checkDup').on('click', function(){
			var writerCode = $('#writerCode').val();
			console.log(writerCode);
			if(writerCode != "")
			{
				$.ajax({
					url: "/BANDI/WriterCode.do",
					type : "POST",
					data : "writerCode="+writerCode,
					datatype: "text" ,
					success : function(data){
						if(data.no == "no")
						{
							$('#resultText').text('사용이 가능합니다.').css('color','green');
							dupCheck = true;
						}
						else
						{
							$('#resultText').text('중복됩니다.').css('color', 'red');
							dupCheck = false;
						}
					},
					error: function(data){}
				});
				return false;
			}else
			{
				alert('작가코드를 입력해주세요');
				return false;
			}
		});
		
		$('#submitBtn').on('click', function(){
			
			if($('#writerCode').val().length != 3 ||$('#writerName').val() == "")
			{
				alert('작가코드는 3자리 및 이름을 입력해주세요');
				return false;
			}
			else
			{
				if(!dupCheck) { alert('CODE 중복체크 바랍니다.'); return false;}
				else{
				$.ajax({
					url : "<%=request.getContextPath()%>/InsertWriter.do",
					type : "POST",
					data : {
						"writerCode" :$('#writerCode').val(),
						"writerName" : $('#writerName').val(),
						"writerIntroduce" : $('#writerIntro').val()
					},
					success : function(data){
							if(data == "success")
								alert('작가 코드 새로 생성됬습니다.');
							else
								console.log("fail insert Writer to DB");
							
							// Make Empty Values
							$('#writerCode').val("");
							$('#resultText').text("");
							$('#writerName').val("");
							$('#writerIntro').val("");
					},
					error: function(request,status,error)
					{
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
					return true;
				}
				
			}
		});
	</script>
</body>
</html>