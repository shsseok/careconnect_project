function register()
{

	if(document.user1form.name.value=="")
	{
		alert("이름을 입력하세요.");
		return;
	}
	if(document.user1form.email.value && document.user1form.email2.value) {
	if(document.user1form.email.value != document.user1form.email2.value) {
		alert("이메일 중복확인이 맞지 않습니다.");
		return;
	}
	} else {
	alert("이메일을 모두 입력해주세요.");
	return;
	}		
		
	
	if(document.user1form.sex.value=="")
	{
		alert("성별을 입력하세요");
		return;
	}
	if(document.user1form.phone1.value=="" || document.user1form.phone2.value=="" || document.user1form.phone3.value=="")
	{
		alert("핸드폰 번호를 모두 기입해 주세요");
		return;
	}
	if(document.user1form.sickpart.value=="")
	{
		alert("치료 부위를 기입하여 주세요.");
		return;
	}
	if(document.user1form.password.value && document.user1form.passwordcheck.value) {
	if(document.user1form.password.value != document.user1form.passwordcheck.value) {
		alert("비밀번호 중복확인이 맞지 않습니다.");
		return;
	}
	} else {
	alert("비밀번호를 모두 입력해주세요.");
	return;
	}
	document.user1form.submit();

}
