<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/machingfit.css">
<meta charset="UTF-8">
<title>매칭 피팅 페이지 입니다 간단한 필터링을 위한 페이지 입니다.</title>
<script language=JavaScript src="jsfile/matchingfit.js" charset="UTF-8"></script>
</head>
<body>

<%@include file ="header.jsp" %>
<div class="fit-Container">
<div class="text-box">
<div style="color: black; font-size: 20px;">국내 유일 치료사 상담 매칭 서비스 유일 플랫폼</div>
<div style="color: white; font-size: 15px;">저희가 찾아 드립니다</div>
<div><img src="images/icon1.png"></div>
<div style="color: white; font-size: 20px;">원하는 서비스의 종류를 선택하세요</div>
</div>
</div>
<div class="terapy-part-Container">

<div class="terapy-part-choice">
<form name=machingfitform action="controller/matchingfitAction.jsp" class="choice-box">
<span>원하는 치료 부위를 선택하여 주세요!!</span>
<div class="choice-img">
<img src="images/ankle.png" width="100px" height="100px" onClick="selectItem('part','ankle',this)">
<img src="images/waist.png" width="100px" height="100px" onClick="selectItem('part','waist',this)">
<img src="images/wrist.png" width="100px" height="100px" onClick="selectItem('part','wrist',this)">
<img src="images/spine.png" width="100px" height="100px" onClick="selectItem('part','spine',this)">
<img src="images/shoulder.png" width="100px" height="100px" onClick="selectItem('part','shoulder',this)">
<img src="images/knee.png" width="100px" height="100px" onClick="selectItem('part','knee',this)">
</div>
<div style="text-align: left">
<img src="images/icon2.png" >
</div>
<span>원하는 서비스 유형을 선택하여 주세요!!</span>
<div class="choice-service1">

<img src="images/homecareservice.png" onClick="selectItem('serviceone','service1',this)">
<img src="images/consult.png" onClick="selectItem('serviceone','consult',this)">
<img src="images/godocter.png" onClick="selectItem('serviceone','service2',this)">

</div>
<div style="text-align: right">
<img src="images/icon3.png">
</div>
<span>동행 서비스를 이용 하시겠습니까?</span>
<div class="choice-service2">
<img src="images/donghangservice.png" onClick="selectItem('servicetwo','donghangservice',this)">
</div>
<input type="hidden" id="selectedPart" name="selectedPart">
<input type="hidden" id="selectedService1" name="selectedService1">
<input type="hidden" id="selectedService2" name="selectedService2">
<input type="button" onclick="submitForm()" value="선택완료" size=30>

</form>
</div>
</div>
<%@include file = "footer.jsp" %>

</body>

</html>