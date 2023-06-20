<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/communitywrite.css">
<meta charset="UTF-8">
<%@ page import="Carepakage.userDBCP"%>

<title>글쓰기</title>
</head>
<body>
<%@include file = "header.jsp" %>

<div>
<center>
<h1 style="margin-bottom:10px">글쓰기</h1>

<form action="controller/communitywriteAction.jsp" method="post">
    <table>
        <tr>
            <td><label for="username">글 작성자</label></td>
            <td><input type="text" id="" name="username" value="" required></td>
        </tr>
        <tr>
            <td><label for="boardtitle">제목</label></td>
            <td><input type="text" id="boardtitle" name="boardtitle" required></td>
        </tr>
        <tr>
            <td><label for="boardcontent">내용</label></td>
            <td><textarea id="boardcontent" name="boardcontent" rows="15" cols="50"  max=2028 required></textarea></td>
        </tr>
        <tr>
        	
        		<td></td>	
    			<td style="float:right;"><input type="submit"  style="margin:10px" value="글작성"><input type="button" value="목록보기" 
    			onClick="location.href='Community.jsp'"></td>
    		
    	</tr>
    </table>
   
</form>

</center>
</div>

<%@include file = "footer.jsp" %>
</body>
</html>
