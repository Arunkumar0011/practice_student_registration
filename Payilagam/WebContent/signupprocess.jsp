<%@page import="java.sql.*"%>
<%@page  import="reg.*"%>
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
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String password = request.getParameter("password");

Userdetails signproc= new Userdetails();

boolean isRegister = signproc.register(name,mobile,email,password);
out.print(isRegister);
if(isRegister == true){
	response.sendRedirect("Registersuccess.html");
}
else{
	response.sendRedirect("Registerfailure.html");
}

%>
</body>
</html>