(function challengeSlideFunc() {

  const slides = document.querySelector('.challenge__slides');
				slide = document.querySelectorAll('.challenge__slides .cardConteiner'),
				slideCount = slide.length,
				prevBtn = document.querySelector('#challengePrev'),
				slideWidth = 360,
				slideMargin = 58.5,
				MoveSlide = slideWidth + slideMargin,
				nextBtn = document.querySelector('#challengeNext');		
	let		currentIdx = 0;
	
	//slide 배열
		for(var i = 0; i < slide.length; i++){
			slide[i].style.left = (slideWidth * i + slideMargin*i) + 'px';
		}
	
	//slide 이동 함수
	function goToSlide(num){
		slides.style.left = -num * MoveSlide + 'px';
		currentIdx = num;
	}
	
	// 버튼을 클릭하면 슬라이드 이동시키기
	nextBtn.addEventListener('click',function(){	
		 if(currentIdx < slideCount - 3){
			goToSlide(currentIdx + 1);
		 } else{
			goToSlide(0);
		 }	
	 });
	 prevBtn.addEventListener('click',function(){	
		 if(currentIdx > 0){
			goToSlide(currentIdx - 1);
		 } else{
			goToSlide(slideCount - 3);
		 }   
	 });
})();


(function challengeSlideFunc() {

  const slides = document.querySelector('.ptClass__slides');
				slide = document.querySelectorAll('.ptClass__slides .cardConteiner'),
				slideCount = slide.length,
				prevBtn = document.querySelector('#ptClassPrev'),
				slideWidth = 360,
				slideMargin = 58.5,
				MoveSlide = slideWidth + slideMargin,
				nextBtn = document.querySelector('#ptClassNext');		
	let		currentIdx = 0;
	
		for(var i = 0; i < slide.length; i++){
			slide[i].style.left = (slideWidth * i + slideMargin*i) + 'px';
		}
	
	function goToSlide(num){
		slides.style.left = -num * MoveSlide + 'px';
		currentIdx = num;
	}
	
	nextBtn.addEventListener('click',function(){	
		 if(currentIdx < slideCount - 3){
			goToSlide(currentIdx + 1);
		 } else{
			goToSlide(0);
		 }	
	 });
	 prevBtn.addEventListener('click',function(){	
		 if(currentIdx > 0){
			goToSlide(currentIdx - 1);
		 } else{
			goToSlide(slideCount - 3);
		 }   
	 });
})();

(function exerciseVideoSlideFunc() {

  const slides = document.querySelector('.exerciseVideo__slides');
				slide = document.querySelectorAll('.exerciseVideo__slides .cardConteiner'),
				slideCount = slide.length,
				prevBtn = document.querySelector('#exerciseVideoPrev'),
				slideWidth = 360,
				slideMargin = 58.5,
				MoveSlide = slideWidth + slideMargin,
				nextBtn = document.querySelector('#exerciseVideoNext');		
	let		currentIdx = 0;
	
		for(var i = 0; i < slide.length; i++){
			slide[i].style.left = (slideWidth * i + slideMargin*i) + 'px';
		}
	
	function goToSlide(num){
		slides.style.left = -num * MoveSlide + 'px';
		currentIdx = num;
	}
	
	nextBtn.addEventListener('click',function(){	
		 if(currentIdx < slideCount - 3){
			goToSlide(currentIdx + 1);
		 } else{
			goToSlide(0);
		 }	
	 });
	 prevBtn.addEventListener('click',function(){	
		 if(currentIdx > 0){
			goToSlide(currentIdx - 1);
		 } else{
			goToSlide(slideCount - 3);
		 }   
	 });
})();