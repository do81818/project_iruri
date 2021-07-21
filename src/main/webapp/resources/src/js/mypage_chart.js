

// 차트 설정 1번
var config1 = {
	type: 'line',
	data: {
		labels: ['1일', '5일', '10일','15일','20일','30일'],
		datasets: [{
			label: 'Weight changed',
			data: [30,50,51,52,60,45,50,70],
			backgroundColor: [
				'rgba(239,239,239)',
				
			],
			borderColor: [
				'rgba(24,90,219)',
				
			],
			borderWidth: 2
		}]
	},
	options: {
		responsive: false,
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero: true
				}
			}]
		},
	}
}

// 차트 설정 2번
var config2 = {
	type: 'line',
	data: {
		labels: ['1월', '2월', '3월', '4월', '5월', '6월','7월','8월','9월','10월','11월','12월'],
		datasets: [{
			label: 'Weight changed',
			data: [30,50,51,52,60,45,50,70],
			backgroundColor: [
				'rgba(239,239,239)',
				
			],
			borderColor: [
				'rgba(24,90,219)',
				
			],
			borderWidth: 2
		}]
	},

	options: {
		responsive: false,
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero: true
				}
			}]
		},
	}
}


// 차트 요소 선택
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, config1);


// 클릭했을때 변경
document.getElementById('addData').onclick = function(){
	
	config1.data.labels = ['1일', '5일', '10일','15일','20일','30일'];

	//데이터셋 수 만큼 반복
	var dataset = config1.data.datasets;
	// for(var i=0; i<dataset.length; i++){
	// 	console.log(dataset);
	// 	//데이터 갯수 만큼 반복
	// 	var data = dataset[i].data;
	// 	for(var j=0 ; j < data.length ; j++){
	// 		data[j] = Math.floor(Math.random() * 50);
	// 	}
	// }
	
	console.log("이번달체중변화")
	myChart.update();	//차트 업데이트

}

// 클릭했을때 변경
document.getElementById('addData1').onclick = function(){
	
	config1.data.labels = config2.data.labels;

	//데이터셋 수 만큼 반복
	var dataset = config2.data.datasets;
	// for(var i=0; i<dataset.length; i++){
	// 	console.log(dataset);
	// 	//데이터 갯수 만큼 반복
	// 	var data = dataset[i].data;
	// 	for(var j=0 ; j < data.length ; j++){
	// 		data[j] = Math.floor(Math.random() * 50);
	// 	}
	// }
	
	config1.data.datasets = dataset;
	console.log("올해체중변화")
	myChart.update();	//차트 업데이트
}


