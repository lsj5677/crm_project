$(function(){
	
	var myChart = "";
	var getLabel = "";
	var getYear = [];
	var getMonth = [];
	var getLabels = [];
	var option = [];

	var ctx = document.getElementById('myChart').getContext('2d');
	var myData = {
		labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		datasets: 
        	[{
        	label: "전년도",
        	borderWidth: '2',
        	lineTension: 0.1,
        	borderColor : "rgba(182,206,232,1)" ,
            backgroundColor: "rgba(182,206,232,1)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(182,206,232,1)",
            highlightStroke: "rgba(220,220,220,1)",
            hoverBorderColor: "rgba(33, 48, 99, 0.8)",
            fill : false,
          	data: [500, 480, 500, 500, 860, 500, 100,400, 190, 360,480, 400]
        }, 
        {
        	label: getYear + "목표매출" ,
        	borderWidth: '2',
        	lineTension: 0.1,
        	borderColor : "rgba(128, 183, 242,1)",
            backgroundColor: "rgba(128, 183, 242,1)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(182,206,232,1)",
            highlightStroke: "rgba(220,220,220,1)",
            hoverBorderColor: "rgba(33, 48, 99, 0.8)",
            fill : false,
            /* hidden: true, */
         	 data: getMonth
        },
        {
        	label: "현재매출",
        	borderWidth: '2',
        	lineTension: 0.1,
        	borderColor : "rgba(5, 84, 173, 1)",
            backgroundColor: "rgba(5, 84, 173, 1)",
            strokeColor: "rgba(151,187,205,0.8)",
            highlightFill: "rgba(128, 183, 242,1)",
            highlightStroke: "rgba(151,187,205,1)",
            hoverBorderColor: "rgba(33, 48, 99, 0.8)",
            fill : false,
      		data: [500, 480, 500, 500, 860]
  		  }],
		options : option
	}
	
	option = {
            scales: {
                xAxes: [{
                  display: true,
                  scaleLabel: {
                    display: true,
                    /*labelString: '(월)'*/
                  }
                }],
                yAxes: [{
            	  ticks :{
            		  beginAtZero:true
            	  },
                  display: true,
                  scaleLabel: {
                    display: true,
                    /*labelString: '(백만원)'*/
                  }
                }]
              }
         }

	$.ajax({ 
		url: "/tsales/getData.crm", 
		type: "get", 
		dataType : 'json',
		success: function(data){ 
			var months = data.month;
			var years = data.year;
			
			for (var year in years.reverse()){
				getYear.push(years[year].year);
				$("#select-box1").append("<option value='" + years[year].year + "'>" + years[year].year + "</option>");
				$("#select-box2").append("<option value='" + years[year].year + "'>" + years[year].year + "</option>");
			}

			for (var key in months) {
				getLabels.push(key);
		    	getMonth.push(months[key]);
		    	getLabel = months["year"];
			}
			
			getMonth.pop();
			getLabels.pop();

			console.log(getLabels);
			console.log(getMonth);
			
			makeChart("bar");
		} 
	}); 
	
	console.log(getYear);
	console.log(getLabels);
	console.log(getMonth);
	
	$(".chartTypeBtn").click(function(){
		myChart.destroy();
		makeChart($(this).val());
	});
	
	$("#select-box1").change(function(){
		var param = $(this).children(".selbox option:selected").val();
		getDataByYear(param);
	});
		
		
	function getDataByYear(param){
			
		$.get("/tsales/searchData.crm?year=" + param, function(data) {
			console.log(data);
			
			for (var key in data) {
		    	getMonth.push(data[key]);
		    	getLabel = data.year;
			}
			
			myChart.update();
			console.log(getMonth);
			console.log(getLabel);
			
		},'json')
		
		}		
			
	function makeChart(param){
		myChart = new Chart(ctx, {
			type : param,
			data : myData,
			options : option
		});
	}

});