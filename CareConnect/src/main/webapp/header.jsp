<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/style.css">
<link rel="stylesheet" href="styles/header.css">
<script language="JavaScript" src="jsfile/logout.js" charset="utf-8"></script>
</head>
<body>
<%
String usertype=(String)session.getAttribute("userType");
String adminemail=(String)session.getAttribute("email");
%>
	<div id="header">
		<img src="images/pill.png">
		<%
		if(adminemail!=null && adminemail.equals("admin"))
		{
		%>
		<img src="images/maintext.png">
		<% 
		}
		else
		{
		%>
		<a href="main.jsp"><img src="images/maintext.png"></a>
		<%
		}
		%>
		<div class="loginbox" style="display:inline-block; width:65%; position: absolute; bottom: 20px; right: 100px; text-align: right;">
		<%
		
		if(session.getAttribute("email")==null)
		{
		%>
		<a href="loginpage.jsp" class="loginbutton" style="margin: 10px;">로그인</span>
		<a href="RegisterChoicepage.jsp" class="registerbutton" >회원가입</span>
		<%
		}
		else
		{
		%>
		
		
		<a href="controller/logout.jsp" class="loginbutton" style="margin: 10px;" >로그아웃</a>
		
		
		<%
		}
		%>
		
		</div>
		<div class="dropdown">
  			<a href="#"><img src="images/menubar.png"></a>
  			<div class="dropdown-content">
    			<%
    			if(usertype!=null &&usertype.equals("expert") && session.getAttribute("expertport")!=null)//전문가라면
    			{
    			%>
    			<a href="Expertprofile.jsp">프로필</a>
    			<%
    			} 
    			else if( usertype!=null && usertype.equals("normal") && session.getAttribute("sickpart")!=null)//일반 사용자라면
    				{	%> 
    				<a href="Normalprofile.jsp">프로필</a>
        		<% 		
    			}
    			else//로그인을 안했다거나 관리자라면 동작 x
     			{
    			%>
    			<a href="">프로필</a>
    			
    			<%
    		}
    		%>	
    			<%if(adminemail!=null && adminemail.equals("admin"))
    				{
    				%>
    				<a href="">커뮤니티</a>
    				<%
    				}
    			else
    			{
    				%>
    				<a href="Community.jsp">커뮤니티</a>
    			<% 
    			}
    			 %>
    			<a href="QnA.jsp">QNA</a>
  			</div>
		</div>
	</div>
</body>

</html>