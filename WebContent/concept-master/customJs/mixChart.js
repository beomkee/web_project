
var ctx = document.getElementById('myChart').getContext('2d');

var options = {
    type: 'bar',
    data: {
        datasets: [{
            label: 'Bar Dataset',
            data: data1
        }, {
            label: 'Line Dataset',
            data: data2,

            // Changes this dataset to become a line
            type: 'line'
        }],
        labels: keyData
    },
    options: {
    	scaleBeginAtZero : false,
		scaleShowGridLines : true,
		scaleGridLineColor : "rgba(0,0,0,0.05)",
		scaleGridLineWidth : 1,
		barShowStroke : false,
		barStrokeWidth : 2,
		barValueSpacing : 5,
		barDatasetSpacing : 1
    }
};

var ctx2 = document.getElementById('myChart2').getContext('2d');

var options2 = {
		type: 'bar',
		data: {
			datasets: [{
				label: 'Bar Dataset',
				data: data1
			}, {
				label: 'Line Dataset',
				data: data2,
				
				// Changes this dataset to become a line
				type: 'line'
			}],
			labels: keyData
		},
		options: {
			scaleBeginAtZero : false,
			scaleShowGridLines : true,
			scaleGridLineColor : "rgba(0,0,0,0.05)",
			scaleGridLineWidth : 1,
			barShowStroke : false,
			barStrokeWidth : 2,
			barValueSpacing : 5,
			barDatasetSpacing : 1
		}
};