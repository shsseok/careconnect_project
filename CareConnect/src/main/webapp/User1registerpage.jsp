<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="styles/style.css">

<html>
<style>
tr
{
    text-align: left;
}
</style>
<meta charset="UTF-8">
<title>치료가 필요한 사용자 회원 등록 페이지 입니다.</title>
</head>
<script language="JavaScript" src="jsfile/user1Register.js" charset="utf-8"></script>
<body>
<%@ include file="header.jsp" %>
<div class="regiseter-box" style="text-align: center;  margin-bottom:98px;">
<div class ="register-container" style="border: 1px solid black; display: inline-block;">
<form name=user1form action="controller/registerAction.jsp" method="post">
<table>
    <tr><td>이름</td></tr>
    <tr><td><input type="text" name="name"></td></tr>
    <tr><td>이메일</td></tr>
    <tr><td><input type="email" name="email"></td></tr>
    <tr><td>이메일 중복 확인</td></tr>
    <tr><td><input type="email" name="email2"></td></tr>
    <tr><td>성별</td></tr>
    <tr><td><input type="radio" name="sex" value="man">남자 <input type="radio" name="sex" value="woman">여자</td></tr>
    <tr><td>연락처</td></tr>
    <tr><td><select name="phone1">
        <option value="">선택하세요</option>
        <option value="011">011</option>
        <option value="010">010</option>
        <option value="033">033</option>
    </select>-<input type="text" name="phone2">-<input type="text" name="phone3"></td></tr>
    <tr><td>치료부위</td></tr>
    <tr><td><select name="sickpart">
        <option value="">선택하세요</option>
        <option value="shoulder">어깨</option>
        <option value="ankle">발목</option>
        <option value="wrist">손목</option>
        <option value="knee">무릎</option>
        <option value="waist">허리</option>
        <option value="spine">척추</option>
    </select></td></tr>
    <tr><td>비밀번호</td></tr>
    <tr><td><input type="password" name="password"></td></tr>
    <tr><td>비밀번호 확인</td></tr>
    <tr><td><input type="password" name="passwordcheck"></td></tr>
    <tr><td>본인 입니까? 보호자 입니까?</td></tr>
    <tr><td><input type="radio" name="who" value="my">본인 <input type="radio" name="who" value="care">보호자</td></tr>
    <tr><td><input type="button" value="회원 가입 완료" onClick="register()"></td></tr>
</table>

</form>

</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>