<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 컨트롤러 입니다</title>
</head>

<body>

<% 

if(session.getAttribute("email") != null)
{ 
	session.invalidate();
	try{
%>
		<script> alert("로그아웃 되었습니다.");
        window.location.href = "../main.jsp";</script>
<% 		
		
	}
	catch(Exception e)
	{
		out.println("An error occurred: " + e.getMessage());
	}
	
}
%>
	

	
	




</body>
</html>