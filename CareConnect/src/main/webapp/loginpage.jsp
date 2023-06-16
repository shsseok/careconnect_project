<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/style.css">
</head>

<body>
<%@include file = "header.jsp" %>

<div class="login-box" style="text-align: center;" >
<div class ="login-container" style="display: block; height:557px; " >

<form name=loginform action="controller/loginaction.jsp" method="POST">
<input type="radio" name="client" value="normal" onClick="expertradio(false)">일반 고객
<input type="radio" name="client" value="expert" onClick="expertradio(true)">전문가 고객
	<p>이메일: <input type="email" name="email">
	<p>비밀번호: <input type="password" name="password">
	<p class="portbutton" style="display: none;">관리자 권한 비밀번호(전문가 필수 입력): <input type="password" name="expertport"></p>
	<p><input type="button" value="로그인" onClick="login()">
	<p><input type="reset" value="다시입력">
</form>
</div>
</div>
<%@include file = "footer.jsp" %>
</body>
<script language=JavaScript src="jsfile/loginform.js" charset="utf-8"></script>
</html>