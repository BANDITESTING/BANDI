<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, com.semi.bandi.model.vo.searchVo.*"%>
<%
   String option = (String) request.getAttribute("option");
   String getText = (String) request.getAttribute("getText");
   String genreCode = (String) request.getAttribute("genreCode");
   ArrayList<SearchBook> list = (ArrayList<SearchBook>)request.getAttribute("list");
   HashMap<String, Integer> genreCount = (HashMap<String, Integer>)request.getAttribute("genreCount");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   
   String optionName = "";
   if(option.equals("totalSearch")) optionName="통합검색";         
   else if(option.equals("bookSearch")) optionName="도서명";
   else if(option.equals("authorSearch")) optionName="저자명";
   else if(option.equals("publisherSearch")) optionName="출판사명";
   
%>

<!DOCTYPE html>
<html>
<head>
<title>검색화면</title>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/searchBook/hkLocal.css?ver=2">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/category/bootstrap.min.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/join/font-awesome.min.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/cart/fontawesome-all.min.css">   
<link rel="stylesheet"
   href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
<script
   src="<%=request.getContextPath()%>/resources/js/main/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/main/bootstrap.min.js"></script>

</head>
<body>
   <header><%@ include file="../common/Header.jsp"%></header>
   <br>
   <div class="container jg">
      <div class="row">
         <div class="col-sm-12">
            <div class="bg-pripink" style="padding: 2%; padding-left: 5%;">
               "<%=getText%>"(으)로
               <%=optionName%>
               <%=listCount%>건 검색
            </div>
            <br>
            <div class="row">
               <div class="col-lg-3 col-md-4 leftdiv">
                  <ul class="leftbar" style="min-width: inherit;">
                     <li><span id="A_" class="gSearch">문학</span>
                        <ul>
                           <li><span id="A1" class="gSearch">&nbsp;&nbsp;&nbsp; 소설</span></li>
                           <li><span id="A2" class="gSearch">&nbsp;&nbsp;&nbsp; 시</span></li>
                           <li><span id="A3" class="gSearch">&nbsp;&nbsp;&nbsp; 에세이</span></li>
                        </ul></li>
                     <li><span id="B_" class="gSearch">인문</span>
                        <ul>
                           <li><span id="B1" class="gSearch">&nbsp;&nbsp;&nbsp; 역사/문화</span></li>
                           <li><span id="B2" class="gSearch">&nbsp;&nbsp;&nbsp; 종교</span></li>
                           <li><span id="B3" class="gSearch">&nbsp;&nbsp;&nbsp; 심리</span></li>
                        </ul></li>
                     <li><span id="C_" class="gSearch">과학</span>
                        <ul>
                           <li><span id="C1" class="gSearch">&nbsp;&nbsp;&nbsp; 기술/공학</span></li>
                           <li><span id="C2" class="gSearch">&nbsp;&nbsp;&nbsp; 컴퓨터/IT</span></li>
                        </ul></li>
                     <li><span id="D_" class="gSearch">취미</span>
                        <ul>
                           <li><span id="D1" class="gSearch">&nbsp;&nbsp;&nbsp; 가정(요리)</span></li>
                           <li><span id="D2" class="gSearch">&nbsp;&nbsp;&nbsp; 운동(건강)</span></li>
                           <li><span id="D3" class="gSearch">&nbsp;&nbsp;&nbsp; 여행</span></li>
                           <li><span id="D4" class="gSearch">&nbsp;&nbsp;&nbsp; 음악(대중문화)</span></li>
                           <li><span id="D5" class="gSearch">&nbsp;&nbsp;&nbsp; 스포츠</span></li>
                        </ul></li>
                     <li><span id="E_" class="gSearch">교육</span>
                        <ul>
                           <li><span id="E1" class="gSearch">&nbsp;&nbsp;&nbsp; 어린이/청소년</span></li>
                           <li><span id="E2" class="gSearch">&nbsp;&nbsp;&nbsp; 참고서(초/중/고)</span></li>
                        </ul></li>
                     <li><span id="F_" class="gSearch">사회</span>
                        <ul>
                           <li><span id="F1" class="gSearch">&nbsp;&nbsp;&nbsp; 정치/사회</span></li>
                           <li><span id="F2" class="gSearch">&nbsp;&nbsp;&nbsp; 경제/경영</span></li>
                        </ul></li>
                  </ul>
               </div>
               <div class="col-lg-9 col-md-8" id="content">
                  <div class="subContent">
                     <%
                        for (int i = 0; i < list.size(); i++) {
                           SearchBook book = list.get(i);
                     %>
                     <div class="row booklist">
                        <div class="col-lg-3 text-center mt-2 mb-2" style="padding: 0px">
                           <a href="<%=request.getContextPath()%>/detail.show?ISBN=<%=book.getmISBN()%>">
                           <img src="<%=request.getContextPath()%>/resources/bookimage/<%=book.getmImagePath()%>"
                              alt="책" class="bookImg"></a>
                        </div>
                        <div class="col-lg-5 bookInfo">
                           <div class="bookTitle"><a href="<%=request.getContextPath()%>/detail.show?ISBN=<%=book.getmISBN()%>"><%=book.getmTitle()%></a></div>
                           <div class="bookData mb-1"><%=book.getmWriter()%> | <%=book.getmPublisher()%> | <%=book.getmIssueYear()%>년 <%=book.getmIssueMonth()%>월</div>
                           <div class="price"><%=book.getmPrice()%></div>
                           <div class="rating"><%=book.getmRating()%>|<%=book.getmCommentCount()%></div>
                        </div>
                        <div class="col-lg-4" style="margin: auto;">
                           <div class="input-group mb-1 mt-1">
                              <div class="input-group-prepend">
                                 <label class="input-group-text" for="bookCount">수량</label>
                                 <input class="input-group" type="number" min="1" value="1"
                                    id="bookCount" class="bookCount" name="<%=book.getmBook_UID()%>"/>
                              </div>
                           </div>
                           <div class="mt-2">
                              <button class="btn btn-block bg-ultravio" onclick="insertCart(<%=book.getmBook_UID()%>);">장바구니</button>
                           </div>
                           <div class="mt-2 mb-2">
                              <button class="btn btn-block" onclick="orderDirect(<%=book.getmBook_UID()%>);">바로구매</button>
                           </div>
                        </div>
                     </div>
                     <br>
                     <%
                        }
                     %>

                  <!-- bookList부분 -->
                  </div>
                  
                  <!-- pagination -->
                  <div style="margin-bottom:5%;" class="pageDiv">
                     <ul class="pagination mt-2 mb-2" style="margin-left:auto; margin-right:auto;">
                        <!-- 맨 앞으로 이동 버튼 -->
                        <li class="page-item"><a href="#"><button class="page-link" onclick="paging(1);">&laquo;</button></a></li>
                        <!-- 하나 전으로 이동 버튼 -->
                        <% if(currentPage <= 1){ %>
                           <li class="page-item disabled"><button class="page-link">&lt;</button></li>
                        <% } else { %>
                           <li class="page-item"><a href="#"><button class="page-link" onclick="paging(<%=currentPage%>-1);">&lt;</button></a></li>
                        <% } %>
                        <!-- 각 페이지 이동 버튼 -->
                        <%for(int i = startPage; i <= endPage; i++){ %>
                           <% if(currentPage == i){ %>
                              <li class="page-item active"><a href="#"><button class="page-link" disabled><%=i%></button></a></li>
                           <% } else { %>
                              <li class="page-item"><a href="#"><button class="page-link" onclick="paging(<%=i%>);"><%=i%></button></a></li>
                           <% } %>                           
                        <% } %>
                        <!-- 하나 앞으로 이동 버튼 -->
                        <% if(currentPage >= maxPage){ %>
                        <li class="page-item disabled"><button class="page-link">&gt;</button></li>
                        <% } else { %>
                        <li class="page-item"><a href="#"><button class="page-link" onclick="paging(<%=currentPage%>+1);">&gt;</button></a></li>
                        <% } %>
                        <!-- 맨 뒤로 이동 버튼 -->
                        <li class="page-item"><a href="#"><button class="page-link" onclick="paging(<%=maxPage%>);">&raquo;</button></a></li>
                     </ul>
                  </div>

               <!-- middiv -->
               </div>
               
            <!-- leftdiv + middiv -->
            </div>
            
         <!-- topdiv + leftdiv + bookList -->
         </div>

      </div>
	
   </div>
	<footer><%@ include file="../common/Footer.jsp"%></footer>
	
   <script>
	  // 페이징 기능
      function paging(currentPage){
         $.ajax({
        	url : "paging.sb",
        	type : "GET",
        	data : {
        		option : '<%=option%>',
        		getText : '<%=getText%>',
        		genreCode : '<%=genreCode%>',
        		currentPage : currentPage
        		},
        	dataType : "json",
        	success : function(data){
				
				var book = data.list;
				var pi = data.pi;
				
        		$('.subContent').children().remove();
        		$('.pageDiv').children().remove();
        		
        		// 책 정보 부분
				for(var i in book){
					var innerHtmlBook = `<div class="row booklist">
                    <div class="col-lg-3 text-center mt-2 mb-2" style="padding: 0px">
                    <a href="<%=request.getContextPath()%>/detail.show?ISBN=`+book[i].mISBN+`">
                    <img src="<%=request.getContextPath()%>/resources/bookimage/`+book[i].mImagePath+`"
                          alt="책" class="bookImg"></a>
                    </div>
                    <div class="col-lg-5 bookInfo">
                       <div class="bookTitle">
                       <a href="<%=request.getContextPath()%>/detail.show?ISBN=`+book[i].mISBN+`">`
                    		   +book[i].mTitle+`</a></div>
                       <div class="bookData mb-1">`+book[i].mWriter+` | `+book[i].mPublisher+` | `+book[i].mIssueYear+`년 `+book[i].mIssueMonth+`월</div>
                       <div class="price">`+book[i].mPrice+`</div>
                       <div class="rating">`+book[i].mRating+`|`+book[i].mCommentCount+`</div>
                    </div>
                    <div class="col-lg-4" style="margin: auto;">
                       <div class="input-group mb-1 mt-1">
                          <div class="input-group-prepend">
                             <label class="input-group-text" for="bookCount">수량</label>
                             <input class="input-group bookCount7" type="number" min="1" value="1"  
                             id="bookCount" class="bookCount" name="`+book[i].mBook_Uid+`"/>
                          </div>
                       </div>
                       <div class="mt-2">
                       		<button class="btn btn-block bg-ultravio" onclick="insertCart(`+book[i].mBook_Uid+`);">장바구니</button>
                       </div>
                       <div class="mt-2 mb-2">
                          <button class="btn btn-block" onclick="orderDirect(`+book[i].mBook_Uid+`);">바로구매</button>
                       </div>

                    </div>
                 </div>
                 <br>`

                 $('.subContent').append(innerHtmlBook);
                 
				}
				
				// 페이징 부분	
			   	var currentPage = pi.currentPage;
			   	var maxPage = pi.maxPage;
			   	var startPage = pi.startPage;
			   	var endPage = pi.endPage;
				
				var innerHtmlPage = `<ul class="pagination mt-2 mb-2" style="margin-left:auto; margin-right:auto;">

                <li class="page-item"><a href="#"><button class="page-link" onclick="paging(1);">&laquo;</button></a></li>`;

                if(currentPage <= 1){
					innerHtmlPage += `<li class="page-item disabled"><button class="page-link">&lt;</button></li>`;
                } else {
                	innerHtmlPage += `<li class="page-item"><a href="#"><button class="page-link" onclick="paging(`+(currentPage-1)+`)">&lt;</button></a></li>`;
                }

                for(var i = startPage; i <= endPage; i++){
                   if(currentPage == i){
					innerHtmlPage += `<li class="page-item active"><a href="#"><button class="page-link" disabled>`+i+`</button></a></li>`;
                   } else {
					innerHtmlPage += `<li class="page-item"><a href="#"><button class="page-link" onclick="paging(`+i+`);">`+i+`</button></a></li>`;
                   }                       
                }

                if(currentPage >= maxPage){
                	innerHtmlPage += `<li class="page-item disabled"><button class="page-link">&gt;</button></li>`;
                } else {
                	innerHtmlPage += `<li class="page-item"><a href="#"><button class="page-link" onclick="paging(`+(currentPage+1)+`);">&gt;</button></a></li>`;
                }

                innerHtmlPage += `<li class="page-item"><a href="#"><button class="page-link" onclick="paging(`+maxPage+`);">&raquo;</button></a></li>
             </ul>`;

			$('.pageDiv').append(innerHtmlPage);
		
			 countLimit()
	         commaPrice();
	         ratingCount();
	         
        	}, error : function(data){
        		console.log(data);
        	}
         });
      };
	   
      // 검색어 검색창에 남기기
      $(function(){
         $('#searchBar').val('<%=getText%>');
      });
      
      // 검색 구분자 남기기
      $(function(){      
      $('#searchBy').val('<%=option%>').prop('selected', true);
      });
      
      // 장르 선택시 색깔표시
      $(function(){
         $('#<%=genreCode%>').css({
            "color" : "yellow"
         });
      });
      
      // 장르별 검색된 숫자 표시 
      $('.leftbar').children('li').each(function(idx, item){
         var gCount = 0;
         <% Iterator iter = genreCount.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry<String, Integer> entry = (Map.Entry<String, Integer>) iter.next();
				String iterKey = (String) entry.getKey();
				int iterValue = (int) entry.getValue(); %>
            $(this).children().children().each(function(idx, item){
               if($(this).children('span').attr('id') == '<%=iterKey%>'){
                  var value = <%=iterValue%>;
                  $(this).children('span').text($(this).children('span').text()+"("+value+")");
                  gCount += value;
               }
            });         
         <%}%>            
         if(gCount != 0) $(this).children('span').text($(this).children('span').text()+"("+gCount+")");         
      });

      // 처음 실행 시 가격 콤마, 평점 실행
      $(function(){
   	  	countLimit()
		commaPrice();
		ratingCount();
      });
        
      // 가격 콤마 찍어주기
      function commaPrice(){
          $(".price").each(function(index, item){
             var price = $(this).text();
             $(this).text(price.replace(/\B(?=(\d{3})+(?!\d))/g, ',') +"원");
          });
      };
      
   	  // 평점 표시
      function ratingCount(){
 		 $(".rating").each(function(index, item){
 				console.log($(this).text());
 				var rating = $(this).text().substr(0,3);
 				var count = $(this).text().substr(4,5);				
 				var star = '';
 				if(rating < 1) star = '<i class="far fa-star"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
 				else if(rating < 2) star = '<i class="fas fa-star-half"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
 				else if(rating < 3) star = '<i class="fas fa-star"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
 				else if(rating < 4) star = '<i class="fas fa-star"></i><i class="fas fa-star-half"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
 				else if(rating < 5) star = '<i class="fas fa-star"></i><i class="fas fa-star"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
 				else if(rating < 6) star = '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i>&nbsp;&nbsp;&nbsp;&nbsp;';
 				else if(rating < 7) star = '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>&nbsp;&nbsp;&nbsp;&nbsp;';
 				else if(rating < 8) star = '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i>&nbsp;&nbsp;';
 				else if(rating < 9) star = '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>&nbsp;&nbsp;';
 				else if(rating < 10) star = '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i>';
 				else if(rating == 10) star = '<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>';
 				
 				if(count == 0) $(this).remove();
 				else $(this).html(star+'&nbsp;&nbsp;&nbsp;'+rating+'&nbsp;&nbsp;&nbsp;리뷰('+count+')');
 	         });
 	 };
   
      // 수량 max 100권, min 1권 제한
      function countLimit(){    	  
	      $('#bookCount').on('input', function(){
	         if($('#bookCount').val()>100){
	            alert("책은 100권 이하로 주문 가능합니다.");
	            $('#bookCount').val(100);
	         };
	         
	         if($('#bookCount').val()<1){
	             alert("책은 1권 이상 주문 가능합니다.");
	             $('#bookCount').val(1);
	          };
	      });
      };
      
      // 카테고리 선택 이동
      $('.gSearch').on('click', function(){
         var genreCode = $(this).attr('id');
         console.log(genreCode);
         location.href="<%=request.getContextPath()%>/searchGenre.sb?option=<%=option%>&getText=<%=getText%>&genreCode="+genreCode;
      });   
      
      // 장바구니 버튼
      function insertCart(bookId){
    	  if(<%=isUser%> != null){
     		 var userId = <%=isUser%>;
    		 var bookCount = $('input[name='+bookId+']').val();
			    		 
    		 $.ajax({
    	        	url : "insertCart.ct",
    	        	type : "GET",
    	        	data : {
							userId : userId,
							bookId : bookId,
							bookCount : bookCount
    	        		},
    	        	dataType : "json",
    	        	success : function(data){
    	        		if(data >= 1){
    	        			if(confirm('상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?'))
    	        				location.href="<%=request.getContextPath()%>/cart.ct";
    	        		} else {
    	        			if(confirm('상품이 이미 장바구니에 있습니다. 장바구니로 이동하시겠습니까?'))
    	        				location.href="<%=request.getContextPath()%>/cart.ct";		
    	        		}
    	        	}, error : function(data){
    	        		console.log(data);
    	        	}   	        		
    	        	});
    		 
    	  } else {    		  
			if(confirm('로그인이 필요한 기능입니다. 로그인을 하시겠습니까?')) {
				location.href="<%=request.getContextPath()%>/views/member/jlogin.jsp";
			}
    	  }
      };

      // 바로구매 버튼
      function orderDirect(bookId){
    	  if(<%=isUser%> != null){
     		 var userId = <%=isUser%>;
    		 var bookCount = $('input[name='+bookId+']').val();
			    		 
    		 $.ajax({
    	        	url : "insertCart.ct",
    	        	type : "GET",
    	        	data : {
							userId : userId,
							bookId : bookId,
							bookCount : bookCount
    	        		},
    	        	dataType : "json",
    	        	success : function(data){
        				location.href="<%=request.getContextPath()%>/order.ct?bookUID="+bookId;		
    	        	}, error : function(data){
    	        		console.log(data);
    	        	}   	        		
    	        	});
    		 
    	  } else {    		  
			if(confirm('로그인이 필요한 기능입니다. 로그인을 하시겠습니까?')) {
				location.href="<%=request.getContextPath()%>/views/member/jlogin.jsp";
			}
    	  }
      };
      
   </script>
   
</body>
</html>