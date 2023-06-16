<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>커뷰니티 뷰 액션 입니다 수정과 삭제를 위한 페이지 입니다.</title>
</head>
<body>
<jsp:useBean id="communitydb" class="Carepakage.communityDBCP" scope="session"/>
<jsp:useBean id="community" class="Carepakage.communityEntity" scope="session"/>
<%
String menuAction = request.getParameter("menu");


String boardid=request.getParameter("boardId");
int boardid1=0;
if(boardid != null) {
	boardid1=Integer.parseInt(boardid);
    community.setBoardId(boardid1);
}

if(menuAction.equals("update"))
{
%>



<jsp:setProperty name="community" property="userName" param="username"/>
<jsp:setProperty name="community" property="boardContent" param="boardcontent"/>
<jsp:setProperty name="community" property="boardTitle" param="boardtitle"/>

<% 
communitydb.updateBoardDB(community);
out.println("<script>");
out.println("alert('수정에 성공하셨습니다');");
out.println("location.href='../Community.jsp'");
out.println("</script>");
}
if(menuAction.equals("delete"))
{
	
communitydb.deleteboardDB(boardid1);
		out.println("<script>");
	    out.println("alert('삭제에 성공하셨습니다');");
	    out.println("location.href='../Community.jsp'");
	    out.println("</script>");


}

%>
</body>
</html>