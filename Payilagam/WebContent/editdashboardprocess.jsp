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

String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");

String session_user_id = session.getAttribute("id").toString();
Userdetails editdash = new Userdetails();

boolean editstatus = editdash.editdashboard(session_user_id,name,email,mobile);
if(editstatus == true){
		
	response.sendRedirect("dashboard.jsp");
	
}else{
	
	out.print("Update Failure !!");
}

%>



</body>
</html>