<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/style.css">
<meta charset="UTF-8">
<style>

</style>
</head>
<body>
<jsp:useBean id="user1" class="Carepakage.user1Entity"/>
<%if(session.getAttribute("email") != null && session.getAttribute("expertport")== null) 
{%>

<button onclick="location.href='Matchingfitpage.jsp'" style="display:block; border-radius:5px; padding:20px; background-color: rgba(24, 208, 8, 0.5);">매칭하러가기</button>
<%} else
{
%>
<button onclick="location.href='Matchingfitpage.jsp'" style="display:none; ">매칭하러가기</button>
<%}
%>

</body>
</html>