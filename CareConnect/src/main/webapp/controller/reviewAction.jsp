<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 Action.jsp 파일 입니다.</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String user_email=(String) session.getAttribute("email");//리뷰를 달고자하는 사용자 이메일
String expert_email= request.getParameter("expertemail");//리뷰를 달고자하는 전문가의 이메일
System.out.println(user_email);
System.out.println(expert_email);



%>
<jsp:useBean id="newReview" class="Carepakage.reviewEntity" scope="page" />
<jsp:setProperty name="newReview" property="user_email" value="<%=user_email%>"/>
<jsp:setProperty name="newReview" property="expert_email" value="<%=expert_email%>"/>
<jsp:setProperty name="newReview" property="username" param="username"/>
<jsp:setProperty name="newReview" property="review" param="review"/>
<jsp:setProperty name="newReview" property="rating" param="rating"/>
<%@ page import="Carepakage.*" %>

<% 
    reviewDBCP reviewdb = new reviewDBCP();
    boolean isSuccess = reviewdb.insertreviewDB(newReview);

   
    if (isSuccess) {
        
    	out.println("<script>");
    	out.println("location.href='../Expertprofileboard.jsp?email=" + expert_email + "';");
    	out.println("</script>");

    } else {
       
         out.println("리뷰 삽입에 실패했습니다.");
    }
%>
</body>
</html>