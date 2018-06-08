<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/bootstrap.min.css?ver=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/sb-admin-2.min.css?ver=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/morris.css?ver=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/dataTables.bootstrap.css?ver=1">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/font-awesome.min.css?ver=1" type="text/css">
    
     <script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/metisMenu.min.js"></script>
    <script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.dataTables.min.js"></script>
   <script src ="<%=request.getContextPath()%>/resources/js/admin/dataTables.bootstrap.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/sb-admin-2.min.js"></script>
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gugi">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gaegu">
	<title>BANDI ADMIN</title>

	<style>
		.font-header{
			font-family: 'Gugi', sans-serif;
			font-style: italic;
		}
		
		.panel-footer{
			cursor: pointer;
		}	
	</style>
	
</head>
<body>
	<div id="wrapper">
        <%@include file ="adminNav.jsp" %>
        
         <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header font-header">BANDI BOOKS!</h1>
                </div>
            </div>
            
             <!-- /.row -->
            <div class="row">
            	<div class="col-lg-3 col-md-6">
                    <div class="panel" style ="background: #5F4B8B; color:white">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-signal fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="incomeCount">13</div>
                                    <div>매출 현황</div>
                                </div>
                            </div>
                        </div>
                        
                            <div class="panel-footer" style= "color:black;" onclick="changeList('income');">
                                <span class="pull-left">자세히 보기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <div class="panel" style ="background: #A35776; color:snow;">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id ="stockCount">12</div>
                                    <div>책 재고 현황</div>
                                </div>
                            </div>
                        </div>
                        
                            <div class="panel-footer" style ="color: black;" onclick="changeList('stock');">
                                <span class="pull-left">자세히 보기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        
                    </div>
                </div>
            
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id ="commentCount">26</div>
                                    <div>댓글 현황</div>
                                </div>
                            </div>
                        </div>
                       
                            <div class="panel-footer" onclick="changeList('comment');">
                                <span class="pull-left">자세히 보기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id ="orderCount">124</div>
                                    <div>주문현황</div>
                                </div>
                            </div>
                        </div>
                        
                            <div class="panel-footer" onclick="changeList('order');">
                                <span class="pull-left">자세히 보기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        
                    </div>
                </div>
                
            </div>
           
			<!-- Table List -->
			<div class = "row">
				<div class = "col-lg-9">
					<div class="panel panel-default">
						<div class="panel-heading">
                            	매출 현황
                        </div>
						
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover" id="dataTables-example" style="width: 100%; text-align: right;">
								<thead>
	                                  <tr>
	                                      <th>주문일</th>
	                                      <th>주문수</th>
	                                      <th>책판매량</th>
	                                      <th>포장비용</th>
	                                      <th>주문합계</th>
	                                  </tr>
	                            </thead>
	                            
	                            <tbody>
	                            	<tr>
	                                     <td>2018/06/01</td>
	                                     <td>12</td>
	                                     <td>120000원</td>
	                                     <td>8000원</td>
	                                     <td>비고 없음</td>
	                                </tr>	                           
	                            </tbody>
							</table>
						</div>
					</div>		
				</div>
				
				<div class ="col-lg-3">
						
				</div>	
			</div>           
         </div>
	</div>
	
	<script>
		$(function(){
			$.ajax({
				url: '/BANDI/admin.main',
				type: 'POST',
				success: function(data){
					// Remove Remanent Data about Income Table
					$('tbody tr').remove();
					$('tbody td').remove();
					
					for(var i = 0; i < data.length; i++)
					{
						var std = "<tr><td>" + data[i].mOrderDate + "</td>" + 
						"<td>" + data[i].mOrderCount + "</td>" +
						"<td>" + data[i].mOrderBooksCount + "</td>" +
						"<td>" + data[i].mPacketPrice + "</td>" +
						"<td>" + data[i].mSumPrice + "</td></tr>";
						
						$('table').append(std);
					}
				},
				error: function(request,status,error)
				{
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
			// Set All Income This Year!
			$.ajax({
				url: '/BANDI/income.admin',
				type : 'POST',
				success : function(data)
				{
					$('#incomeCount').text(data.total);
					$('#stockCount').text(data.stock);
					$('#commentCount').text(data.comment);
					$('#orderCount').text(data.order);
				},
				error: function(request,status,error)
				{
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		$(document).ready(function() {
		        $('#dataTables-example').DataTable({
		            responsive: true
		        });
		});
		
		function changeList(name)
		{
			console.log(name);
		}
	</script>
	
</body>
</html>