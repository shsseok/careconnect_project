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
String reviewid=request.getParameter("reviewId");

if(boardid==null && reviewid==null && expertemail!=null)
{
	userDBCP userdb = new userDBCP();
	userdb.deleteUser2DB(expertemail);
	out.println("<script>");
	out.println("alert('삭제 되었습니다.');");
	out.println("location.href='../Admin.jsp'");
	out.println("</script>");
}
if(expertemail==null && reviewid==null && boardid!=null)
{
	int boardid1=Integer.parseInt(boardid);
	communityDBCP communitydb = new communityDBCP();
	communitydb.deleteboardDB(boardid1);
	out.println("<script>");
	out.println("alert('삭제 되었습니다.');");
	out.println("location.href='../Admin.jsp'");
	out.println("</script>");
}
if(expertemail==null && boardid==null && reviewid!=null )
{
	int reviewid1=Integer.parseInt(reviewid);
	reviewDBCP reviewdb = new reviewDBCP();
	reviewdb.deleteReviewDB(reviewid1);
	out.println("<script>");
	out.println("alert('삭제 되었습니다.');");
	out.println("location.href='../Admin.jsp'");
	out.println("</script>");
}


%>
</body>
</html>