const autoLoginLabel = document.querySelector('label[for="auto-login"]');
const rememberEmailLabel = document.querySelector('label[for="remember-email"]');

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
})();