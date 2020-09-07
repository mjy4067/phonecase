function checkForm(){
	if(document.getElementById("input1").value.trim()==""){
		alert('회원ID는 필수입니다.');
		document.getElementById("input1").focus();
		return false;
	}
	if(document.getElementById("input2").value.trim()==""){
		alert('이름은 필수입니다.');
		document.getElementById("input2").focus();
		return false;
	}
	if(document.getElementById("input3").value.trim()==""){
		alert('성별은 필수입니다.');
		document.getElementById("input3").focus();
		return false;
	}
	if(document.getElementById("input4").value.trim()==""){
		alert('생년월일은 필수입니다.');
		document.getElementById("input4").focus();
		return false;
	}
	if(document.getElementById("input5").value.trim()==""){
		alert('전화번호1은 필수입니다.');
		document.getElementById("input5").focus();
		return false;
	}
}