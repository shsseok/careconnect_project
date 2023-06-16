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
<title>전문가들을 회원 등록 페이지 입니다.</title>
</head>
<script language="JavaScript" src="jsfile/user2Register.js" charset="UTF-8"></script>
<body>
<%@ include file="header.jsp" %>
<div class="regiseter-box" style="text-align: center;">
<div class ="register-container" style="border: 1px solid black; display: inline-block;">
<form name=user2form action="controller/register2Action.jsp" method="post">
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
    <tr><td>경력</td></tr>
    <tr><td><select name="career">
        <option value="">선택하세요</option>
        <option value="1">1년</option>
        <option value="2">2년</option>
        <option value="3">3년</option>
        <option value="4">4년</option>
    </select></td></tr>
    <tr><td>비밀번호</td></tr>
    <tr><td><input type="password" name="password"></td></tr>
    <tr><td>비밀번호 확인</td></tr>
    <tr><td><input type="password" name="passwordcheck"></td></tr>
    <tr><td>본인의 강점 서비스 부위</td></tr>
    <tr><td><select name="strengthpart">
        <option value="">선택하세요</option>
        <option value="shoulder">어깨</option>
        <option value="ankle">발목</option>
        <option value="wrist">손목</option>
        <option value="knee">무릎</option>
        <option value="waist">허리</option>
        <option value="spine">척추</option>
    </select></td></tr>
    <tr><td>소속 의료 기관</td></tr>
    <tr><td><input type="text" name="place"></td></tr>
    <tr><td>전문가 권한 암호</td></tr>
    <tr><td><input type="password" name="expertport"></td></tr>
    <tr><td><input type="button" value="회원 가입 완료" onClick="register()"></td></tr>
</table>

</form>

</div>
</div>
<%@ include file="footer.jsp" %>
</body>

</html>