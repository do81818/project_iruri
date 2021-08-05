var iruri_blue_color = '#185abd';
var iruri_red_color = '#ff0000';


// function display_start() {
//     var checkValue = $('input[type="radio"][name="taps"]:checked').val();
//     if (checkValue == 1) {
//         $(".report_memberList").css('display', 'block');
//     }
// }


// 라디오버튼으로 특정 div 만 보이게하기
function display_click() {
	// 라디오 버튼 checked 여부에 따라 특정div 보이기
	if ($("input[name=taps]:checked").val() == 1) {
		$(".list1").css('display', 'block');
		$(".list2").css('display', 'none');
		$(".list3").css('display', 'none');
	} else if ($("input[name=taps]:checked").val() == 2) {
		$(".list1").css('display', 'none');
		$(".list2").css('display', 'block');
		$(".list3").css('display', 'none');
	} else {
		$(".list1").css('display', 'none');
		$(".list2").css('display', 'none');
		$(".list3").css('display', 'block');
		document.getElementById("trainerMemberInsert_email").value = '';
	}
}

// 글자수 체크
function fn_checkByte(obj, a) {

	var maxByte = a; //최대 바이트
	var text_value = obj.value; //입력한 문자
	var text_length = text_value.length; //입력한 문자수

	var totalByte = 0;

	let saveMsg = "";

	for (let i = 0; i < text_length; i++) {
		const each_char = text_value.charAt(i);
		const uni_char = escape(each_char) //유니코드 형식으로 변환
		if (uni_char.length > 4) {
			// 한글 : 3Byte
			totalByte += 3;
		} else {
			// 영문,숫자,특수문자 : 1Byte
			totalByte += 1;
		}

		if (totalByte <= maxByte) {
			saveMsg += each_char;
		}

	}

	if (totalByte > maxByte) {
		// alert('최대 3000Byte까지만 입력가능합니다.');
		document.getElementById("nowByte").innerText = "입력가능한 문자수를 초과하였습니다.  " + totalByte;
		document.getElementById("nowByte").style.color = iruri_red_color;
		document.getElementById("nowByte").style.fontSize = "14px";

	} else {
		// saveMsg = text_value;
		console.log(saveMsg);

		document.getElementById("nowByte").innerText = totalByte;
		document.getElementById("nowByte").style.color = iruri_blue_color;
		document.getElementById("nowByte").style.fontSize = "14px";
	}

	if (totalByte > maxByte) {
		obj.blur();
		console.log("text: " + saveMsg);
		obj.value = saveMsg;
		// alert(’10 자 이내로 입력’);
		obj.focus();
		return false;
	}
}



//////////////////////////// 트레이너 등록 /////////////////////////////////////////

// 이메일 타입 입력 : select
function insertEmail() {

	const se = document.getElementById('trainerMemberSelect_email');
	const so = se.value;

	if (so != 0) {
		document.getElementById("trainerMemberInsert_emailType").setAttribute('readonly', 'readonly');
		document.getElementById("trainerMemberInsert_emailType").value = so;
	} else {
		document.getElementById("trainerMemberInsert_emailType").value = '';
		document.getElementById("trainerMemberInsert_emailType").removeAttribute('readonly');
	}
}

// 이메일 체크 : 영문, 특수문자, 숫자
function insertEmailCheck(obj) {

	const val = obj;
	console.log(obj);

	const str1 = document.getElementById('trainerMemberInsert_email').value;
	const str2 = document.getElementById('trainerMemberInsert_emailType').value;

	str1.replace(/\s/gi, "");
	str2.replace(/\s/gi, "");

	// const pattern_spc = /[`~!@#$%^&*()=+\\|{}'\[\]\";:/?><,]/; //특수문자
	// const pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크

	const result = document.getElementById('trainerMemberInsert_email_result');

	if (val == "email") {
		console.log(str1);
		var pattern_basic = /[0-9]|[a-zA-Z]|[\-_]/; // 숫자+영문자
	} else if (val == "emailType") {
		console.log(str2);
		var pattern_basic = /[a-zA-Z]|[\.]/; //영문자
	}

	let check1 = 0;
	let check2 = 0;

	str1.replace(/\s/gi, "");
	str2.replace(/\s/gi, "");

	for (let i = 0; i < str1.length; i++) {
		let each_char = str1.charAt(i);
		if (!pattern_basic.test(each_char)) {
			check1++;
		}
	}

	for (let i = 0; i < str2.length; i++) {
		let each_char = str2.charAt(i);
		if (!pattern_basic.test(each_char)) {
			check2++;
		}
	}

	if (check1 == 0 && check2 == 0) {
		result.style.display = "none";
		return true;
	} else {
		result.style.display = "block";
		return false;
	}

}

// 이름 체크 : 한글,영문
function insertNameCheck(obj) {

	const str = obj.value;
	const pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	const result = document.getElementById('trainerMemberInsert_name_result');

	str.replace(/\s/gi, "");
	let check = 0;
	for (let i = 0; i < str.length; i++) {
		let each_char = str.charAt(i);
		if (!pattern_kor.test(each_char)) {
			check++;
		}
	}

	if (check == 0) {
		result.style.display = "none";
		return true;
	} else {
		result.style.display = "block";
		return false;
	}

}

// 전화번호 체크 : 숫자
function insertPhoneNumberCheck(obj) {

	const str = obj.value;
	const pattern_num = /[0-9]/;
	const result = document.getElementById('trainerMemberInsert_PhoneNumber_result');

	str.replace(/\s/gi, "");

	let check = 0;
	for (let i = 0; i < str.length; i++) {
		let each_char = str.charAt(i);
		if (!pattern_num.test(each_char)) {
			check++;
		}
	}

	if (check == 0) {
		result.style.display = "none";
		return true;
	} else {
		result.style.display = "block";
		return false;
	}
}

// 임시비밀번호 
function insertPasswordCheck(obj) {
	const str = obj.value;
	const pattern_password = /[0-9]|[a-zA-Z]|[`~!@#$%^&*()=+\\|{}'\[\]\";:/?><,]/;
	const result = document.getElementById('trainerMemberInsert_password_result');

	str.replace(/\s/gi, "");

	let check = 0;

	for (let i = 0; i < str.length; i++) {
		let each_char = str.charAt(i);
		if (!pattern_password.test(each_char)) {
			check++;
		}
	}

	if (check == 0) {
		result.style.display = "none";
		return true;
	} else {
		result.style.display = "block";
		return false;
	}
}



// 최종 체크
function insertFinalCheck() {

	const str_name = document.querySelector('input[name=userName]').value;
	const str_email = document.getElementById('trainerMemberInsert_email').value +
		"@" + document.getElementById('trainerMemberInsert_emailType').value;
	const str_phoneNumber = document.querySelector('input[name=userPhone]').value;
	const str_password = document.querySelector('input[name=userPw]').value;

	const fin_namePattern = /[가-힣]+$/;
	const fin_emailPattern = /^[0-9a-zA-Z]|[-_]*@[0-9a-zA-Z]*.[a-zA-Z]{2,3}$/i;
	const fin_phonePattern = /^010*[0-9]{8}$/;
	const fin_passwordPattern = /^[A-Za-z0-9`~!@#$%^&*()=+\\|{}'\[\]\";:/?><,]{8,16}$/;

	let check1 = 0;
	let check2 = 0;
	let check3 = 0;
	let check4 = 0;
	if (fin_namePattern.test(str_name)) {
		check1 = 1;
	} else {
		document.getElementById('trainerMemberInsert_name_result').style.display = "block";
	}
	if (fin_emailPattern.test(str_email)) {
		check2 = 1;
	} else {
		document.getElementById('trainerMemberInsert_email_result').style.display = "block";
	}
	if (fin_phonePattern.test(str_phoneNumber)) {
		check3 = 1;
	} else {
		document.getElementById('trainerMemberInsert_PhoneNumber_result').style.display = "block";
	}
	if (fin_passwordPattern.test(str_password)) {
		check4 = 1;
	} else {
		document.getElementById('trainerMemberInsert_password_result').style.display = "block";
	}

	if (check1 + check2 + check3 + check4 == 4) {
		document.trainerInsertForm.submit();
		return true;
	} else {
		return false;
	}

}


// 숫자 표기 000,000
function priceToString(price) {
	return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}


// 날짜 표기 yyyy.MM.dd
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '.' + month + '.' + day;       
}