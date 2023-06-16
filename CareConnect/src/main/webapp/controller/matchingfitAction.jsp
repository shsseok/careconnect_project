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
<jsp:useBean id="user2" class="Carepakage.user2Entity"/>
<jsp:useBean id="userMaching" class="Carepakage.userMachingchoice" scope="session"/>
<jsp:useBean id="user1" class="Carepakage.user1Entity"/>

<%  
String userEmail=(String) session.getAttribute("email");
String userSickpart=(String) session.getAttribute("sickpart");

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