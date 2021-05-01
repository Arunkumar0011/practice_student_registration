<%@page import="java.sql.*"%>
<%@page  import="reg.*"%>
 <%@page  import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String email = request.getParameter("email");
String password = request.getParameter("password");

Userdetails log = new Userdetails();

HashMap m = log.login(email,password);
if(m.get("id") !=null){
	
	session.setAttribute("id", m.get("id"));
	session.setAttribute("name",m.get("name"));
	
	response.sendRedirect("dashboard.jsp");
	
}else{
	
	out.print("Invalide credential !!");
}

%>



</body>
</html>