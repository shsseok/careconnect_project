<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 액션 페이지 입니다.</title>
</head>
<body>
<jsp:useBean id="communitydb" class="Carepakage.communityDBCP" scope="session"/>
<jsp:useBean id="community" class="Carepakage.communityEntity" scope="session"/>
<%
request.setCharacterEncoding("UTF-8");
String email=(String)session.getAttribute("email");
String expertport=(String)session.getAttribute("expertport");
if(email!=null &&  expertport==null)//일반 사용자가 로그인 상태라면
{
	community.setEmail(email);
	
%>
<jsp:setProperty name="community" property="userName" param="username"/>
<jsp:setProperty name="community" property="boardContent" param="boardcontent"/>
<jsp:setProperty name="community" property="boardTitle" param="boardtitle"/>

<%
communitydb.boardWrite(community);//글 쓰기 db
response.sendRedirect("../Community.jsp");
}
else if(email!=null &&  expertport!=null)//전문가 라면
{
	community.setEmail(email);
	community.setExpertport(expertport);
%>
	
	<jsp:setProperty name="community" property="userName" param="username"/>
	<jsp:setProperty name="community" property="boardContent" param="boardcontent"/>
	<jsp:setProperty name="community" property="boardTitle" param="boardtitle"/>
	
<%
	communitydb.boardWrite(community);
	response.sendRedirect("../Community.jsp");
}
else{
%>
<script>
alert("로그인 후 이용하세요.");
window.location.href = '../loginpage.jsp';
</script>	
	

<%
}
%>


</body>
</html>