console.log(document.querySelector('#auto-login').checked);
(function() {
  const autoLoginLabel = document.querySelector('label[for="auto-login"]');
  const rememberEmailLabel = document.querySelector('label[for="remember-email"]');
  
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

