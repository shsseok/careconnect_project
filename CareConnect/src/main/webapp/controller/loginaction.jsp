<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<jsp:useBean id="userDbcp" class="Carepakage.userDBCP"/>
<%@ page import="java.util.ArrayList, Carepakage.user1Entity" %>
<%@ page import="Carepakage.user2Entity" %>
<%@ page import="Carepakage.expertProfileDBCP" %>
<%
String userType = request.getParameter("client");//client 구분자
String email = request.getParameter("email");
String password = request.getParameter("password");
String expertport = request.getParameter("expertport");


try {
    if ("normal".equals(userType)) {
        if(userDbcp.isPasswd(email,password,expertport,userType))
        {
        	user1Entity user1Info=userDbcp.getUser1(email);
        	session.setAttribute("email", user1Info.getEmail());
        	session.setAttribute("sickpart", user1Info.getSickpart());
        	session.setAttribute("userType", userType);//전문가와 구분하기 위해서
        	response.sendRedirect("../main.jsp");
        }
        else
        {
        	%> 
        	<script>alert("로그인에 실패 하였습니다.!");
        	  location.href = "../loginpage.jsp";
</script>
        	
   		
       <% 
        }
       
    } else if ("expert".equals(userType)) {
    	if(userDbcp.isPasswd(email,password,expertport,userType))
        {
    		user2Entity user2Info = userDbcp.getUser2(email);
    		session.setAttribute("email", user2Info.getEmail());
        	session.setAttribute("expertport", user2Info.getExpertport());
        	session.setAttribute("userType", userType);//일반사용자와 구분하기 위해서
        	expertProfileDBCP exd=new expertProfileDBCP();
        	if(exd.getExpertprofile(email)==null)
        	{
        	%>
        	
        		<script>alert("프로필 생성 후 이용하시기 바랍니다.");
          	  location.href = "../Expertprofile.jsp";
  			</script>
  
  <% 
        	}
        	else{
        		response.sendRedirect("../main.jsp");
        	}
        	
        }
        else
        {
        	%> 
        	<script>alert("로그인에 실패 하였습니다.!");
        	  location.href = "../loginpage.jsp";</script>
        	
   		
       <% 
    }}
} catch(Exception e) {
    e.printStackTrace();
}
%>


</body>
</html>