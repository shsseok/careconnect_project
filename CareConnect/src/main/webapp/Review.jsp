<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성 페이지 입니다.</title>
 <link rel="stylesheet" href="styles/review.css">
</head>
<body>
<%@ page import="Carepakage.*" %>
<%
String expert_email=request.getParameter("expertemail");
String email=(String) session.getAttribute("email");

userDBCP user=new userDBCP();
String username=user.getUser1(email).getName();
%>
<%@include file = "header.jsp" %>
    <div class="container">
        <h1>리뷰를 작성하세요</h1><br>
        <div></div>
        <form action="controller/reviewAction.jsp" method="POST">
            <input type="hidden" name="expertemail" value="<%=expert_email%>">
            <div>
                <label for="username">작성자</label>
                <input type="text" id="username" name="username" value="<%= username %>"required readonly>
            </div>
            <div>
                <label for="review">이용후기</label>
                <textarea id="review" name="review" rows="5" maxlength="100" required></textarea>
            </div>
            <div class="star-rating">
                <input type="hidden" id="rating" name="rating" value="0">
                <span class="star" data-value="5">&#9733;</span>
                <span class="star" data-value="4">&#9733;</span>
                <span class="star" data-value="3">&#9733;</span>
                <span class="star" data-value="2">&#9733;</span>
                <span class="star" data-value="1">&#9733;</span>
            </div>
            <div>
            	<button type="button" onClick="location.href='Expertprofileboard.jsp?email=<%=expert_email%>'">프로필 보러 가기</button>
                <button type="submit">등록</button>
            </div>
        </form>
    </div>

    <script language=JavaScript src="jsfile/review.js" charset="UTF-8"></script>
</body>

</html>
