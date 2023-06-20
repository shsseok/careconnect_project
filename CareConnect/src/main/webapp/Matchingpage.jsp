<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script language=JavaScript src="jsfile/filter.js" charset="UTF-8"></script>
</head>

<meta charset="UTF-8">
<title>전문가와 사용자를 매칭해줄 수 있는 페이지 입니다.</title>
</head>
<body>
<jsp:useBean id="userDbcp" class="Carepakage.userDBCP"/>
<jsp:useBean id="exddb" class="Carepakage.expertProfileDBCP"/>
<jsp:useBean id="userMaching" class="Carepakage.userMachingchoice" scope="session"/>
<%@ page import="java.util.ArrayList, Carepakage.user2Entity" %>
<%@ page import="Carepakage.expertProfile" %>
<%@include file = "header.jsp" %>

 <div class="container">
 <div class="row">
 <div class="col-md-3">
    <h2>필터링</h2>
    <form name="allfilterform" action="Matchingpage.jsp">
    <input type="submit" name="allexpertboard" value="전문가 전체 조회" style="background: #18D008; border-radius: 15px">
    <input type="hidden" name="filtertype" value="allboard">
    </form>
    <form id="filter-form" name="filterform" action="Matchingpage.jsp">
   		
        
        <input type="hidden" name="filtertype" value="filterboard">
        <div class="form-group">
            <label for="rating">별점</label>
            <input type="number" class="form-control" id="rating" name="starnumber" min="1" max="5">
        </div>
        <div class="form-group">
            <label for="distance">거리</label>
            <input type="number" class="form-control" id="distance" min="1">
        </div>
        <div class="form-group">
            <label for="experience">경력</label><br>
            1년<input type="radio" id="career" name="career" value="1"><br>
            2년<input type="radio" id="career" name="career" value="2"><br>
            3년<input type="radio" id="career" name="career" value="3"><br>
            4년이상<input type="radio" id="career" name="career" value="4">
        </div>
        
        <div class="form-group">
            <label>Online Service 유무</label><br>
            <input type="radio" id="onlineYes" name="onlineservice" value="yes">
            <label for="onlineYes">Yes</label><br>
            <input type="radio" id="onlineNo" name="onlineservice" value="no">
            <label for="onlineNo">No</label>
        </div>
        <div class="form-group">
            <label>가능한 서비스 유형</label><br>
            <input type="radio" id="servicecategory" name="servicecategory" value="consult">
            <label for="servicecategory">상담 서비스</label><br>
            <input type="radio" id="servicecategory" name="servicecategory" value="service1">
            <label for="servicecategory">홈 케어 서비스</label><br>
            <input type="radio" id="servicecategory" name="servicecategory" value="service2">
            <label for="servicecategory">의료기관 찾아오기</label>
        </div>
        <div class="form-group">
            <label>성별</label><br>
            <input type="radio" id="sex" name="sex" value="man">
            <label for="man">남자</label><br>
            <input type="radio" id="sex" name="sex" value="woman">
            <label for="woman">여자</label>
        </div>
        <div class="form-group">
            <label for="bodyPart"></label>
            <select class="form-control" id="bodyPart" name="sickpart">
                <option value="">Select...</option>
                <option value="shoulder">Shoulder</option>
                <option value="ankle">Ankle</option>
                <option value="wrist">Wrist</option>
                <option value="knee">Knee</option>
                <option value="waist">Waist</option>
                <option value="spine">Spine</option>
            </select>
        </div>
        <button type="button" class="btn btn-primary" onClick="filter()">Apply Filters</button>
    </form>
</div>

            
               
             <div class="col-md-9">
                  <%
                  //매칭 핏페이지에서 건너옴 기본적으로 필터링해서 사용자에게 보여주기 위함
               String sickpart=userMaching.getSickpart();//사용자가 원하는 부위
               String service1=userMaching.getService1();//사용자가 원하는 서비스 유형
               String service2=userMaching.getService2();//동행 서비스 유무 
               String career=request.getParameter("career");
               String onlineservice=request.getParameter("onlineservice");
               String servicecategory=request.getParameter("servicecategory");
               String sex=request.getParameter("sex");
               String filtersickpart=request.getParameter("sickpart");
               String filtertype=request.getParameter("filtertype"); //어떤식으로 필터링 할껀지 에 대한 필터링 타입(전체조회,필터링 선택 조회)
               ArrayList<expertProfile> list= null;
               if(filtertype!=null &&filtertype.equals("allboard"))//맨 위 폼양식에서 hidden변수를 통해서 활용
               {
            		 list=exddb.getExpertboard();//전문가 전체 조회 버튼
               }
               else if(filtertype!=null && filtertype.equals("filterboard"))
               {    
            	   list=exddb.getFilterExpertList(career, onlineservice, servicecategory, sex, filtersickpart);//필터링 버튼을 눌렀을 때
               		if(list.isEmpty())
               		{
               			out.println("<script>");
               		    out.println("alert('해당하는 전문가가 없습니다.');");
               		    out.println("</script>");
               		}
               }
               else
               {
            	   	 list=exddb.getExpertList(sickpart, service1); //처음 들어왔을 때 핏 페이지에서 건너온 정보를 토대로 LIST 추출
               };
            	
               
               
               		%>	
               		<div style="height: 1000px; overflow-y: scroll;" class="custom-scroll">										
             		<% 											
            		for(expertProfile exlist : list ) {
            
               
               %>
          
            <div class="card mb-3 shadow rounded" >
            
                <div class="row no-gutters">
                
                    <div class="col-md-4">
                        <span style="color:red"><%=exlist.getName()%> 전문가 이미지 </span>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"></h5>
                            <p class="card-text">
                                이름:<strong><%=exlist.getName() %></strong><br>
                                소속의료기관:<strong><%=exlist.getPlace() %></strong><br>
                                온라인 Service:<strong> <%=exlist.getOnlineservice()%></strong><br>
                                경력:<strong><%= exlist.getCareer()%>년</strong> 
                            </p>
                            <a href="Expertprofileboard.jsp?email=<%=exlist.getEmail()%>"  class="btn btn-primary">전문가 프로필</a>
                        </div>
                    </div>
                </div>
            </div>
             
              <%} %>
              </div>
        </div>
      
    </div>
</div>
<%@include file = "footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="script.js"></script>
</body>
</html>