function insertcheck() {
	
	if(document.expertprofile.strengthpart.value=="")
	{
		alert('강점 부위를 필수적으로 입력해 주세요.');
		return;
	}
	if(document.expertprofile.name.value=="")
	{
		alert('이름을 필수적으로 입력해 주세요.');
		return;
	}
	if(document.expertprofile.sex.value=="")
	{
		alert('성별을 필수적으로 입력해 주세요.');
		return;
	}
	if(document.expertprofile.phone.value=="")
	{
		alert('전화번호를 필수적으로 입력해 주세요.');
		return;
	}
	ok = confirm("등록하시겠습니까?");
	if (ok) {
		document.expertprofile.menu.value='insert';
		document.expertprofile.submit();
	} else {
		return;
	}			
}
function updatecheck() {
	
	
	
	
	ok = confirm("이대로 수정하시겠습니까?");
	
	if (ok) {
		document.expertprofile.menu.value='update';
		document.expertprofile.submit();	
	}
	else
	{
		return;
	}		
	
}
