<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<style>
.Managament-container a
{
margin-left:80px;
margin-right:80px;
border:none ; 
display:inline block;
padding:10px;
background:blue;
border-radius:20px;
}
.Managament-container
{
margin:30px

}


</style>
<title>관리자 페이지 입니다.</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="Managament-container" style="text-align:center;">
<a id="expertManagement" href="#">전문가 관리</a>
<a id="boardManagement" href="#">게시판 관리</a>
<a id="reviewManagement" href="#">리뷰 관리</a>
</div>
<center id="Managementcontent">
</center>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#expertManagement").click(function(){
    $("#Managementcontent").load("AdminExpert.jsp");
  });
  
});
$(document).ready(function(){
	  $("#boardManagement").click(function(){
	    $("#Managementcontent").load("AdminCommunity.jsp");
	  });
	  
	});
$(document).ready(function(){
	  $("#reviewManagement").click(function(){
	    $("#Managementcontent").load("AdminReview.jsp");
	  });
	  
	});
</script>
</html>