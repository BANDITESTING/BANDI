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
    <link rel="stylesheet" href= "<%=request.getContextPath()%>/resources/css/admin/font-awesome.min.css?ver=1" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script src ="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js?ver=1"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js?ver=1"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/metisMenu.min.js?ver=1"></script>
	<script src ="<%=request.getContextPath()%>/resources/js/admin/sb-admin-2.min.js?ver=1"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gugi">
	<script src ="<%=request.getContextPath()%>/resources/js/main/owl.carousel.js"></script>
	<link href = "<%=request.getContextPath()%>/resources/css/main/owl.carousel.css" rel ="stylesheet">
		<link href = "<%=request.getContextPath()%>/resources/css/main/owl.theme.default.css" rel = "stylesheet">
	
<title>Admin Event Title</title>
<style>

img{
	width:100%;
	height: auto;
}
</style>
</head>
<body>
	<div id="wrapper">
		<%@include file ="adminNav.jsp" %>
		<div id="page-wrapper">
			<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" style ="font-family: Gugi">BANDI 이벤트 배너</h1>
                </div>
                
                <div class="col-lg-12">
                	<div class="panel panel-default">
                		<div class="panel-heading" style ="background-color:#5F4B8B; color:snow;">
                            BANDI EVENT BANNER
                        </div>
                        <div class="panel-body">
                        	<div class ="w3-row">
	                        	<div class="loop owl-carousel owl-theme" id ="bandirecommend">
	                        		<div class="item">
	                        			<img src ="<%=request.getContextPath()%>/resources/images/eventBanner/banner1.jpg">
	                        		</div>
	                        		
	                        		<div class="item">
	                        			<img src ="<%=request.getContextPath()%>/resources/images/eventBanner/banner2.jpg">
	                        		</div>
	                        		
	                        		<div class="item">
	                        			<img src ="<%=request.getContextPath()%>/resources/images/eventBanner/banner3.jpg">
	                        		</div>
	                        		
	                        		<div class="item">
	                        			<img src ="<%=request.getContextPath()%>/resources/images/eventBanner/banner4.jpg">
	                        		</div>
	                        	</div>
                        	</div>
                        </div>
                	</div>
                </div>
                
            </div>
		</div>
	</div>
	
	<script>
	jQuery(document).ready(function($) {
        $('.loop').owlCarousel({
          center: false,
          items: 2,
          loop: true,
          margin: 40,
          autoplay:true,
          autoplayTimeout: 2000,
          autoplayHoverPause:true,
          responsive:{
            
            100 : {
              items : 1
            },

            400 : {
              items : 1
            },

            600: {
              items : 1
            },
            
            1100: {
              items: 2
            }, 
          }
        }); 
      });
	</script>
	
</body>
</html>