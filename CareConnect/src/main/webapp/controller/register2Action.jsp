<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가 회원가입 Action 입니다.</title>
</head>
<body>
<jsp:useBean id="user2" class="Carepakage.user2Entity"/>
<jsp:useBean id="user2Dbcp" class="Carepakage.userDBCP"/>


<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;
	user2.setPhone(phone);
%>
				
					<jsp:setProperty name="user2" property="name" />
					<jsp:setProperty name="user2" property="email" />
					<jsp:setProperty name="user2" property="sex" />
					<jsp:setProperty name="user2" property="password"/>
					<jsp:setProperty name="user2" property="career" />
					<jsp:setProperty name="user2" property="strengthpart"/>
					<jsp:setProperty name="user2" property="place"/>
					<jsp:setProperty name="user2" property="expertport"/>

<%
String success=user2Dbcp.insertDB2(user2);//성공 여부	
if(success.equals("이메일이 이미 사용 중입니다."))
{
		out.println("<script>");
	    out.println("alert('"+success+"');");
	    out.println("location.href='../User2registerpage.jsp'");
	    out.println("</script>");
	   
}
else if(success.equals("전문가 포트가 이미 사용 중입니다."))
{
	out.println("<script>");
    out.println("alert('"+success+"');");
    out.println("location.href='../User2registerpage.jsp'");
    out.println("</script>");
    
}
else if(success.equals("회원가입에 성공 하셨습니다."))
{
	out.println("<script>");
    out.println("alert('"+success+"');");
    out.println("location.href='../loginpage.jsp'");
    out.println("</script>");
}
else if(success.equals("전문가 포트와 이메일 둘다 사용중 입니다."))
{
	out.println("<script>");
    out.println("alert('"+success+"');");
    out.println("location.href='../User2registerpage.jsp'");
    out.println("</script>");
}
	
%>

			
			
					
					
</body>
</html>