function login()
{
	if(document.loginform.client.value=="normal")
	{
	if(document.loginform.client.value=="")
	{
		alert("고객 유형을 선택해 주세요");
		return ;
	}	
	if(document.loginform.email.value=="")
	{
		alert("이메일을 입력해주세요.");
		return ;
	}
	if(document.loginform.password.value=="")
	{
		alert("비밀 번호를 입력해주세요.");
		return ;
	}
	document.loginform.submit();
	}
	if(document.loginform.client.value=="expert")
	{
	if(document.loginform.client.value=="")
	{
		alert("고객 유형을 선택해 주세요");
		return ;
	}	
	if(document.loginform.email.value=="")
	{
		alert("이메일을 입력해주세요.");
		return ;
	}
	if(document.loginform.password.value=="")
	{
		alert("비밀 번호를 입력해주세요.");
		return ;
	}
	if(document.loginform.expertport.value=="")
	{
		alert("전문가 암호를 필히 입력하십시오.");
		return ;
	}
	document.loginform.submit();
	}
	if(document.loginform.client.value=="")
	{
		alert("고객 유형을 선택하세요.");
		return ;
	}
}
function expertradio(isExpert) {
    var btn = document.getElementsByClassName("portbutton")[0]; 
    if(isExpert) {
        btn.style.display="block";
        
    } else {
        btn.style.display="none";
    }
}




