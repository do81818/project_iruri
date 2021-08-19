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

	console.group('1')
	console.log(slides);
	console.log(slide);
	console.log(prevBtn);
	console.log(nextBtn);
	console.groupEnd('1');
	
	//slide 배열
		for(var i = 0; i < slide.length; i++){
			slide[i].style.left = (slideWidth * i + slideMargin * i) + 'px';
		}
	
	//slide 이동 함수
	function goToSlide(num){
		slides.style.left = -num * MoveSlide + 'px';
		currentIdx = num;
	}
	
	console.log('slideCount',slideCount);
	
	// 버튼을 클릭하면 슬라이드 이동시키기
	nextBtn.addEventListener('click',function(){	
		console.log(currentIdx);
		console.log(slideCount + 1);
		if(currentIdx < slideCount + 2) {
			goToSlide(currentIdx + 1);
		} else {
			goToSlide(0);
		}
	 });
	 prevBtn.addEventListener('click',function(){	
		 if(currentIdx > 0){
			goToSlide(currentIdx - 1);
		 } else{
			goToSlide(-(slideCount - 2));
		 }   
	 });
})();


(function ptClassSlideFunc() {

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
		console.log(currentIdx);
		console.log(slideCount + 1);
		if(currentIdx < slideCount + 2) {
			goToSlide(currentIdx + 1);
		} else {
			goToSlide(0);
		}
	 });
	 prevBtn.addEventListener('click',function(){	
		 if(currentIdx > 0){
			goToSlide(currentIdx - 1);
		 } else{
			goToSlide(-(slideCount - 2));
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
		console.log(currentIdx);
		console.log(slideCount + 1);
		if(currentIdx < slideCount + 2) {
			goToSlide(currentIdx + 1);
		} else {
			goToSlide(0);
		}
	 });
	 prevBtn.addEventListener('click',function(){	
		 if(currentIdx > 0){
			goToSlide(currentIdx - 1);
		 } else{
			goToSlide(-(slideCount - 2));
		 }   
	 });
})();

(function () {
  var w = window;
  if (w.ChannelIO) {
    return (window.console.error || window.console.log || function () {})("ChannelIO script included twice.");
  }
  var ch = function () {
    ch.c(arguments);
  };
  ch.q = [];
  ch.c = function (args) {
    ch.q.push(args);
  };
  w.ChannelIO = ch;
  function l() {
    if (w.ChannelIOInitialized) {
      return;
    }
    w.ChannelIOInitialized = true;
    var s = document.createElement("script");
    s.type = "text/javascript";
    s.async = true;
    s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
    s.charset = "UTF-8";
    var x = document.getElementsByTagName("script")[0];
    x.parentNode.insertBefore(s, x);
  }
  if (document.readyState === "complete") {
    l();
  } else if (window.attachEvent) {
    window.attachEvent("onload", l);
  } else {
    window.addEventListener("DOMContentLoaded", l, false);
    window.addEventListener("load", l, false);
  }
})();
ChannelIO("boot", {
  pluginKey: "e11efac1-f003-4ba6-8983-844f86f2c340",
});