<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%
    response.setStatus(200);
	request.setCharacterEncoding("EUC-KR");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>HTTP Status - <%= request.getParameter("code") %></h1>
	<h2>메세지 - <%= request.getParameter("message") %></h2>
	<%= request.getParameter("jsonData") %>
</body>