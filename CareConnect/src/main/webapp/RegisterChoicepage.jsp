<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="styles/style.css">

<html>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="regiseter-choice-box" style="text-align: center;">
<div class ="register-choice-container" style="display: inline-block; height:557px" >

	<h4>치료나 운동을 하고 싶어요!</h4>
	
	<p><button onclick="location.href='User1registerpage.jsp'">일반 고객</button>
	<h4>전문가로써 활동하고 싶어요!</h4>
	
	<p><button onclick="location.href='User2registerpage.jsp'">전문가 고객</button></p>

</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>