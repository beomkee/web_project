function makeBarGraph() {
	$.ajax({
		type : "POST",
		url : "/ProjectNo1/graph/bar.do",
		data : {
			"barKey" : barKey,
			"barValue1" : barValue1,
			"barValue2" : barValue2,
			"name" : name
		},
		datatype : "json",
		success : function(result) {
			var json = JSON.parse(result);
			barGraph = json;
			
			console.log(barGraph);
			
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
				datasets : [
						{
							fillColor : "rgba(220,220,220,0.5)",
							strokeColor : "rgba(220,220,220,0.8)",
							highlightFill : "rgba(220,220,220,0.75)",
							highlightStroke : "rgba(220,220,220,1)",
							data : [ barGraph.mf[0].January,
									barGraph.mf[0].February,
									barGraph.mf[0].March, barGraph.sample[0].April,
									barGraph.mf[0].May, barGraph.sample[0].June,
									barGraph.mf[0].July, barGraph.sample[0].August,
									barGraph.mf[0].September,
									barGraph.mf[0].October,
									barGraph.mf[0].November,
									barGraph.mf[0].December ]
						},
						{
							fillColor : "rgba(151,187,205,0.5)",
							strokeColor : "rgba(151,187,205,0.8)",
							highlightFill : "rgba(151,187,205,0.75)",
							highlightStroke : "rgba(151,187,205,1)",
							data : [ barGraph.mf[1].January,
									barGraph.mf[1].February,
									barGraph.mf[1].March, barGraph.sample[1].April,
									barGraph.mf[1].May, barGraph.sample[1].June,
									barGraph.mf[1].July, barGraph.sample[1].August,
									barGraph.mf[1].September,
									barGraph.mf[1].October,
									barGraph.mf[1].November,
									barGraph.mf[1].December ]
						} ]

			};

			$("input#btnAdd").on(
					"click",
					function() {
						barChart.addData(
								[ randomScalingFactor(), randomScalingFactor() ],
								months[(barChart.datasets[0].bars.length) % 12]);
					});

			$("canvas").on("click", function(e) {
				var activeBars = barChart.getBarsAtEvent(e);
				console.log(activeBars);

				for ( var i in activeBars) {
					console.log(activeBars[i].value);
				}
			});
		}
	});
}

function makeBar() {

	
}
