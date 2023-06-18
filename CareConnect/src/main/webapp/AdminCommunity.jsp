<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 관리자 페이지 입니다.</title>
</head>
<body>
<%@ page import="java.util.ArrayList,Carepakage.*"%>
<% 
		communityDBCP community=new communityDBCP();
		ArrayList<communityEntity> list = community.getBoardentireList(); 
	   	int counter = list.size();
	   	int row = 0;
	   	
	   	if (counter > 0) {
	%>
    
    <table width=800 border=0 cellpadding=1 cellspacing=3>
    
    <tr>
       <th><font color=red><b>게시판 번호</b></font></th>
       <th><font color=red><b>작성자 이름</b></font></th>
       <th><font color=red><b>글 제목</b></font></th>
       <th><font color=red><b>글 내용</b></font></th>
       <th><font color=red><b>삭제 여부</b></font></th>
       <th><font color=red><b>게시 날짜</b></font></th>
       <th><font color=red><b>고객 유형</b></font></th>
    </tr>
	<%
		for( communityEntity board : list ) {
			//홀짝으로 다르게 색상 지정
			String color = "white";
			
	%>
    <tr bgcolor=<%=color %> 
		onmouseover="this.style.backgroundColor='SkyBlue'"
    	onmouseout="this.style.backgroundColor='<%=color %>'">
		
       <td align=center><%=board.getBoardId() %></td>
       <td align=left><%=board.getUserName()%></td>
       <td align=center><%=board.getBoardTitle()  %></td>		
       <td align=center><%=board.getBoardContent()  %></td>
       <td align=center><%=board.getBoardAvailable() %></td>
       <td align=center><%=board.getBoardDate()  %></td>
       <td align=center><%=board.getClienttype() %></td>
       <td align=center><a href="controller/adminAction.jsp?boardId=<%= board.getBoardId()%>" style="display:block; background:green;">삭제</a></td>
    </tr>
	<%
	    }
	%>
	</table>
	
<% 	}
%>
</body>
</html>