<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 컨트롤러 페이지 입니다. 전문가의 유저 정보 삭제,게시판 관리,리뷰 삭제를 담당합니다.</title>
</head>
<body>
<%@ page import="java.util.ArrayList,Carepakage.*"%>
<%
String expertemail=request.getParameter("email");
String boardid=request.getParameter("boardId");


if(boardid==null && expertemail!=null)
{
	userDBCP user = new userDBCP();
	user.deleteUser2DB(expertemail);
	out.println("<script>");
	out.println("alert('삭제 되었습니다.');");
	out.println("location.href='../Admin.jsp'");
	out.println("</script>");
}
if(expertemail==null && boardid!=null)
{
	int boardid1=Integer.parseInt(boardid);
	communityDBCP community = new communityDBCP();
	community.deleteboardDB(boardid1);
	out.println("<script>");
	out.println("alert('삭제 되었습니다.');");
	out.println("location.href='../Admin.jsp'");
	out.println("</script>");
}


%>
</body>
</html>