<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="styles/expertprofile.css">
<title>전문가 프로필 수정 등록 페이지 입니다.(전문가만 가능합니다.)</title>
</head>

<body>

<%@include file = "header.jsp" %>
    <%@ page import="Carepakage.*" %>
	<%
		String email=(String)session.getAttribute("email");
		String name = ""; 
		String sex ="";
		String strengthpart="";
		int career=0;
		String place="";
		String phone="";
		String introduction="";
		String serviceskill="";
		String onlineservice="";
		String experience="";
		String headline = "" ;
		String servicecategory="";
		expertProfileDBCP expertdb=new expertProfileDBCP();
		expertProfile expert=expertdb.getExpertprofile(email);
		 //전문가의프로필 dbcp
		if (session.getAttribute("expertport") != null) {
		if( expert == null )
		{ //회원가입 후 프로필 등록을 안한상태라면?
			headline = "전문가 프로필 등록 페이지 입니다";
		}
		else
		{
			headline = "전문가 프로필 수정 페이지 입니다";
			name = expert.getName();
			sex  = expert.getSex();
			phone  = expert.getPhone();
			strengthpart=expert.getStrengthpart();
			career=expert.getCareer();
			place=expert.getPlace();
			introduction=expert.getIntroduction();
			serviceskill=expert.getServiceskill();
			onlineservice=expert.getOnlineservice();
			experience=expert.getExperience();
			servicecategory=expert.getServicecategory();
		}
		
			}
    
    %>
    <div class="container">
		<div style="color:red; font-size:30px; text-align:center; padding:20px"><%=headline %></div>
        <form name="expertprofile" action="controller/expertprofileAction.jsp" method="POST">
            <div class="profile">
                <input type="hidden" name="menu" value="">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="<%=name%>">
 			
 				<label for="career">경력</label>
                <select name="career">
                <option <%=career == 1 ? "selected" : ""%> value="1">1년</option>
				<option <%=career == 2 ? "selected" : ""%> value="2">2년</option>
				<option <%=career == 3 ? "selected" : ""%> value="3">3년</option>
				<option <%=career == 4 ? "selected" : ""%> value="4">4년 이상</option>
       		 	
   			 	</select>
                <label for="sex">성별</label>
                <select name="sex">
				<option <%=sex.equals("man") ? "selected" : ""%> value="man">남자</option>
       		 	<option <%=sex.equals("woman") ? "selected" : ""%> value="woman">여자</option>
       		 	
   			 	</select>
              
                <label for="strengthpart">강점 부위</label>
                <select name="strengthpart">
				<option <%=strengthpart.equals("shoulder") ? "selected" : ""%> value="shoulder">어깨</option>
       		 	<option <%=strengthpart.equals("ankle") ? "selected" : ""%> value="ankle">발목</option>
       		 	<option <%=strengthpart.equals("wrist") ? "selected" : ""%> value="wrist">손목</option>
        		<option <%=strengthpart.equals("knee") ? "selected" : ""%> value="knee">무릎</option>
       		 	<option <%=strengthpart.equals("waist") ? "selected" : ""%> value="waist">허리</option>
        		<option <%=strengthpart.equals("spine") ? "selected" : ""%> value="spine">척추</option>

   			 	</select>
   			 	<label for="phone">핸드폰 번호</label>
   			 	<div style="display:lnline">
                <input type="text" name="phone" class="phone" value="<%=phone%>" style="width:150px">
                </div>
                <label for="place">소속 의료 기관</label>
                <input type="text" id="place" name="place" value="<%=place%>">
                <label for="experience">자격 사항</label>
                <textarea id="experience" name="experience"><%=experience%></textarea>
               	<label for="introduction">소개</label>
                <textarea id="introduction" name="introduction"><%=introduction%></textarea>
                
                <label for="serviceskill">서비스 기술</label>
                <textarea id="serviceskill" name="serviceskill"><%=serviceskill%></textarea>
				<label for="servicecategory">가능한 서비스 유형</label>
                <select name="servicecategory">
				   <option <%=servicecategory.equals("consult") ? "selected" : ""%> value="consult">상담 서비스</option>
    			   <option <%=servicecategory.equals("service1") ? "selected" : ""%> value="service1">홈 케어 서비스</option>
    			   <option <%=servicecategory.equals("service2") ? "selected" : ""%> value="service2">의료 기관에 찾아오세요.</option>
   			 	</select>
                <label for="onlineservice">온라인 서비스 유무</label>
                <select name="onlineservice">
				<option <%=onlineservice.equals("yes") ? "selected" : ""%> value="yes">yes</option>
       		 	<option <%=onlineservice.equals("no") ? "selected" : ""%> value="no">no</option>
       		 	
   			 	</select>
            </div>

           

            <div class="btn-box">
            <% 
           
            if (session.getAttribute("expertport") != null) { 
            	if( expert != null )
        		{ //회원가입 후 프로필 등록을 안한상태라면?
            	%>
            	<input type="button" class="btn" value="수정" onClick="updatecheck()">
            	<% 
        		}
            	else
            	{
            	%>
            	<input type="button" class="btn" value="등록" onClick="insertcheck()">
            	<% 
            	}
            }
		%>
            	
            	
                
          
            
            </div>
        </form>
    </div>
<%@include file = "footer.jsp" %>
</body>
 <script language=JavaScript src="jsfile/expertprofile.js" charset="utf-8"></script>
</html>