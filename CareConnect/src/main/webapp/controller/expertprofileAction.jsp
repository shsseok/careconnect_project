<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가 프로필 액션 jsp입니다.</title>
</head>
<body>
	<jsp:useBean id="exd" class="Carepakage.expertProfile" scope="page" />
	<jsp:useBean id="exddb" class="Carepakage.expertProfileDBCP" scope="page" />
	<jsp:useBean id="user2db" class="Carepakage.userDBCP" scope="page" />
	<jsp:useBean id="user2" class="Carepakage.user2Entity" scope="page" />
	<% 	
		request.setCharacterEncoding("UTF-8");
		
	 	String menu = request.getParameter("menu"); 
	 	String email=(String)session.getAttribute("email");
	 	String expertport=(String)session.getAttribute("expertport");
	 
		
	 	if(email!=null && expertport!=null)
	 	{//전문가 라면
	 		if ( menu.equals("insert"))  
	 		{
	 			
	 			%>
	 			
	 			<jsp:setProperty  name="exd" property="name"/>
	 			<jsp:setProperty  name="exd" property="phone"/>
				<jsp:setProperty  name="exd" property="sex"/>
	 			<jsp:setProperty  name="exd" property="strengthpart"/>
				<jsp:setProperty  name="exd" property="career"/>
				<jsp:setProperty  name="exd" property="place"/>
				<jsp:setProperty  name="exd" property="introduction"/>
	 			<jsp:setProperty  name="exd" property="serviceskill"/>
	 			<jsp:setProperty  name="exd" property="onlineservice"/>
	 			<jsp:setProperty  name="exd" property="experience"/>
	 			<jsp:setProperty  name="exd" property="email"/>
	 			<jsp:setProperty  name="exd" property="servicecategory"/>
	 			
	 			<% 
	 			exddb.insertprofileDB(exd,email);
	 		
	 			response.sendRedirect("../Expertprofile.jsp");
	 			
	 		}
	 		else if ( menu.equals("update"))  
	 		{
	 			
	 			%>
	 			<jsp:setProperty  name="exd" property="name"/>
	 			<jsp:setProperty  name="exd" property="phone"/>
				<jsp:setProperty  name="exd" property="sex"/>
	 			<jsp:setProperty  name="exd" property="strengthpart"/>
				<jsp:setProperty  name="exd" property="career"/>
				<jsp:setProperty  name="exd" property="place"/>
				<jsp:setProperty  name="exd" property="introduction"/>
	 			<jsp:setProperty  name="exd" property="serviceskill"/>
	 			<jsp:setProperty  name="exd" property="onlineservice"/>
	 			<jsp:setProperty  name="exd" property="experience"/>
	 			<jsp:setProperty  name="exd" property="email"/>
	 			<jsp:setProperty  name="exd" property="servicecategory"/>
	 			<% 
	 			exddb.updateprofileDB(exd,email);
	 	
	 			response.sendRedirect("../Expertprofile.jsp");
	 			
	 		}
	 		else
	 		{
	 			System.out.println("failed");
	 		}
	 	}
	 	else//일반 사용자라면 그냥 보여줌 
	 	{
	 		response.sendRedirect("../Expertprofileboard.jsp");
	 	}
	 	
	%>
</body>
</html>