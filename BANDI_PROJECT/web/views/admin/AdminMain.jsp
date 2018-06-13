<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.bandi.model.vo.*" %>
<%@ page import="com.semi.bandi.model.vo.adminVo.*"%>
<%@ page import="java.util.*" %>
<% 
	@SuppressWarnings("unchecked")
	ArrayList<BookStocks> stocks = (ArrayList<BookStocks>)session.getAttribute("stocks");

	@SuppressWarnings("unchecked")
	ArrayList<AnnualIncome> incomes = (ArrayList<AnnualIncome>)session.getAttribute("annual");
	
	@SuppressWarnings("unchecked")
	ArrayList<CommentAdmin> comments  = (ArrayList<CommentAdmin>)session.getAttribute("comments");
	
	@SuppressWarnings("unchecked")
	ArrayList<OrderAdmin> orders = (ArrayList<OrderAdmin>)session.getAttribute("orders");
	
	String year = (String)session.getAttribute("adminYear");
	
	if(stocks == null || incomes == null || comments == null || orders == null)
	{
		// go to Error Page;
		response.sendRedirect(request.getContextPath() + "/views/common/errorPage.jsp");
		return;
	}
%>

<% 
	User user = (User)session.getAttribute("user"); 
	if(user == null || session == null) response.sendRedirect(request.getContextPath() + "/views/common/errorPage.jsp");
%>
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
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/adminMain.css?ver=5">
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/recommendBooks.css">
    
     <script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/metisMenu.min.js"></script>
    <script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.dataTables.min.js"></script>
   <script src ="<%=request.getContextPath()%>/resources/js/admin/dataTables.bootstrap.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/sb-admin-2.min.js"></script>
	
	<!-- PIE CHART JS -->
	<script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.flot.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.flot.pie.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.flot.resize.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.flot.tooltip.min.js"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/moment.min.js"></script>
	
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
		
		#yearspan{
			font-size: 4em;
			padding-top: 20px;
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
            
            <!-- SHOW THIS YEAR. -->
            <div class ="row">
            	<div class="col-lg-3">
            		<div class='card-wrapper'>
					  <div class='card' data-toggle-class='flipped' style="margin-top: 40px;">
					    <div class='card-front'>
					      <div class='layer'>
					        <h1>관리자</h1>
					        <div class='corner'></div>
					        <div class='corner'></div>
					        <div class='corner'></div>
					        <div class='corner'></div>
					      </div>
					    </div>
					    <div class='card-back'>
					      <div class='layer'>
					        <div class='top'>
					          <h2>BANDI 관리자</h2>
					        </div>
					        <div class='bottom'>
					          <h3>
					            Name: <% if(user != null) { %>
					            <span><%=user.getmName()%></span>
					          </h3>
					          <h3>
					            Email:
					            <span><%=user.getmEmail()%></span>
					          </h3>
					          <h3>
					            Phone:
					            <span><%=user.getmPhone()%></span> <%}%>
					          </h3>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
            	</div>
            	
            	<div class="col-lg-4">
            		<div class="word" style ="padding-left: 50px; text-align: center;">
						<span class ="adminYear"><%=year.substring(0,1)%></span>
						<span class ="adminYear"><%=year.substring(1,2)%></span>
						<span class ="adminYear"><%=year.substring(2,3)%></span>
						<span class ="adminYear"><%=year.substring(3,4)%></span>
						<span>년</span>
					</div>
            	</div>
            	
            	<div class="col-lg-5">
            		<div id="clock" class="dark">
					  <div class="display">
					    <div class="weekdays"></div>
					    <div class="ampm"></div>
					    <div class="alarm"></div>
					    <div class="digits"></div>
					  </div>
					</div>
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
                                    <div>책 재고 부족 현황</div>
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
			<div class = "row" id ="incomeTable">
				<div class = "col-lg-9">
					<div class="panel panel-default">
						<div class="panel-heading">
                            	매출 현황
                        </div>
						
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover" 
							style="width: 100%; text-align: right;">
								<thead>
	                                  <tr>
	                                      <th>주문일</th>
	                                      <th>주문수</th>
	                                      <th>책판매량</th>
	                                      <th>포인트사용</th>
	                                      <th>주문합계</th>
	                                  </tr>
	                            </thead>
	                            
	                            <tbody>
	                            <% if(incomes != null) {%>
	                            <%for(int i = 0; i < incomes.size(); i++) { %>
	                            	<tr>
	                                     <td><%=incomes.get(i).getmOrderDate()%></td>
	                                     <td><%=incomes.get(i).getmOrderCount()%></td>
	                                     <td><%=incomes.get(i).getmOrderBooksCount()%></td>
	                                     <td><%=incomes.get(i).getmPacketPrice()%></td>
	                                     <td><%=incomes.get(i).getmSumPrice()%></td>
	                                </tr>
	                             <%} } %>	                           
	                            </tbody>
							</table>
							
						</div>			
					</div>		
				</div>
				
				<div class ="col-lg-3">
					<div class="panel panel-default">
                        <div class="panel-heading">
                             	매출도표
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="flot-chart">
                                <div class="flot-chart-content" id="flot-pie-chart"></div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
				</div>	
			</div>
			
			
			<div class = "row" id ="stockTable">
				<div class = "col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
                            	책재고현황
                        </div>
						
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover" 
							style="width: 100%; text-align: right;">
								<thead>
	                                  <tr>
	                                      <th>책번호</th>
	                                      <th>ISBN</th>
	                                      <th>제목</th>
	                                      <th>작가</th>
	                                      <th>수량</th>
	                                  </tr>
	                            </thead>
	                            
	                            <tbody>
	                            <% if(stocks != null) { %>
	                            <%for(int i = 0; i < stocks.size(); i++) { %>
	                            	<tr>
	                                     <td><%=stocks.get(i).getmBook_UID()%></td>
	                                     <td><%=stocks.get(i).getmISBN()%></td>
	                                     <td><%=stocks.get(i).getmTitle()%></td>
	                                     <td><%=stocks.get(i).getmWriterName()%></td>
	                                     <td><%=stocks.get(i).getmQuantity()%></td>
	                                </tr>
	                             <%} } %>	                           
	                            </tbody>
							</table>
							
						</div>			
					</div>		
				</div>
				
				<div class ="col-lg-3">
						
				</div>	
			</div>
			
			
			<div class = "row" id ="orderTable">
				<div class = "col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
                            	주문현황
                        </div>
						
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover" 
							style="width: 100%; text-align: right;">
								<thead>
	                                  <tr>
	                                      <th>주문번호</th>
	                                      <th>이메일</th>
	                                      <th>이름</th>
	                                      <th>전화번호</th>
	                                      <th>주문날짜</th>
	                                  </tr>
	                            </thead>
	                            
	                            <tbody>
	                            <% if(orders != null) {%>
	                            <%for(int i = 0; i < orders.size(); i++) { %>
	                            	<tr>
	                                     <td><%=orders.get(i).getmOrder_UID()%></td>
	                                     <td><%=orders.get(i).getmEmail()%></td>
	                                     <td><%=orders.get(i).getmName()%></td>
	                                     <td><%=orders.get(i).getmTel()%></td>
	                                     <td><%=orders.get(i).getmOrder_Date()%></td>
	                                </tr>
	                             <%}} %>	                           
	                            </tbody>
							</table>
							
						</div>			
					</div>		
				</div>
				
			</div>
			
			<div class = "row" id ="commentTable">
				<div class = "col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
                            	댓글현황
                        </div>
						
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover" 
							style="width: 100%; text-align: right;">
								<thead>
	                                  <tr>
	                                      <th>댓글번호</th>
	                                      <th>제목</th>
	                                      <th>이메일</th>
	                                      <th>댓글</th>
	                                      <th>작성날짜</th>
	                                  </tr>
	                            </thead>
	                            
	                            <tbody>
	                            <% if(comments != null) { %>
	                            <%for(int i = 0; i < comments.size(); i++) { %>
	                            	<tr>
	                                     <td><%=comments.get(i).getmComment_UID()%></td>
	                                     <td><%=comments.get(i).getmCommentBook_Title()%></td>
	                                     <td><%=comments.get(i).getmEmail()%></td>
	                                     <td><%=comments.get(i).getMbook_Comment()%></td>
	                                     <td><%=comments.get(i).getmWritedDate()%></td>
	                                </tr>
	                             <%} }%>	                           
	                            </tbody>
							</table>
							
						</div>			
					</div>		
				</div>
				
				
			</div>
			          
         </div>
	</div>
	
	<script>
		$(function(){
			var year = "";
			$('.adminYear').each(function(index){
				year += $(this).text();
			});
			
			$.ajax({
				url: "/BANDI/income.admin",
				type: "POST",
				data: {year : year},
				success: function(data)
				{
					$('#incomeCount').text(data.total);
					$('#stockCount').text(data.stock);
					$('#commentCount').text(data.comment);
					$('#orderCount').text(data.order);
				},
				error : function(data)
				{}
			});
			
			
			$('#stockTable').css('display','none');
			$('#orderTable').css('display','none');
			$('#commentTable').css('display','none');
		});
		
		function changeList(id)
		{
			allClose();
			
			switch(id)
			{
				case "income": $('#incomeTable').css('display','block'); break;
				case "stock": $('#stockTable').css('display','block');break;
				case "comment": $('#commentTable').css('display','block');break;
				case "order": $('#orderTable').css('display','block');break;
			}
		}
		
		function allClose()
		{
			$('#incomeTable').css('display','none');
			$('#stockTable').css('display','none');
			$('#orderTable').css('display','none');
			$('#commentTable').css('display','none');
		}
		
		$(document).ready(function() {
		        $('table').DataTable({
		            responsive: true
		        });
		});
		
		/* PIE CHART */
		$(function() {
			
			var year = "";
			$('.adminYear').each(function(index){
				year += $(this).text();
			});
			
			$.ajax({
				url : "/BANDI/getGenreCount.get",
				type: "POST",
				data:{year:year},
				success: function(data){
					if(data != "error")
					var plotObj = $.plot($("#flot-pie-chart"), data, {
					    series: {
					        pie: {
					            show: true
					        }
					    },
					    grid: {
					        hoverable: true
					    },
					    tooltip: true,
					    tooltipOpts: {
					        content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
					        shifts: {
					            x: 20,
					            y: 0
					        },
					        defaultTheme: false
					    }
					});
				},
				error: function(){}
			});
			
			});
		
		$(function(){

			// Cache some selectors

			var clock = $('#clock'),
			    alarm = clock.find('.alarm'),
			    ampm = clock.find('.ampm');

			// Map digits to their names (this will be an array)
			var digit_to_name = 'zero one two three four five six seven eight nine'.split(' ');

			// This object will hold the digit elements
			var digits = {};

			// Positions for the hours, minutes, and seconds
			var positions = [
			    'h1', 'h2', ':', 'm1', 'm2', ':', 's1', 's2'
			];

			// Generate the digits with the needed markup,
			// and add them to the clock

			var digit_holder = clock.find('.digits');

			$.each(positions, function(){

			    if(this == ':'){
			        digit_holder.append('<div class="dots">');
			    }
			    else{

			        var pos = $('<div>');

			        for(var i=1; i<8; i++){
			            pos.append('<span class="d' + i + '">');
			        }

			        // Set the digits as key:value pairs in the digits object
			        digits[this] = pos;

			        // Add the digit elements to the page
			        digit_holder.append(pos);
			    }

			});

			// Add the weekday names

			var weekday_names = 'MON TUE WED THU FRI SAT SUN'.split(' '),
			    weekday_holder = clock.find('.weekdays');

			$.each(weekday_names, function(){
			    weekday_holder.append('<span>' + this + '</span>');
			});

			var weekdays = clock.find('.weekdays span');

			// Run a timer every second and update the clock

			(function update_time(){

			    // Use moment.js to output the current time as a string
			    // hh is for the hours in 12-hour format,
			    // mm - minutes, ss-seconds (all with leading zeroes),
			    // d is for day of week and A is for AM/PM

			    var now = moment().format("hhmmssdA");

			    digits.h1.attr('class', digit_to_name[now[0]]);
			    digits.h2.attr('class', digit_to_name[now[1]]);
			    digits.m1.attr('class', digit_to_name[now[2]]);
			    digits.m2.attr('class', digit_to_name[now[3]]);
			    digits.s1.attr('class', digit_to_name[now[4]]);
			    digits.s2.attr('class', digit_to_name[now[5]]);

			    // The library returns Sunday as the first day of the week.
			    // Stupid, I know. Lets shift all the days one position down, 
			    // and make Sunday last

			    var dow = now[6];
			    dow--;

			    // Sunday!
			    if(dow < 0){
			        // Make it last
			        dow = 6;
			    }

			    // Mark the active day of the week
			    weekdays.removeClass('active').eq(dow).addClass('active');

			    // Set the am/pm text:
			    ampm.text(now[7]+now[8]);

			    // Schedule this function to be run again in 1 sec
			    setTimeout(update_time, 1000);

			})();

			});
		
			let spans = document.querySelectorAll('.word span');
			spans.forEach((span, idx) => {
				span.addEventListener('click', (e) => {
					e.target.classList.add('active');
				});
				span.addEventListener('animationend', (e) => {
					e.target.classList.remove('active');
				});
				
				// Initial animation
				setTimeout(() => {
					span.classList.add('active');
				}, 750 * (idx+1))
		});
			
			(function () {
			    let card  = document.getElementsByClassName('card')[0],
			        moved = 0,
			        interval;

			    if (!card) return;
			    
			    card.addEventListener('click', function (event) {
			        clearInterval(interval);
			        card.style.transform = '';
			        
			        // Do not flip the card if the user is trying to
			        // tap a link.
			        if (event.target.nodeName === 'A') {
			            return;
			        }
			        
			        let cName   = card.getAttribute('data-toggle-class');
			        let toggled = card.classList.contains(cName);
			        card.classList[toggled ? 'remove' : 'add'](cName);
			    });
			    
			    interval = setInterval(function () {
			        moved = moved ? 0 : 10;
			        card.style.transform = 'translateY(' + moved + 'px)';
			    }, 1500);
			})();
	</script>
	
</body>
</html>