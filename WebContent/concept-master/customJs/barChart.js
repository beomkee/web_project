
function makeBarGraph() {
	$.ajax({
		type : "POST",
		url : "/ProjectNo1/graph/bar.do",
		data : {
			"barKey" : barKey,
			"barValue1" : barValue1,
			"barValue2" : barValue2
			},
		datatype : "json",
		success : function(result) {
			var json = JSON.parse(result);
			//graphData = json;
			barGraph = json;
			data1 = json.data[0];
			data2 = json.data[1];
			console.log(json);
			makeBar();
		}
	});
}
function makeBar(){
	
	var ctx = document.getElementById("canvas_bar").getContext("2d");
	
	barChart = new Chart(ctx).Bar(barChartData, {
		scaleBeginAtZero : false,
		scaleShowGridLines : true,
		scaleGridLineColor : "rgba(0,0,0,0.05)",
		scaleGridLineWidth : 1,
		barShowStroke : false,
		barStrokeWidth : 2,
		barValueSpacing : 5,
		barDatasetSpacing : 1,
		onAnimationProgress : function() {
			// console.log("onAnimationProgress");
		},
		onAnimationComplete : function() {
			// console.log("onAnimationComplete");
		}
	});

	$("canvas").on("click", function(e) {
		var activeBars = barChart.getBarsAtEvent(e);
		console.log(activeBars);
		for ( var i in activeBars) {
			console.log(activeBars[i].value);
		}
	});
	
}

var randomScalingFactor = function() {
	return Math.round(Math.random() * 100)
};
var months = [ "January", "February", "March", "April", "May", "June",
		"July", "August", "September", "October", "November", "December" ];
var barChart = null;
var barChartData = {
	labels : [ "January", "February", "March", "April", "May", "June",
			"July", "August", "September", "October", "November",
			"December" ],
	datasets : [ {
		fillColor : "rgba(220,220,220,0.5)",
		strokeColor : "rgba(220,220,220,0.8)",
		highlightFill : "rgba(220,220,220,0.75)",
		highlightStroke : "rgba(220,220,220,1)",
		data : data1 
	}, {
		fillColor : "rgba(151,187,205,0.5)",
		strokeColor : "rgba(151,187,205,0.8)",
		highlightFill : "rgba(151,187,205,0.75)",
		highlightStroke : "rgba(151,187,205,1)",
		data : data2
	} ]
};

