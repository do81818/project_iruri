const form1 = document.getElementById('userEmail1');
const form2 = document.getElementById('userEmail2');
const email = document.getElementById('userEmail');
const emailSelect = document.querySelector('.email__select');
const result = document.querySelector('.signUp__emailForm');

let string1 = '';
let string2 = '';
let resultString = '';

// 이메일 조합
function userEmailInputCombine() {
	form1.addEventListener('input', function(e) {
	  string1 = e.target.value;
	});
	
	form2.addEventListener('input', function(e) {
	  string2 = e.target.value;
	});

  emailSelect.addEventListener('change', () => {
    document.querySelector('#userEmail2').value = emailSelect.value;
    string2 = emailSelect.value;
  });
	
  result.addEventListener('input', function() {
    resultString = string1 + '@' + string2; 
	  email.value = resultString;
  });
     
	result.addEventListener('change', function() {
	  resultString = string1 + '@' + string2; 
	  email.value = resultString;
  });
};

// 이메일 양식 검증 정규식
function emailValidateReg() {
  const EMAIL_REGEXP = /^[0-9a-zA-Z]([_]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

  result.addEventListener('change', () => {
    const validateMessage = document.querySelector('.signUp__emailForm .validateCheck');

    if(!EMAIL_REGEXP.test(email.value)) {
      validateMessage.innerText = '이메일 주소 양식에 맞게 작성해주세요';
      validateMessage.style.display = 'block';
      document.querySelector('.signUp__emailAuthBtn').style.display = 'none';
      
      if(email.value === '@' || form2.value === '') {
        validateMessage.style.display = 'none';  
      	document.querySelector('.signUp__emailAuthBtn').style.display = 'none';
      }
    } else {
      validateMessage.style.display = 'none';
      emailDuplicationValidate();
    }
  });
};

// 이메일 중복 검증
function emailDuplicationValidate() {
	const validateMessage = document.querySelector('.signUp__emailForm .validateCheck');

	const authBtn = document.querySelector('.authBtn');
	const emailInput = email.value;
	
	fetch("signUp/emailCheck?userEmail=" + emailInput)
	.then(data => data.text())
	.then(number => {
		console.log(number);
	
		if(number === '1') {
			validateMessage.innerText = '동일한 메일주소가 있습니다';
			validateMessage.style.display = 'block';
		} else {
			validateMessage.style.display = 'none';
			document.querySelector('.signUp__emailAuthBtn').style.display = 'block';
		}
});
	
	

  // 인증 버튼을 눌렀을 시
  // 1. Ajax를 이용해서 DB 중복 검사 후 이메일이 중복일 경우 "동일한 메일주소가 있습니다" 경고 메시지 출력
  // 2. 중복이 아닌 경우 해당 메일 주소로 4자리 인증번호가 보내지고 화면에는 인증번호 입력칸이 뜬다. 옆에는 입력가능 시간이 뜬다.(3분)
  // 3. 사용자의 메일 주소로 전송된 인증번호를 입력하면 인증이 완료된다.

}


// 비밀번호 검증 정규식
function passwordValidateReg() {
  const form = document.querySelector('.signUp__passwordForm');

  form.addEventListener('change', () => {
    const pw = form.querySelector('#userPw').value;
    let num = pw.search(/[0-9]/g);
    let eng = pw.search(/[a-z]/ig);
    let spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
    const validateMessage = form.querySelector('.validateCheck');
    if(pw === '') {
      validateMessage.style.display = 'none';
    } else if(pw.length < 8 || pw.length > 16) {
      validateMessage.style.display = 'block';
      validateMessage.innerText = "8자리 ~ 16자리 이내로 입력해주세요";      
    } else if (pw.search(/\s/) != -1){
      validateMessage.style.display = 'block';
      validateMessage.innerText = "비밀번호는 공백 없이 입력해주세요";
    } else if ( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
      validateMessage.style.display = 'block';
      validateMessage.innerText = "영문 대소문자, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요";
    } else {
      validateMessage.style.display = 'none';
    }
  });
}

// 비밀번호 중복 검증
function passwordCheckValidate() {
  const form = document.querySelector('.signUp__passwordCheckForm');

  form.addEventListener('change', () => {
    const password = document.querySelector('#userPw').value;
    const passwordCheck = document.querySelector('#userPasswordCheck').value;
    const validateMessage = form.querySelector('.validateCheck');

    if(password !== passwordCheck) {
      if(passwordCheck === '') {
        validateMessage.style.display = 'none';
      } else {
        validateMessage.style.display = 'block';
        validateMessage.innerText = "비밀번호가 일치하지 않습니다";
      }
    } else {
      validateMessage.style.display = 'none';
    }

  });
}

function nicknameValidateReg() {
  const NICKNAME_REG =  /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{0,10}$/;

  const nicknameForm = document.querySelector('.signUp__nicknameForm');

  nicknameForm.addEventListener('input', () => {
    const nicknameInput = nicknameForm.querySelector('#userNickname');
    const validateMessage = nicknameForm.querySelector('.validateCheck');
    
    if(!(NICKNAME_REG.test(nicknameInput.value))) {
      const validateNickname = nicknameInput.value.substring(0, 10);
      nicknameInput.value = validateNickname;
      validateMessage.style.display = 'block';
      validateMessage.innerText = '10자 미만의 영어와 한글, 숫자만 입력 가능합니다';
    } else if (nicknameInput === '') {
      validateMessage.style.display = 'none';
    } else {
   	  validateMessage.style.display = 'none';
      nicknameDuplicationValidate();
    }
  });

}

// 닉네임 중복 검증
function nicknameDuplicationValidate() {
	const nicknameForm = document.querySelector('.signUp__nicknameForm');
	
	const nicknameInput = nicknameForm.querySelector('#userNickname').value;
	const validateMessage = nicknameForm.querySelector('.validateCheck');
	
	fetch("signUp/nicknameCheck?userNickname=" + nicknameInput)
		.then(data => data.text())
		.then(number => {
			if(number === '1') {
				validateMessage.innerText = '사용중인 닉네임입니다.';
				validateMessage.style.display = 'block';
			} else {
				validateMessage.style.display = 'none';
			}
		});
}


// 이후 회원가입 완료 버튼을 눌렀을때 필수 입력칸이 비어있거나 올바르지 못한 값이라면
// '필수 내용을 입력해주세요' 라는 경고메시지를 모달로 출력

// ----
// 전화번호 검증 추가 '-'을 제외한 숫자만 입력하세요
// ----

function init() {
  userEmailInputCombine();
  emailValidateReg();
  passwordValidateReg();
  passwordCheckValidate();
  nicknameValidateReg();
}

init();