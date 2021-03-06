<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<style>
		.navBarText{
			font-family: 'Gaegu';
			font-size: 1.5em;
		}
		
		.navBarText a{
			color : rgb(95,75,139);
		}
				
	</style>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gaegu">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background: url('<%=request.getContextPath()%>/resources/images/eventBanner/cabk.png'); color:snow;">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
            </div>

            <ul class="nav navbar-top-links navbar-right">       
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<%=request.getContextPath()%>/index.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                        
                        <li><a href="<%=request.getContextPath()%>/views/main/Main.jsp"><i class="fa fa-mail-reply fa-fw"></i> Back</a>
                        </li>
                    </ul>
                    
                </li>
                
            </ul>

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav navBarText" id="side-menu">
                        <li><img src ="<%=request.getContextPath()%>/resources/images/common/bandi.png" style ="width:100%; height:auto;"></li>
                        
                        <li>
                            <a href="<%=request.getContextPath()%>/views/admin/AdminMain.jsp"><i class="fa fa-dashboard fa-fw"></i>Home</a>
                        </li>
                        
                        <li>
                        	<a href="<%=request.getContextPath()%>/views/admin/AdminEvent.jsp"><i class="fa fa-audio-description fa-fw"></i>Event Banner</a>
                        </li>
                        
                        <li>
                        	<a href="<%=request.getContextPath()%>/views/admin/RecommendBooks.jsp"><i class="fa fa-book fa-fw"></i>BADNI 관리자 추천 책</a>
                        </li>

                        <li>
                                <a href="#"><i class="fa fa-edit fa-fw"></i>BANDI INFO<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/views/admin/insertBook.jsp">책정보</a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/views/admin/insertWriter.jsp">작가 정보</a>
                                    </li>
                                    
                                    <li>
                                        <a href="<%=request.getContextPath()%>/views/admin/AdminInfo.jsp">관리자 정보</a>
                                    </li>
                                </ul>
                                
                        </li>
                        
                    </ul>
                </div>
                
            </div>
            
        </nav>