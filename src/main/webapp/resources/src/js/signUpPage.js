(function() {
	const form1 = document.getElementById('userEmail1');
	const form2 = document.getElementById('userEmail2');
	const email = document.getElementById('userEmail');
	const emailSelect = document.querySelector('.email__select');
	const result = document.querySelector('.signUp__emailForm');
	
	let string1 = '';
	let string2 = '';
	let resultString = '';
	
	// 이메일 합치기 O
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
	}
  userEmailInputCombine();
	
	// 이메일 양식 체크 O
	function emailValidateReg() {
	  result.addEventListener('change', () => {
	    // 이메일 정규식 /^[0-9a-zA-Z]([_]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
	    const validateMessage = document.querySelector('.signUp__emailForm .validateCheck');
	    validateMessage.style.color = 'red';
      const authNumberDiv = document.querySelector('.signUp__emailAuthBtn');
	    const emailInput = email.value;
      
	
	    if(email.value === '@' || form2.value === '') {
	      validateMessage.style.display = 'none';
	      authNumberDiv.style.display = 'none';
	    } else {
	      	fetch("signUp/emailCheck?userEmail=" + emailInput)
	        .then(data => data.text())
	        .then(number => {
	          if(number === '-1') {
	            validateMessage.innerText = '이메일 주소 양식에 맞게 작성해주세요';
	            validateMessage.style.display = 'block';
	            authNumberDiv.style.display = 'none';
	          } else if(number === '1') {
	            validateMessage.innerText = '동일한 메일주소가 있습니다';
	            validateMessage.style.display = 'block';
	            authNumberDiv.style.display = 'none';
	          } else {
	            validateMessage.style.display = 'none';
	            authNumberDiv.style.display = 'block';
	            SendAuthNumber();
	          }
	        });
	    }
	  });
	}
	emailValidateReg();
	
	// 이메일 발송 O
	function SendAuthNumber() {
	  const authNumberDiv = document.querySelector('.signUp__emailAuthBtn');
	  const authKey = document.querySelector('#emailAuthKey');
	  const authBtn = document.querySelector('.authBtn');
	  const validateMessage = document.querySelector('.signUp__emailForm .validateCheck');
	  const emailInput = email.value;
	  let x = null;
	
	  const timer = document.querySelector('#emailTimer');
	  authBtn.addEventListener('click', () => {
	  if(authKey.value === '') {
	    clearInterval(x);
	    
	    fetch("signUp/sendAuthNumber?userEmail=" + emailInput);
	    let time = 180;
	    
	    x = setInterval(() => {
	      min = parseInt(time/60);
	      sec = time % 60;
	      
	      timer.innerText = `${min}:${sec < 10 ? `0${sec}` : sec}`;
	      time--;
	      
	      if(time < 0) {
	        clearInterval(x);
	        timer.innerText = '0:00';
	      }
	    }, 1000);
	  } else {
	      fetch("signUp/checkAuthNumber?authNumber=" + authKey.value)
	        .then(data => data.text())
	        .then(number => {
	          if(number === '1') {
	            clearInterval(x);
	            timer.innerText = '';
	            authNumberDiv.style.display = 'none';
	          }
	        });
	    }
	  });
	}
	
	// 비밀번호 검증 정규식 O
	function passwordValidateReg() {
	    /*
	     let num = pw.search(/[0-9]/g);
	     let eng = pw.search(/[a-z]/ig);
	     let spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    */
	  const form = document.querySelector('.signUp__passwordForm');
	
	  form.addEventListener('change', () => {
	    const pw = form.querySelector('#userPw').value;
	    const validateMessage = form.querySelector('.validateCheck');
		
	    fetch("signUp/passwordCheck?userPw=" + pw)
	    .then(data => data.text())
	    .then(number => {
	      if(number === "0") {
	        validateMessage.style.display = 'none';
	      } else if(number === "1") {
	        validateMessage.style.display = 'block';
	        validateMessage.innerText = "8자리 ~ 16자리 이내로 입력해주세요";      
	      } else if (number === "2"){
	        validateMessage.style.display = 'block';
	        validateMessage.innerText = "비밀번호는 공백 없이 입력해주세요";
	      } else if (number === "3"){
	        validateMessage.style.display = 'block';
	        validateMessage.innerText = "영문 대소문자, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요";
	      } else {
	        validateMessage.style.display = 'none';
	      }
	    });
	  });
	}
	passwordValidateReg();
	
	// 비밀번호 재입력 중복 검증 O
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
	passwordCheckValidate();
	
	// 닉네임 검증 정규식 및 중복 검증
	function nicknameValidateReg() {
	  // const NICKNAME_REG =  /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{0,10}$/;
	  const nicknameForm = document.querySelector('.signUp__nicknameForm');
	
	  nicknameForm.addEventListener('change', () => {
	    const nicknameInput = nicknameForm.querySelector('#userNickname');
	    const validateMessage = nicknameForm.querySelector('.validateCheck');
	    
	    fetch("signUp/nicknameCheck?userNickname=" + nicknameInput.value)
	    .then(data => data.text())
	    .then(number => {
	    	console.log(number);
	      if(number === '3') {
	        validateMessage.style.display = 'none';
	      } else if(number === '2') {
	        const validateNickname = nicknameInput.value.substring(0, 10);
	        nicknameInput.value = validateNickname;
	        validateMessage.style.display = 'block';
	        validateMessage.innerText = '10자 미만의 영어와 한글, 숫자만 입력 가능합니다';
	      } else if(number === '1') {
	        validateMessage.style.display = 'none';
	        validateMessage.innerText = '사용중인 닉네임입니다.';
	        validateMessage.style.display = 'block';
	      } else {
	        validateMessage.style.display = 'none';
	      }
	    });
	  });
	}
	nicknameValidateReg();

  // 전화번호 정규식
  function phoneNumberValidateReg() {
    const phoneForm = document.querySelector('.signUp__phoneForm');

    phoneForm.addEventListener('change', () => {
      const phoneInput = phoneForm.querySelector('#userPhone');
      const validateMessage = phoneForm.querySelector('.validateCheck');

      fetch('signUp/phoneCheck?userPhone=' + phoneInput.value)
      .then(data => data.text())
      .then(number => {
        if(number === '2'){
          validateMessage.style.display = 'none';
        } else if(number === '1') {
          validateMessage.innerText = '숫자만 입력해주세요';
          validateMessage.style.display = 'block';
        } else {
          validateMessage.style.display = 'none';
        }
      });
    });
  }
  phoneNumberValidateReg();
  
  const signUpForm = document.querySelector('.signUp__wrap');
  const submitBtn = signUpForm.querySelector('.submitBtn');
  
  signUpForm.addEventListener('submit', function(e) {
		e.preventDefault();

		// fetch('signUp/submit', {
		// 	method: 'POST',
		// 	cache: 'no-cache',
		// 	headers: {
		// 		'Content-Type': 'application/json'
		// 	},
		// 	body: JSON.stringify(data),
		// });
	});
})();

(function() {
  const signUpAregeeLabel = document.querySelector('label[for="terms_agree"]');
  signUpAregeeLabel.addEventListener('click', () => {
    const signUpArgeeIcon = signUpAregeeLabel.querySelector('i');
    signUpArgeeIcon.classList.toggle('iruri-check-no-icon');
    signUpArgeeIcon.classList.toggle('iruri-check-yes-icon');
  });
})();