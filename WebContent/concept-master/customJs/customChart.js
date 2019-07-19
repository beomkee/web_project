function makeBarGraph() {
	$.ajax({
		type : "POST",
		url : "/ProjectNo1/chart/bar.do",
		data : {
			"barKey" : barKey,
			"barValue1" : barValue1,
			"barValue2" : barValue2
		},
		datatype : "json",
		success : function(result) {
			var json = JSON.parse(result);
			// graphData = json;
			barGraph = json;
			data1 = json.data[0];
			data2 = json.data[1];
			console.log(json);
			makeBar();
		}
	});
}

// Line Chart
// ===========================================================================================================================
var chartjs_line = document.getElementById('chartjs_line').getContext('2d');
var LineOptions = {
	type : 'line',
	data : {
		labels : keyData,
		datasets : [
		/*
		 * { label : '라인별생산량', data : data1, borderColor : "rgba(89, 105,
		 * 255,0.7)", borderWidth : 2 }, { label : 'Cashew', data : [ 2, 29, 5,
		 * 5, 2, 3, 10 ], backgroundColor : "rgba(255, 64, 123,0.5)",
		 * borderColor : "rgba(255, 64, 123,0.7)", borderWidth : 2 }
		 */
		]
	},
	options : {
		legend : {
			display : true,
			position : 'bottom',

			labels : {
				fontColor : '#71748d',
				fontFamily : 'Circular Std Book',
				fontSize : 14,
			}
		},
		scales : {
			xAxes : [ {
				ticks : {
					fontSize : 14,
					fontFamily : 'Circular Std Book',
					fontColor : '#71748d',
				}
			} ],
			yAxes : [ {
				ticks : {
					fontSize : 14,
					fontFamily : 'Circular Std Book',
					fontColor : '#71748d',
				}
			} ]
		}
	}
};
// Bar Chart
// ===========================================================================================================================
var chartjs_bar = document.getElementById("chartjs_bar").getContext('2d');
var barOptions = {
	type : 'bar',
	data : {
		labels : keyData,
		datasets : []
	},
	options : {
		scales : {
			yAxes : [ {

			} ]
		},
		legend : {
			display : true,
			position : 'bottom',

			labels : {
				fontColor : '#71748d',
				fontFamily : 'Circular Std Book',
				fontSize : 14,
			}
		},

		scales : {
			xAxes : [ {
				ticks : {
					fontSize : 14,
					fontFamily : 'Circular Std Book',
					fontColor : '#71748d',
				}
			} ],
			yAxes : [ {
				ticks : {
					fontSize : 14,
					fontFamily : 'Circular Std Book',
					fontColor : '#71748d',
				}
			} ]
		}
	}
};

// Doughnut Chart
// ===========================================================================================================================
var chartjs_doughnut = document.getElementById("chartjs_doughnut").getContext(
		'2d');
var doughnutOptions = {
	type : 'doughnut',
	data : {
		labels : [ "M", "T", "W", "T", "F", "S", "S" ],
		datasets : [
		/*
		 * { backgroundColor : [ "#5969ff", "#ff407b", "#25d5f2", "#ffc750",
		 * "#2ec551", "#7040fa", "#ff004e" ], data : [ 12, 19, 3, 17, 28, 24, 7 ] }
		 */
		]
	},
	options : {
		legend : {
			display : true,
			position : 'bottom',

			labels : {
				fontColor : '#71748d',
				fontFamily : 'Circular Std Book',
				fontSize : 14,
			}
		},
	}
};

// Polar Chart
// ===========================================================================================================================
var chartjs_polar = document.getElementById("chartjs_polar").getContext('2d');
var polarOptions = {
	type : 'polarArea',
	data : {
		labels : [ "M", "T", "W", "T", "F", "S", "S" ],
		datasets : [
		/*
		 * { backgroundColor : [ "#5969ff", "#ff407b", "#25d5f2", "#ffc750",
		 * "#2ec551", "#7040fa", "#ff004e" ], data : [ 12, 19, 3, 17, 28, 24, 7 ] }
		 */
		]
	},
	options : {

		legend : {
			display : true,
			position : 'bottom',

			labels : {
				fontColor : '#71748d',
				fontFamily : 'Circular Std Book',
				fontSize : 14,
			}
		},
	}
};
//
//
//
//
//
//

