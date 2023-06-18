<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리자 페이지 입니다.</title>
</head>
<body>
<%@ page import="java.util.ArrayList,Carepakage.*"%>
<% 
		reviewDBCP reviewdb=new reviewDBCP();
		ArrayList<reviewEntity> list = reviewdb.getReviewEntireList(); 
	   	int counter = list.size();
	   	int row = 0;
	   	
	   	if (counter > 0) {
	%>
    
    <table width=800 border=0 cellpadding=1 cellspacing=3>
    
    <tr>
    <th><font color=red><b>리뷰 번호</b></font></th>
       <th><font color=red><b>작성자</b></font></th>
       <th><font color=red><b>이용 후기</b></font></th>
       <th><font color=red><b>별점</b></font></th>
  
    </tr>
	<%
		for( reviewEntity review : list ) {
			//홀짝으로 다르게 색상 지정
			String color = "white";
			
	%>
    <tr bgcolor=<%=color %> 
		onmouseover="this.style.backgroundColor='SkyBlue'"
    	onmouseout="this.style.backgroundColor='<%=color %>'">
		<!-- 수정과 삭제를 위한 링크로 id를 전송 -->
       <td align=center><%=review.getReviewid()%></td>
       <td align=left><%=review.getUsername() %></td>
       <td align=center><%=review.getReview()  %></td>		
       <td align=center><%= review.getRating() %></td>
       <td align=center><a href="controller/adminAction.jsp?reviewId=<%=review.getReviewid()%>" style="display:block; background:green;">삭제</a></td>
    </tr>
	<%
	    }
	%>
	</table>
	
<% 	}
%>
</body>
</html>