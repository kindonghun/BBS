<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viemport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP Web Site</title>
</head>
<body>
<% //현재 세션이 존재할경우 아이디값을 받아서 넣어준다.
	String userID = null;
	if(session.getAttribute("UserID")!=null){
		userID =(String)session.getAttribute("UserID");
	}
	System.out.println("main userid:"+userID);
%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="mbs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP Web Site</a>
		</div>
		<div class="collapse navbar-collapse"
		
			id="bs-exampls-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
			if(userID==null){
			
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="faise">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				<li>
			</ul>
			<%
				}else{
			%>
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="faise">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				<li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>