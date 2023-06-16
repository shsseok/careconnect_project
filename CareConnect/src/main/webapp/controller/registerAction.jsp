<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user1" class="Carepakage.user1Entity"/>
<jsp:useBean id="user1Dbcp" class="Carepakage.userDBCP"/>

<%
	request.setCharacterEncoding("utf-8");
	String email=request.getParameter("email");
	String phone1 =request.getParameter("phone1");
	String phone2 =request.getParameter("phone2");
	String phone3 =request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;
	user1.setPhone(phone);
%>
				
					<jsp:setProperty name="user1" property="name" />
					<jsp:setProperty name="user1" property="email" />
					<jsp:setProperty name="user1" property="sex" />
					<jsp:setProperty name="user1" property="sickpart" />
					<jsp:setProperty name="user1" property="password" />
					<jsp:setProperty name="user1" property="who" />
<%
	
String success=user1Dbcp.insertDB(user1);//성공 여부	
if(success.equals("이메일이 이미 사용 중입니다."))
{
		out.println("<script>");
	    out.println("alert('"+success+"');");
	    out.println("location.href='../User1registerpage.jsp'");
	    out.println("</script>");
	   
}

else if(success.equals("회원가입에 성공 하셨습니다."))
{
	out.println("<script>");
    out.println("alert('"+success+"');");
    out.println("location.href='../loginpage.jsp'");
    out.println("</script>");
}
%>

			
			
					
					
</body>
</html>