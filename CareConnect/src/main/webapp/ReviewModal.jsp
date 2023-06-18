<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String username=request.getParameter("username");
String reviewtext=request.getParameter("reviewText");
%>
<div class="Modal-container" title="모달 창" >
    <p><strong>작성자:</strong><%=username%></p>
    <p><strong>이용후기:</strong><%=reviewtext%></p>
</div>


