<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.semi.bandi.model.vo.*" %>
<!DOCTYPE html>
<% 
	User user = (User)session.getAttribute("user"); 
	if(user == null || session == null) response.sendRedirect(request.getContextPath() + "/views/common/errorPage.jsp");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/bootstrap.min.css?ver=1">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/sb-admin-2.min.css?ver=1">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/recommendBooks.css">
<link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/font-awesome.min.css?ver=1" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
<script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js?ver=1"></script>
<script src ="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js?ver=1"></script>
<script src ="<%=request.getContextPath()%>/resources/js/admin/metisMenu.min.js?ver=1"></script>
<script src ="<%=request.getContextPath()%>/resources/js/admin/sb-admin-2.min.js?ver=1"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gugi">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gaegu">

<style>
	.selectedImage{
		border:5px solid #773376;
	}
	
</style>

<title>반디 추천</title>
</head>
<body>
	<div id="wrapper">
		<%@include file ="adminNav.jsp" %>
		
		<div id="page-wrapper">
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header font-header">추천 BOOK 10!</h1>
                </div>
            </div>
            
  		<div class="panel-body">
            <div class= "col-lg-8" style ="border-right: 1px dotted purple">
            	 <div class ="row">
            		<div class ="hover14 col-lg-3">
      					<figure><img id ="img1" onclick="getInfo(name,id);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img2" onclick="getInfo(name,id);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img3" onclick="getInfo(name,id);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img4" onclick="getInfo(name,id);"/></figure>
				    </div>
            	</div>
            	
            	<div class ="row" style="margin-top:50px;">
            		<div class ="hover14 col-lg-3">
      					<figure><img id ="img5" onclick="getInfo(name,id);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img6" onclick="getInfo(name,id);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img7" onclick="getInfo(name,id);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img8" onclick="getInfo(name,id);"/></figure>
				    </div>
            	</div>
            	
            	<div class ="row" style="margin-top:50px;">
            		<div class ="hover14 col-lg-3">
      					<figure><img id ="img9" onclick="getInfo(name,id);"/></figure>
				    </div>
				    
				    <div class ="hover14 col-lg-3">
      					<figure><img id ="img10" onclick="getInfo(name,id);"/></figure>
				    </div>
				    
				    
            	</div>
            </div>
            
            <div class ="col-lg-4">
            	<div class ="row">
            		<div class='card-wrapper'>
					  <div class='card' data-toggle-class='flipped'>
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
					            Name: <%if(user != null) {%>
					            <span><%=user.getmName()%></span>
					          </h3>
					          <h3>
					            Email:
					            <span><%=user.getmEmail()%></span>
					          </h3>
					          <h3>
					            Phone:
					            <span><%=user.getmPhone()%></span> <%} %>
					          </h3>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
            	</div>
            	
            	<div class ="row" style ="margin-top: 50px; margin-left: 20px; margin-right :50px; border :3px dotted #5F4B8B;" >
            	
             		<div class ="col-lg-12 informText">
             			제목 : <span id ="inTitle"></span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			ISBN : <span id ="inISBN"> </span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			 장르 : <span id ="inGenre"></span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			 작가 : <span id ="inWriter"></span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			 페이지 : <span id ="inPage"></span>
             		</div>
             		
             		<div class ="col-lg-12 informText">
             			 가격 : <span id ="inPrice"></span>
             		</div>
            	</div>
            	
            	<div class ="row">
             			<button class='myButt one' onclick="changeBtn();">
							<div class='insider'></div>
								CHANGE
						</button>
             	</div>
            </div>
          </div>
          
          <!-- MODAL -->
          <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">×</button>
		          <h4 class="modal-title">Modal Header</h4>
		        </div>
		        <div class="modal-body">
		          <p>바꿀 책 제목 입력</p>
		          <input type ="text" id="searchInput"/> <button type="button" onclick="searchBtn()">검색</button> <br> <br>
		          <select id ="selectWcode" style ="width: 100%">
		          	<option value="no">선택하세요</option>
		          </select>
		          <br><br>
		          <div class= "row" id="detailModal" style ="display:none;">
		          	<div class ="col-lg-4">
		          		<img id ="modalImg"src ="" style ="width:100%; height: 250px;">
		          	</div>
		          	
		          	<div class ="col-lg-8" style ="font-size:1.1em;">
		          		제목 :<span id ="modalTitle"></span> <br><br>
		          		ISBN :<span id ="modalISBN"></span> <br><br>
		          		작가 :<span id ="modalWriter"></span> <br><br>
		          		장르 : <span id ="modalGenre"></span> <br><br>
		          		페이지 : <span id ="modalPage"></span> <br><br>
		          		가격 : <span id ="modalPrice"></span> <br>
		          	</div>
		          </div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn" id="modalSave" style="background:#5F4B8B; color:snow;">SAVE</button>
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
                 
		</div>
	</div>
	<script>
	$(function(){
		$.ajax({
			url : "/BANDI/getRecBooks.find",
			type: "POST",
			success: function(data){
				var imagePath = "<%=request.getContextPath()%>/resources/bookimage/";
				$('#img1').attr('src',imagePath + data[0].mImagePath);
				$('#img1').attr('name',data[0].mISBN);
				
				$('#img2').attr('src',imagePath + data[1].mImagePath);
				$('#img2').attr('name',data[1].mISBN);
				
				$('#img3').attr('src',imagePath + data[2].mImagePath);
				$('#img3').attr('name',data[2].mISBN);
				
				$('#img4').attr('src',imagePath + data[3].mImagePath);
				$('#img4').attr('name',data[3].mISBN);
				
				$('#img5').attr('src',imagePath + data[4].mImagePath);
				$('#img5').attr('name',data[4].mISBN);
				
				$('#img6').attr('src',imagePath + data[5].mImagePath);
				$('#img6').attr('name',data[5].mISBN);
				
				$('#img7').attr('src',imagePath + data[6].mImagePath);
				$('#img7').attr('name',data[6].mISBN);
				
				$('#img8').attr('src',imagePath + data[7].mImagePath);
				$('#img8').attr('name',data[7].mISBN);
				
				$('#img9').attr('src',imagePath + data[8].mImagePath);
				$('#img9').attr('name',data[8].mISBN);
				
				$('#img10').attr('src',imagePath + data[9].mImagePath);
				$('#img10').attr('name',data[9].mISBN);
			},
			error : function(data){
				alert('erorr');
			}
		});
	});
	
	function searchBtn()
	{
		var mTitle = $('#searchInput').val();
		if(mTitle == "" || mTitle == null)
		{alert('검색어를 입력해주세요.');}
		else
		{
			var $select = $('#selectWcode');
			$select.find('option').remove();
			$select.append("<option value='no'>검색되었습니다. 선택하세요</option>");
			$.ajax({
				url: "/BANDI/findByTitle.search",
				type: "POST",
				data : {title:mTitle},
				success : function(data){
					if(data.error != "error")
					for(var i = 0; i <data.length; i++)
					{
						$select.append("<option value='" + data[i].mISBN + "'>" + data[i].mTitle + "</option>");
					}
				}, error: function(){}
			});
		}
	}
	
	$('#modalSave').on('click', function(){
		var select = $('#selectWcode option:selected');
		if(select.val() == "no")
		{
			alert('선택상자를 고르셔야합니다.');
		}else
		{
			// Execute Change Model.
			$.ajax({
				url: "/BANDI/changeBANDIBook.ch",
				type:"POST",
				data:{
					before : $('#inISBN').text(),
					after  : $('#modalISBN').text()		  
				 },
				success : function(data){
					if(data != "error")
					{
						var imagePath = "<%=request.getContextPath()%>/resources/bookimage/";
						$('.selectedImage').attr('src', imagePath+data.mImagePath);
						$('.selectedImage').attr('name', data.mISBN);
						alert('변경되었습니다.');
					}else
					{
						// GO TO ERROR PAGE
						alert('중복 등록은 불가합니다.');
					}
					
				}, error : function(){
					
				}
			});
			
			$("#myModal").modal('hide');
		}
	});
	
	function getInfo(name,id)
	{
		
		$.ajax({
			url: "/BANDI/getRecInfo.get",
			type:"POST",
			data: {ISBN:name},
			success: function(data)
			{
				if(data.error == "error"){} // GO TO ERROR PAGE
				selectedImg(id);	
				$('#inTitle').text(data.mTitle);
				$('#inISBN').text(data.mISBN);
				$('#inGenre').text(data.mGenreCode);
				$('#inWriter').text(data.mWriterName);
				$('#inPage').text(data.mPage);
				$('#inPrice').text(data.mPrice);
			},
			error: function(data)
			{	
			}
		});
	}
	
	function selectedImg(id)
	{
		$('img').removeClass('selectedImage');
		switch(id)
		{
			case "img1": $('#img1').addClass('selectedImage'); break;
			case "img2": $('#img2').addClass('selectedImage'); break;
			case "img3": $('#img3').addClass('selectedImage'); break;
			case "img4": $('#img4').addClass('selectedImage'); break;
			case "img5": $('#img5').addClass('selectedImage'); break;
			case "img6": $('#img6').addClass('selectedImage'); break;
			case "img7": $('#img7').addClass('selectedImage'); break;
			case "img8": $('#img8').addClass('selectedImage'); break;
			case "img9": $('#img9').addClass('selectedImage'); break;
			case "img10": $('#img10').addClass('selectedImage'); break;
		}
	}
	
	function changeBtn()
	{
		var text  = $('#inTitle').text();
		
		if(text == "" || text == null)
		{
			alert('책을 선택하셔야 합니다.');
		}
		else
		{
			$('.modal-title').text($('#inTitle').text());
			$('#searchInput').val("");
			$('#detailModal').css('display',"none");
			$('#selectWcode').find('option').remove();
			$('#selectWcode').append("<option value ='no'>선택하세요</option>");
			// MODAL OPEN
			$("#myModal").modal();
		}
	}
	
	$('#selectWcode').on('change', function(){
		var writerCode = $('#selectWcode option:selected').val();
		var path = "<%=request.getContextPath()%>/resources/bookimage/";
		if(writerCode != "no")
		{
			$.ajax({
				url : "/BANDI/getbookISBN.search",
				type :"POST",
				data : {ISBN : writerCode},
				success: function(data) {
					path += data.mImagePath;
					$('#modalImg').attr('src', path);
					$('#modalTitle').text(data.mTitle);
					$('#modalISBN').text(data.mISBN);
					$('#modalWriter').text(data.mWriterName);
					$('#modalGenre').text(data.mGenreCode);
					$('#modalPage').text(data.mPage);
					$('#modalPrice').text(data.mPrice);
				},error: function(data){
					// go to error page.
				}
			});
			
			$('#detailModal').css('display',"block");	
		}else
		{
			$('#detailModal').css('display',"none");
		}
	});
		
	</script>
	
	<script>
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