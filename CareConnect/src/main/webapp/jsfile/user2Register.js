function register()
{

	if(document.user2form.name.value=="")
	{
		alert("이름을 입력하세요.");
		return;
	}
	if(document.user2form.email.value && document.user2form.email2.value) {
	if(document.user2form.email.value != document.user2form.email2.value) {
		alert("이메일 중복확인이 맞지 않습니다.");
		return;
	}
	} else {
	alert("이메일을 모두 입력해주세요.");
	return;
	}		
		
	
	if(document.user2form.sex.value=="")
	{
		alert("성별을 입력하세요");
		return;
	}
	if(document.user2form.phone1.value=="" || document.user2form.phone2.value=="" || document.user2form.phone3.value=="")
	{
		alert("핸드폰 번호를 모두 기입해 주세요");
		return;
	}
	if(document.user2form.career.value=="")
	{
		alert("경력을 선택하여 주세요.");
		return;
	}
	if(document.user2form.password.value && document.user2form.passwordcheck.value) {
	if(document.user2form.password.value != document.user2form.passwordcheck.value) {
		alert("비밀번호 중복확인이 맞지 않습니다.");
		return;
	}
	
	} else {
	alert("비밀번호를 모두 입력해주세요.");
	return;
	}
	if(document.user2form.strengthpart.value=="")
	{
		alert("본인이 자신 있는 강점 부위를 선택해 주세요.");
		return;
	}
	if(document.user2form.place.value=="")
	{
		alert("본인 소속 의료 기관을 기입해 주세요.");
		return;
	}
	if(document.user2form.expertport.value=="")
	{
		alert("전문가 권한 암호를 필히 입력 해주세요.");
		return;
	}
	document.user2form.submit();

}
