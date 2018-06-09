<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="AdminMain.jsp">반디불이 책방</a>
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
                    <ul class="nav" id="side-menu">
                        <li><img src ="<%=request.getContextPath()%>/resources/images/common/bandi.png" style ="width:100%; height:auto;"></li>
                        
                        <li>
                            <a href="<%=request.getContextPath()%>/views/admin/AdminMain.jsp"><i class="fa fa-dashboard fa-fw"></i>Home</a>
                        </li>
                        
                        <!-- <li>
                        	<a href="AdminMain.jsp"><i class="fa fa-audio-description fa-fw"></i>Event Banner</a>
                        </li> -->
                        
                        <li>
                        	<a href="<%=request.getContextPath()%>/views/admin/RecommendBooks.jsp"><i class="fa fa-book fa-fw"></i>Recommend Book</a>
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