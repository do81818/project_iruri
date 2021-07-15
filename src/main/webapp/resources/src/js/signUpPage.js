(function() {
	const form1 = document.getElementById('userEmail1');
	const form2 = document.getElementById('userEmail2');
	const email = document.getElementById('userEmail');
	const div = document.querySelector('.signUp__emailForm');
	let string1 = '';
	let string2 = '';
	
	console.log(form1, form2, email);
	
	form1.addEventListener('input', function(e) {
	  string1 = e.target.value;
	});
	
	form2.addEventListener('input', function(e) {
	  string2 = e.target.value;
	});
	
	div.addEventListener('input', function() {
	  email.value = string1 + '@' + string2;
	  console.log(email.value);
	});
	
})();