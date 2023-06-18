<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 페이지 컨트롤러 입니다.</title>
</head>
<body>
<jsp:useBean id="userDbcp" class="Carepakage.userDBCP"/>
<jsp:useBean id="userMaching" class="Carepakage.userMachingchoice" scope="session"/>


<%  


String userSelectpart=request.getParameter("selectedPart");
String userSelectService1=request.getParameter("selectedService1");
String userSelectService2=request.getParameter("selectedService2");

%>
<jsp:setProperty  name="userMaching" property="sickpart" value="<%=userSelectpart %>"/>
<jsp:setProperty  name="userMaching" property="service1" value="<%=userSelectService1 %>" />
<jsp:setProperty  name="userMaching" property="service2" value="<%=userSelectService2 %>" />

<%
response.sendRedirect("../Matchingpage.jsp");
%>




</body>
</html>