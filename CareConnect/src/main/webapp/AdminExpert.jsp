<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자가 전문가를 관리하는 페이지 입니다.</title>
</head>
<body>
<%@ page import="java.util.ArrayList,Carepakage.*"%>
<% 
		userDBCP userdb=new userDBCP();
		ArrayList<user2Entity> list = userdb.getUser2List(); 
	   	int counter = list.size();
	   	int row = 0;
	   	
	   	if (counter > 0) {
	%>
    
    <table width=800 border=0 cellpadding=1 cellspacing=3>
    
    <tr>
       <th><font color=red><b>번호</b></font></th>
       <th><font color=red><b>이메일</b></font></th>
       <th><font color=red><b>이름</b></font></th>
       <th><font color=red><b>전문가 권한 암호</b></font></th>
       <th><font color=red><b>소속 의료 기관</b></font></th>
    </tr>
	<%
		for( user2Entity user2 : list ) {
			//홀짝으로 다르게 색상 지정
			String color = "white";
			
	%>
    <tr bgcolor=<%=color %> 
		onmouseover="this.style.backgroundColor='SkyBlue'"
    	onmouseout="this.style.backgroundColor='<%=color %>'">
		<!-- 수정과 삭제를 위한 링크로 id를 전송 -->
       <td align=center><%= user2.getId()%></td>
       <td align=left><%= user2.getEmail()%></td>
       <td align=center><%= user2.getName() %></td>		
       <td align=center><%= user2.getExpertport() %></td>
       <td align=center><%= user2.getPlace() %></td>
       <td align=center><a href="controller/adminAction.jsp?email=<%=user2.getEmail()%>" style="display:block; background:green;">삭제</a></td>
    </tr>
	<%
	    }
	%>
	</table>
	
<% 	}
%>
</body>
</html>