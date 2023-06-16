
var selectedPart ="";
var selectedService1 ="";
var selectedService2 ="";
var selectedPartElement = null;
var selectedService1Element = null;
var selectedService2Element = null;

function selectItem(category, item, element) {
     if(category === "part") {
        selectedPart = item;

       
        if (selectedPartElement) {
            selectedPartElement.style.border = "";
        }

        
        element.style.border = "5px solid yellow";

        
        selectedPartElement = element;
    } else if(category === "serviceone") {
        selectedService1 = item;

        if (selectedService1Element) {
            selectedService1Element.style.border = "";
        }

        element.style.border = "5px solid yellow";

        selectedService1Element = element;
    } else if(category === "servicetwo") {
        selectedService2 = item;

        if (selectedService2Element) {
            selectedService2Element.style.border = "";
        }

        element.style.border = "5px solid yellow";

        selectedService2Element = element;
}
}
function submitForm() {
    	
    document.machingfitform.selectedPart.value=selectedPart;
    document.machingfitform.selectedService1.value=selectedService1;
    document.machingfitform.selectedService2.value=selectedService2;
   	
   	if(document.machingfitform.selectedPart.value=="")
   	{
	alert("부위를 필히 입력해주세요.");  
	return;
	}	
	if(document.machingfitform.selectedService1.value=="")
   	{
	alert("서비스 유형을 선택해 주세요");  
	return;
	}		   	
   	document.machingfitform.submit();
}
