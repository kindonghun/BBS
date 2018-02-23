<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	System.out.println("sid:" + session.getId());
	String userID =null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인되어 있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	if(user.getUserID()== null || user.getUserPassword()== null ||
	user.getUserName() ==null||
	user.getUserGender() == null||
	user.getUserEmail()==null){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 항목이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else{
		UserDAO userDAO= new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('이 ID가 이미 있습니다.')");
			script.println("histroy.back()");
			script.println("</script>");
		}
		else { //회원가입을 하였을때 Main페이지로 갈수있게끔 설정
			session.setAttribute("UserID", user.getUserID());
			System.out.println("userId:" + user.getUserID());
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("location.href ='main.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>