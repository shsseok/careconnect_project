<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Carepakage.communityEntity"%>
<%@ page import="Carepakage.communityDBCP"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="styles/community.css">
<title>자유로운 커뮤니티 페이지 입니다.</title>
</head>
<body>


<%@include file = "header.jsp" %>
<%
int pageNumber=1;
if(request.getParameter("pageNumber") !=null)
{
	pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
}

%>

<center>

<h1 style="margin-bottom:10px">커뮤니티 게시판</h1>
<table>
<thead>
<tr>
	<th style="width:50px">번호</th>
	<th>작성자 이름</th>
	<th>게시물 제목</th>
	<th>게시 날짜</th>
</tr>
</thead>

<tbody height="520">
<%
String query=request.getParameter("searchquery");//어떤 제목 검색어로 찾을 껀지에 대해서
String boardtype=request.getParameter("boardtype");
communityDBCP communitydb=new communityDBCP();
ArrayList<communityEntity> list = communitydb.getBoardList(pageNumber);
if(boardtype!=null && boardtype.equals("query"))
{
	list=communitydb.getBoardSearchList(pageNumber, query);
}

for(int i=0;i<list.size();i++)
{
%>

<tr>
	<td><%=list.get(i).getBoardId() %></td>
	<td><%=list.get(i).getUserName() %></td>
	<td onmouseover="this.style.backgroundColor='SkyBlue'"
	onmouseout="this.style.backgroundColor='white'">
	<a href="CommunityView.jsp?boardId=<%=list.get(i).getBoardId()%>"><%=list.get(i).getBoardTitle()%></a></td>
	<td><%=list.get(i).getBoardDate() %></td>
</tr>
<%
} 
%>
</tbody>
<tfoot>
 <tr>
        <td colspan="4">
            <button class="writePostButton" onClick="location.href='Communitywrite.jsp'">글쓰기</button>
       
       <div style="float: right;" class="searchBox">
        <form name=searchquery action="Community.jsp">
                <input type="text" id="searchquery" name="searchquery" placeholder="제목을 입력하세요.">
                <input type="hidden" name="boardtype" value="query">
                <input type="submit" id="searchButton" value="검색">
              
        </form>
        </div>
        </td>	
</tr>
</tfoot>
</table>   
<%
if(pageNumber!=1)
{
%>
<div style="border:1px solid black; display:inline-block; margin:10px; padding:20;">
<a href="Community.jsp?pageNumber=<%=pageNumber -1%>" class=btn >이전 페이지</a></div>

<%
}if(communitydb.nextPage(pageNumber+1))
{
%>
<div style="border:1px solid black; display:inline-block; margin:10px; padding:20;">
<a href="Community.jsp?pageNumber=<%=pageNumber +1 %>" class=btn >다음 페이지</a></div>
<% 
}
%>

</center>

<%@include file = "footer.jsp" %>
</body>

</html>