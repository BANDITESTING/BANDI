<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service ERROR</title>
<style>
	@import url(https://fonts.googleapis.com/css?family=Signika:700,300,600);
	
	html, body { height: 100%; }
	body { display: flex; justify-content: center; align-items: center; margin:20px 0; text-align:center; background:beige; overflow:hidden; }
	
	h1 {
	 font-size:5em;
	 font:bold 7.5vw/1.6 'Signika', sans-serif;
	 user-select:none;
	}
	
	h1 span { display:inline-block; animation:float .2s ease-in-out infinite; }
	 @keyframes float {
	  0%,100%{ transform:none; }
	  33%{ transform:translateY(-1px) rotate(-2deg); }
	  66%{ transform:translateY(1px) rotate(2deg); }
	}
	body:hover span { animation:bounce .6s; }
	@keyframes bounce {
	  0%,100%{ transform:translate(0); }
	  25%{ transform:rotateX(20deg) translateY(2px) rotate(-3deg); }
	  50%{ transform:translateY(-20px) rotate(3deg) scale(1.1);  }
	}
	
	span:nth-child(4n) { color:hsl(50, 75%, 55%); text-shadow:1px 1px hsl(50, 75%, 45%), 2px 2px hsl(50, 45%, 45%), 3px 3px hsl(50, 45%, 45%), 4px 4px hsl(50, 75%, 45%); }
	span:nth-child(4n-1) { color:hsl(135, 35%, 55%); text-shadow:1px 1px hsl(135, 35%, 45%), 2px 2px hsl(135, 35%, 45%), 3px 3px hsl(135, 35%, 45%), 4px 4px hsl(135, 35%, 45%); }
	span:nth-child(4n-2) { color:hsl(155, 35%, 60%); text-shadow:1px 1px hsl(155, 25%, 50%), 2px 2px hsl(155, 25%, 50%), 3px 3px hsl(155, 25%, 50%), 4px 4px hsl(140, 25%, 50%); }
	span:nth-child(4n-3) { color:hsl(30, 65%, 60%); text-shadow:1px 1px hsl(30, 45%, 50%), 2px 2px hsl(30, 45%, 50%), 3px 3px hsl(30, 45%, 50%), 4px 4px hsl(30, 45%, 50%); }
	
	h1 span:nth-child(2){ animation-delay:.05s; }
	h1 span:nth-child(3){ animation-delay:.1s; }
	h1 span:nth-child(4){ animation-delay:.15s; }
	h1 span:nth-child(5){ animation-delay:.2s; }
	h1 span:nth-child(6){ animation-delay:.25s; }
	h1 span:nth-child(7){ animation-delay:.3s; }
	h1 span:nth-child(8){ animation-delay:.35s; }
	h1 span:nth-child(9){ animation-delay:.4s; }
	h1 span:nth-child(10){ animation-delay:.45s; }
	h1 span:nth-child(11){ animation-delay:.5s; }
	h1 span:nth-child(12){ animation-delay:.55s; }
	h1 span:nth-child(13){ animation-delay:.6s; }
	h1 span:nth-child(14){ animation-delay:.65s; }
</style>
</head>
<body>
	<h1><span>B</span><span>A</span><span>N</span><span>D</span><span>I</span><span> </span><span>E</span><span>R</span><span>R</span><span>O</span><span>R</span> <span>T</span><span>^</span><span>T</span></h1>
</body>
</html>