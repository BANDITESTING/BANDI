<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.semi.bandi.model.vo.SearchBook"%>
<%
	String option = (String) request.getAttribute("option");
	String getText = (String) request.getAttribute("getText");
	ArrayList<SearchBook> list = (ArrayList<SearchBook>)request.getAttribute("list");
	HashMap<String, Integer> genreCount = (HashMap<String, Integer>)request.getAttribute("genreCount");
%>
<!DOCTYPE html>
<html>
<head>
<title>검색화면</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/searchBook/hkLocal.css?ver=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/category/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/join/font-awesome.min.css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
<script
	src="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/main/bootstrap.min.js"></script>

</head>
<body>
	<div><%@ include file="../common/Header.jsp"%></div>
	<br>
	<div class="container jg">
		<div class="row">
			<div class="col-sm-10">
				<div class="bg-pripink" style="padding: 2%; padding-left: 5%;">
					"<%=getText%>"(으)로
					<%=option%>
					<%=list.size()%>건 검색
				</div>
				<br>
				<div class="row">
					<div class="col-lg-3 col-md-4 leftdiv">
						<ul class="leftbar" style="min-width: inherit;">
							<li><span id="A%" class="gSearch">문학</span>
								<ul>
									<li><span id="A1" class="gSearch">&nbsp;&nbsp;&nbsp; 소설</span></li>
									<li><span id="A2" class="gSearch">&nbsp;&nbsp;&nbsp; 시</span></li>
									<li><span id="A3" class="gSearch">&nbsp;&nbsp;&nbsp; 에세이(자서전)</span></li>
								</ul></li>
							<li><span id="B%" class="gSearch">인문</span>
								<ul>
									<li><span id="B1" class="gSearch">&nbsp;&nbsp;&nbsp; 역사/문화</span></li>
									<li><span id="B2" class="gSearch">&nbsp;&nbsp;&nbsp; 종교</span></li>
									<li><span id="B3" class="gSearch">&nbsp;&nbsp;&nbsp; 심리</span></li>
								</ul></li>
							<li><span id="C%" class="gSearch">과학</span>
								<ul>
									<li><span id="C1" class="gSearch">&nbsp;&nbsp;&nbsp; 기술/공학</span></li>
									<li><span id="C2" class="gSearch">&nbsp;&nbsp;&nbsp; 컴퓨터/IT</span></li>
								</ul></li>
							<li><span id="D%" class="gSearch">취미</span>
								<ul>
									<li><span id="D1" class="gSearch">&nbsp;&nbsp;&nbsp; 가정(요리)</span></li>
									<li><span id="D2" class="gSearch">&nbsp;&nbsp;&nbsp; 운동(건강)</span></li>
									<li><span id="D3" class="gSearch">&nbsp;&nbsp;&nbsp; 여행</span></li>
									<li><span id="D4" class="gSearch">&nbsp;&nbsp;&nbsp; 음악(대중문화)</span></li>
									<li><span id="D5" class="gSearch">&nbsp;&nbsp;&nbsp; 스포츠</span></li>
								</ul></li>
							<li><span id="E%" class="gSearch">교육</span>
								<ul>
									<li><span id="E1" class="gSearch">&nbsp;&nbsp;&nbsp; 어린이/청소년</span></li>
									<li><span id="E2" class="gSearch">&nbsp;&nbsp;&nbsp; 참고서(초/중/고)</span></li>
								</ul></li>
							<li><span id="F%" class="gSearch">사회</span>
								<ul>
									<li><span id="F1" class="gSearch">&nbsp;&nbsp;&nbsp; 정치/사회</span></li>
									<li><span id="F2" class="gSearch">&nbsp;&nbsp;&nbsp; 경제/경영</span></li>
								</ul></li>
						</ul>
					</div>
					<div class="col-lg-9 col-md-8" id="content">
						<div>
							<%
								for (int i = 0; i < list.size(); i++) {
									SearchBook book = list.get(i);
							%>
							<div class="row booklist">
								<div class="col-lg-3 text-center mt-2 mb-2" style="padding: 0px">
									<img
										src="<%=request.getContextPath()%>/resources/bookimage/<%=book.getmImagePath()%>"
										alt="책" class="bookImg">
								</div>
								<div class="col-lg-5 bookInfo">
									<div class="bookTitle mb-1"><%=book.getmTitle()%></div>
									<div><%=book.getmWriter()%> / <%=book.getmPublisher()%></div>
									<div class="price"><%=book.getmPrice()%></div>
								</div>
								<div class="col-lg-4" style="margin: auto;">
									<div class="input-group mb-1 mt-1">
										<div class="input-group-prepend">
											<label class="input-group-text" for="bookCount">수량</label>
											<input class="input-group" type="number" min="1" value="1"
												id="bookCount" />
										</div>
									</div>
									<div class="mt-2">
										<button class="btn btn-block bg-ultravio">장바구니</button>
									</div>
									<div class="mt-2 mb-2">
										<button class="btn btn-block">바로구매</button>
									</div>

								</div>
							</div>
							<br>
							<%
								}
							%>

						<!-- bookList부분 -->
						</div>
						<div>
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item active"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
							</ul>
						</div>

					<!-- middiv -->
					</div>
					
				<!-- leftdiv + middiv -->
				</div>
				
			<!-- topdiv + leftdiv + bookList -->
			</div>

			<div class="col-md-2 test">banner</div>

		</div>


	</div>
	<script>
		$(function(){
			$('#searchBar').val('<%=getText%>');
		});
	
		$('.leftbar').children('li').each(function(idx, item){
			var gCount = 0;
			<%
			Iterator iter = genreCount.entrySet().iterator();
			while(iter.hasNext()){
				Map.Entry<String,Integer> entry = (Map.Entry<String, Integer>)iter.next();
				String iterKey = (String)entry.getKey();
				int iterValue = (int)entry.getValue();
			%>
				$(this).children().children().each(function(idx, item){
					if($(this).children('span').attr('id') == '<%= iterKey%>'){
						var value = <%= iterValue%>;
						$(this).children('span').text($(this).children('span').text()+"("+value+")");
						gCount += value;
					}
				});			
			<%}%>				
			if(gCount != 0) $(this).children('span').text($(this).children('span').text()+"("+gCount+")");			
		});
		
		$(function(){
			$(".price").each(function(index, item){
				var price = $(this).text();
				$(this).text(price.replace(/\B(?=(\d{3})+(?!\d))/g, ',') +"원");
			});
		});
		
		$('#bookCount').on('input', function(){
			if($('#bookCount').val()>100){
				alert("책은 100권까지만 주문 가능합니다.");
				$('#bookCount').val(100);
			};
		});
		
		$('.gSearch').on('click', function(){
			var genreCode = $(this).attr('id');
			console.log(genreCode);
			location.href="<%=request.getContextPath()%>/searchGenre.sb?option=<%=option%>&getText=<%=getText%>&genreCode="+genreCode;
		});
		
	</script>
</body>
</html>