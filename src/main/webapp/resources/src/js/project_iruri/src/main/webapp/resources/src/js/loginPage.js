const autoLoginLabel = document.querySelector('label[for="auto-login"]');
const rememberEmailLabel = document.querySelector('label[for="remember-email"]');

// 버튼
(function() {  
  rememberEmailLabel.addEventListener('click', function() {
    const rememberEmailIcon = rememberEmailLabel.querySelector('i');
    rememberEmailIcon.classList.toggle('iruri-check-no-icon');
    rememberEmailIcon.classList.toggle('iruri-check-yes-icon');
  });
  
  autoLoginLabel.addEventListener('click', function() {
    const autoLoginIcon = autoLoginLabel.querySelector('i');
    autoLoginIcon.classList.toggle('iruri-check-no-icon');
    autoLoginIcon.classList.toggle('iruri-check-yes-icon');
  });
})();

// 이메일 기억하기
(function() {
  const rememberEmail = document.querySelector('#remember-email');
  const userEmailInput = document.querySelector('#email');
  const loginForm = document.querySelector('#loginForm');

  if(localStorage.getItem('userEmail') !== null) {
    rememberEmail.checked = true;
    rememberEmailLabel.querySelector('i').classList.remove('iruri-check-no-icon');
    rememberEmailLabel.querySelector('i').classList.add('iruri-check-yes-icon');
    userEmailInput.value = localStorage.getItem('userEmail');
  }
  
  loginForm.addEventListener('submit', (e) => {
    e.preventDefault();
    if(rememberEmail.checked === true) {
      localStorage.setItem('userEmail', userEmailInput.value);
      loginForm.submit();
    } else {
      localStorage.removeItem('userEmail');
      loginForm.submit();
    }
  });
  
  document.querySelector('#find-password').addEventListener('click', (e) => {
  	e.preventDefault();
  	$(".c_make_modal").fadeIn();
  	$('#sendAuthKey').attr('disabled', false);
  	$('#authKey').attr('disabled', false);
  	$('.pass_find_submit_button').attr('disabled', true);
  });

  $('#sendAuthKey').on('click', () => {
    const email = $('input[name="findEmail"]').val();
    fetch('signUp/emailCheck?userEmail=' + email)
    .then(res => res.text())
    .then(number => {
		const emailValidate = document.querySelector('.emailValidate');
    	if(number === '-1') {
			emailValidate.innerText = '이메일 주소 양식에 맞게 작성해주세요'; 
      	} else {
      		fetch('signUp/sendAuthNumber?userEmail=' + email);
      		$('#sendAuthKey').attr('disabled', true);
      		
      		const htmls = '<div class="password_find_formBox">'
			                 + '<label>'
			                 +   '<span>인증번호 입력</span>'                  
			                 +   '<input type="text" id="authKey"/>'
			                 + '</label>'
			                  
			                 + '<button id="confirmAuthKey">인증번호 확인</button>'
	                	 + '</div>'
										 + '<div class="authNumberValidate"></div>';

      		$('.password_find_form').append(htmls);
      		
      		$('#confirmAuthKey').on('click', () => {
		  	const authKey = $('#authKey').val();
		  	fetch('signUp/checkAuthNumber?authNumber=' + authKey)
		  	.then(data => data.text())
		  	.then(number => {
					const authNumberValidate = document.querySelector('.authNumberValidate');
		  		if(number === '0' || number === '-1') {
		  			authNumberValidate.innerText = '인증번호가 맞지 않습니다.';
		  		} else {
		  			$('#confirmAuthKey').attr('disabled', true);
		  			
		  			const htmls = '<div class="password_find_formBox password_find_formBox_new">'
		                    + '<label>'
		                    +  '<span>새 비밀번호 입력</span>'                  
		                    +  '<input class="newPassword" type="password" placeholder="8~16자리의 영문 대소문자, 숫자 및 특수문자 사용"/>'
		                    + '</label>'
		                    + '</div>'
												+ '<div class="newPwValidate"></div>'

		                    + '<div class="password_find_formBox password_find_formBox_new">'
		                    +  '<label>'
		                    +    '<span>새 비밀번호 확인</span>'                  
		                    +    '<input class="newPasswordCheck" type="password"/>'
		                    +  '</label>'
		                    + '</div>';
		                  
		  			$('.password_find_form').append(htmls);
		  			
		  			$('.newPassword').on("change", function() {
		  				const pw = $('.newPassword').val();
		  				fetch('signUp/passwordCheck?userPw=' + pw)
		  				.then(data => data.text())
		  				.then(number => {
								const newPwValidate = document.querySelector('.newPwValidate');
		  					if(number === '4') {
		  						newPwValidate.innerText = '올바른 비밀번호 양식입니다.';
		  					} else {
		  						newPwValidate.innerText = '올바른 비밀번호 양식이 아닙니다.';
		  					}
		  				});
		  			});

						$('.newPasswordCheck').on('change', function() {
							const pw = $('.newPassword').val();
							const pwCheck = $('.newPasswordCheck').val();

							if(pw === pwCheck) {
								$('.pass_find_submit_button').attr('disabled', false);
							}
						})

						$('.pass_find_submit_button').on('click', function() {
							const email = $('input[name="findEmail"]').val();
							const pw = $('.newPassword').val();
							$.ajax({
								url: 'http://localhost:8282/ex/signUp/pwUpdate',
								type: 'GET',
								data: {
									userEmail: email,
									userPw: pw
								},
								success: function(result) {
									if(result === -1) {
										console.log('비밀번호 수정 실패');
									} else {
										$('.c_make_modal').fadeOut();
									}
								}
							});
						})
		  		}
		  	});
		  });
      	}
    })
  });
})();