<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viemport" content="width=device-width" ,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP Web Site</title>
</head>
<body>
<% //현재 세션이 존재할경우 아이디값을 받아서 넣어준다.
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID =(String)session.getAttribute("userID");
	}
	System.out.println("main userid:"+userID);
	
	int pageNumber =1;
	if(request.getParameter("pageNumber")!=null){
		pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
	}
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
				<li><a href="main.jsp">메인</a></li>
				<li  class="active"><a href="bbs.jsp">게시판</a></li>
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
	<div class="container">
		<div class="row">	<!-- 짝수와홀수가 번갈아가면서 색상이변경하는 요소 table-striped -->
			<table class="table table-striped" >
			<thead>
				<tr>
				<th style ="background-color:#eeeeee; text-align: center;">번호</th>
				<th style ="background-color:#eeeeee; text-align: center;">제목</th>
				<th style ="background-color:#eeeeee; text-align: center;">작성자</th>
				<th style ="background-color:#eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list =bbsDAO.getList(pageNumber);
					for(int i=0; i< list.size();i++){
				%>
				<tr>
				<td><%=list.get(i).getBbsID() %></td>
				<td><a href="view.jsp?bbsID<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle() %></a></td>
				<td><%= list.get(i).getUserID()%></td>
				<td><%= list.get(i).getBbsDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
			</table>
			<a href="write.jsp" class="btn btn-primary pull-rigth">글쓰기</a> <!-- 새로운 write.jsp 페이지로 만들고
																			하나의버튼이 오른쪽에고정할수있는 글쓰기-->
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>