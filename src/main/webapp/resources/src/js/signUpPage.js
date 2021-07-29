(function() {
	// 이메일
	const emailForm = document.querySelector('.signUp__emailForm');
	const emailInput1 = document.getElementById('userEmail1');
	const emailInput2 = document.getElementById('userEmail2');
	const emailSelect = document.querySelector('.email__select');
	const email = document.getElementById('userEmail');
	// 인증번호
	const authKey = document.querySelector('#emailAuthKey');
	// 비밀번호
	const password = document.querySelector('#userPw');
	const confirmPassword = document.querySelector('#userPasswordCheck');
	// 닉네임
	const nickname = document.querySelector('#userNickname');
	// 전화번호
	const phone = document.querySelector('#userPhone');
	const agree = document.querySelector('#terms_agree');
	
	
	// 이메일 합치기
	function userEmailInputCombine() {
		let string1 = '';
		let string2 = '';
		let resultString = '';

		emailInput1.addEventListener('input', function(e) {
			e.preventDefault();
		  string1 = e.target.value;
		});
		
		emailInput2.addEventListener('input', function(e) {
			e.preventDefault();
		  string2 = e.target.value;
		});
	
	  emailSelect.addEventListener('change', function(e) {
			e.preventDefault();
	    document.querySelector('#userEmail2').value = emailSelect.value;
	    string2 = emailSelect.value;
	  });
		
	  emailForm.addEventListener('input', function(e) {
			e.preventDefault();
	    resultString = string1 + '@' + string2; 
		  email.value = resultString;
	  });
	     
		emailForm.addEventListener('change', function(e) {
			e.preventDefault();
		  resultString = string1 + '@' + string2; 
		  email.value = resultString;
	  });
	}
  userEmailInputCombine();
	
	// 이메일 양식 체크
	function emailValidateReg() {
	  emailForm.addEventListener('change', (e) => {
			e.preventDefault();
	    // 이메일 정규식 /^[0-9a-zA-Z]([_]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
	    const validateMessage = document.querySelector('.signUp__emailForm .validateCheck');
      const authNumberDiv = document.querySelector('.signUp__emailAuthBtn');
	    const emailInput = email.value;
      
	
	    if(email.value === '@' || emailInput2.value === '') {
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
	
	// 이메일 발송 
	function SendAuthNumber() {
	  const authNumberDiv = document.querySelector('.signUp__emailAuthBtn');
	  const authBtn = document.querySelector('.authBtn');
	  const timer = document.querySelector('#emailTimer');
	  const emailInput = email.value;
	  let x = null;
	
	  authBtn.addEventListener('click', (e) => {
			e.preventDefault();

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

	  form.addEventListener('change', (e) => {
			e.preventDefault();

	    const pw = password.value;
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
	
	  form.addEventListener('change', (e) => {
			e.preventDefault();

	    const originPassword = password.value;
	    const passwordCheck = confirmPassword.value;
	    const validateMessage = form.querySelector('.validateCheck');
	
	    if(originPassword !== passwordCheck) {
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
	
	  nicknameForm.addEventListener('change', (e) => {
			e.preventDefault();

			const nicknameValue = nickname.value;
	    const validateMessage = nicknameForm.querySelector('.validateCheck');
	    
	    fetch("signUp/nicknameCheck?userNickname=" + nicknameValue)
	    .then(data => data.text())
	    .then(number => {
	      if(number === '3') {
	        validateMessage.style.display = 'none';
	      } else if(number === '2') {
	        const validateNickname = nicknameValue.substring(0, 10);
	        nicknameValue = validateNickname;
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

    phoneForm.addEventListener('change', (e) => {
			e.preventDefault();

			const phoneValue = phone.value;
      const validateMessage = phoneForm.querySelector('.validateCheck');

      fetch('signUp/phoneCheck?userPhone=' + phoneValue)
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
  
	function signUpAjaxFunc() {
		const signUpForm = document.querySelector('.signUp__wrap');
		const submitBtn = signUpForm.querySelector('.submitBtn');
		
		signUpForm.addEventListener('submit', function(e) {
			e.preventDefault();
		});

		submitBtn.addEventListener('click', function(e) {
			e.preventDefault();

			const header = $('meta[name="_csrf_header"]').attr('th:content');
			const token = $('meta[name="_csrf"]').attr('th:content');
			$.ajax({
				type: 'POST',
				url: 'http://localhost:8282/ex/signUp/submit',
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				data: {
					userEmail: email.value,
					userPw: password.value,
					userPwCheck: confirmPassword.value,
					userNickname: nickname.value,
					userPhone: phone.value,
					agree: agree.checked
				},
				success: function(result) {
					console.log(result);
					if(result === 0) {
						 window.location = 'http://localhost:8282/ex/loginPage';
					} else {
						$(".c_make_modal").show();
					}
				}
			});
		})
	}
	signUpAjaxFunc();

	(function() {
	const signUpAregeeLabel = document.querySelector('label[for="terms_agree"]');
  signUpAregeeLabel.addEventListener('click', (e) => {

    const signUpArgeeIcon = signUpAregeeLabel.querySelector('i');
    signUpArgeeIcon.classList.toggle('iruri-check-no-icon');
    signUpArgeeIcon.classList.toggle('iruri-check-yes-icon');
  	});

	document.querySelector('.signUp_modal_close').addEventListener('click', () => {
		$('.c_make_modal').hide();
	});
	})();

})();