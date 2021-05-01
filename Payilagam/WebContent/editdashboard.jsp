<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="reg.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Edit Dashboard</title>
    <link rel = "icon" href = "https://www.freepngimg.com/download/temp/66760-web-google-icons-chrome-computer-icon-browser_16x16.ico" type = "image/x-icon">
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<style>
body {
	background: #BA68C8
}
</style>

<body>

	<!--------------------------------------------------- JAVA CODE START---------------------------------------------------------->

	<%
	String name = (String) session.getAttribute("name");
	out.print(name);
	String firstname = "";
	String email = "";
	String mobile = "";
	String session_user_id = session.getAttribute("id").toString();
	Userdetails dp = new Userdetails();
	ResultSet s = dp.details(session_user_id);
	if (s.next()) {
		firstname = s.getString("name");
		email = s.getString("email");
		mobile = s.getString("mobile");

	}
	%>">

	<!--------------------------------------------------- JAVA CODE END---------------------------------------------------------->

	<!--------------------------------------------------- DESIGN START---------------------------------------------------------->
	
	
	<form action="editdashboardprocess.jsp" type="post">
	<div class="container rounded bg-white mt-5">
		<div class="row">
			<div class="col-md-4 border-right">

				<!-- Default image -->

				<div
					class="d-flex flex-column align-items-center text-center p-3 py-5">
					<img class="rounded-circle mt-5"
						src="https://bootdey.com/img/Content/avatar/avatar7.png"
						width="90"><input type="file" class="form-control" placeholder="Profile" name="image"> <span class="font-weight-bold"><%=name%></span>
				</div>
			</div>
			<div class="col-md-8">
				<div class="p-3 py-5">
				
					<div class="row mt-2">
						<div class="col-md-6">
							<input type="text" class="form-control" placeholder="name" name="name"
								value="<%=firstname%>">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-6">
							<input type="text" class="form-control" placeholder="Email" name="email"
								value="<%=email%>">
						</div>

					</div>
					<div class="row mt-3">
						<div class="col-md-6">
							<input type="text" class="form-control" placeholder="address" name="mobile"
								value="<%=mobile%>">
						</div>
					</div>
	                   <div class="row mt-3">
						     <div class="col-md-6">
								<button class="btn btn-primary profile-button" type="submit">Update</button>
						</div>
				</div>

			</div>
		</div>
	</div>
</form>
</body>

</html>