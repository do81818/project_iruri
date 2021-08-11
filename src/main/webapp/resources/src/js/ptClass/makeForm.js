	var checkBoxs = document.querySelectorAll('input[type="checkbox"]');
			checkBoxs.forEach(function(item) {
				item.addEventListener('click', function() {
					const el = item.id;
					const labelIcon = document.querySelector(`label[for="${el}"] i`);

					if(item.checked === true) {
						labelIcon.classList.remove('iruri-check-no-icon');
						labelIcon.classList.add('iruri-check-yes-icon');
					} else {
						labelIcon.classList.add('iruri-check-no-icon');
						labelIcon.classList.remove('iruri-check-yes-icon');
					}
				})
			});

			var exerciseLevel = document.querySelector('.exerciseLevel');
			exerciseLevel.addEventListener('change', function() {
				const inputs = exerciseLevel.querySelectorAll('input[type="radio"]');
				inputs.forEach(function(item) {
					const el = item.id;
					const labelIcon = document.querySelector(`label[for="${el}"] i`);

					if(item.checked === true) {
						labelIcon.classList.remove('iruri-check-no-icon');
						labelIcon.classList.add('iruri-check-yes-icon');
					} else {
						labelIcon.classList.add('iruri-check-no-icon');
						labelIcon.classList.remove('iruri-check-yes-icon');
					}
				});
			});

			var exercisePerson = document.querySelector('.exercisePerson');
			exercisePerson.addEventListener('change', function() {
				const inputs = exercisePerson.querySelectorAll('input[type="radio"]');
				inputs.forEach(function(item) {
					const el = item.id;
					const labelIcon = document.querySelector(`label[for="${el}"] i`);
					
					if(item.checked === true) {
						labelIcon.classList.remove('iruri-check-no-icon');
						labelIcon.classList.add('iruri-check-yes-icon');
					} else {
						labelIcon.classList.add('iruri-check-no-icon');
						labelIcon.classList.remove('iruri-check-yes-icon');
					}
				});
			});

			var thumbnail = document.querySelector('.thumbnailWrap');
			console.log("thumbnail", thumbnail);
			
			thumbnail.addEventListener('change', function() {
				const inputs = thumbnail.querySelectorAll('input[type="radio"]');
				inputs.forEach(function(item) {
					const el = item.id;
					const labelIcon = document.querySelector(`label[for="${el}"] i`);

					if(item.checked === true) {
						labelIcon.classList.remove('iruri-check-no-icon');
						labelIcon.classList.add('iruri-check-yes-icon');
					} else {
						labelIcon.classList.add('iruri-check-no-icon');
						labelIcon.classList.remove('iruri-check-yes-icon');
					}
				});
				console.log(inputs);
			});