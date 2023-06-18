<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Carepakage.communityEntity"%>
<%@ page import="Carepakage.communityDBCP"%>
<%@ page import="Carepakage.user1Entity"%>
<%@ page import="Carepakage.user2Entity"%>
<%@ page import="Carepakage.userDBCP"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/communitywrite.css">
<meta charset="UTF-8">
<title>글 view 페이지 입니다.</title>
</head>
<body>
<%@include file = "header.jsp" %>
<%
String email = (String)session.getAttribute("email");
String expertport = (String)session.getAttribute("expertport");
String userType=(String)session.getAttribute("userType");
 

int boardid=0;
if(request.getParameter("boardId")!=null)
{
	boardid=Integer.parseInt(request.getParameter("boardId"));
}
communityDBCP communitydb=new communityDBCP();
communityEntity community= new communityEntity(); 
community=communitydb.getBoard(boardid);


 


%>

<div>
<center>
<h1 style="margin-bottom:10px">게시판 상세 페이지</h1>
<form name="communityviewform" action="controller/communityviewAction.jsp">
    
    <table>
        <input type=hidden name=boardId value="<%=boardid%>">
        <input type=hidden name=menu value="">
        <tr>
            <td><label for="username">작성자</label></td>
            <td><input type="text" id="" name="username" value="<%=community.getUserName() %>"required></td>
        </tr>
        <tr>
            <td><label for="boarddate">작성일자</label></td>
            <td><input type="text" id="boarddate" name="boarddate" value="<%=community.getBoardDate() %>" required></td>
        </tr>
        <tr>
            <td><label for="boardtitle">제목</label></td>
            <td><input type="text" id="boardtitle" name="boardtitle" value="<%=community.getBoardTitle()%>" required></td>
        </tr>
        <tr>
            <td><label for="boardcontent">내용</label></td>
            <td><textarea id="boardcontent" name="boardcontent" rows="15" cols="50"  max=2028 value="<%=community.getBoardContent() %>" required><%=community.getBoardContent() %></textarea></td>
        </tr>
        <tr>
        	<%
        	
        	
        	if(email!=null && community.getClienttype().equals("normal") && email.equals(community.getEmail()) && expertport==null) {  //일반 사용자 확인
        	%>
        	<td style="float:right;"><input type="button" value="삭제" onClick="deletecheck()"></td>        	
        	<td style="float:right;"><input type="button" value="수정" onClick="updatecheck()"></td>	
        	<%         		
        	}	

        	if(email!=null && community.getClienttype().equals("expert") && email.equals(community.getEmail()) && expertport!=null) { // 전문가 확인
        	%>	
        	<td style="float:right;"><input type="button" value="삭제" onClick="deletecheck()"></td>        	
        	<td style="float:right;"><input type="button" value="수정" onClick="updatecheck()"></td>	
        	<%
        	}
        	%>

        		
    		<td style="float:right;"><input type="button" value="목록보기" onClick="location.href='Community.jsp'"></td>
    		
    	</tr>
    </table>
  	</form>


</center>
</div>

<%@include file = "footer.jsp" %>
</body>
<script language=JavaScript src="jsfile/communityview.js" charset="utf-8"></script>
</html>
