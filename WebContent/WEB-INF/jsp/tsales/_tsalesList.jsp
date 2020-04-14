<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.crm.vo.TsalesVO" %>
<%@ page import="com.crm.controller.TsalesController" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
	List<TsalesVO> yearList = (ArrayList)request.getAttribute("yearList");
	
	TsalesVO monthData = null;
			
	Object obj = request.getAttribute("monthData");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>목표매출과 현매출비교 그래프</title>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<!-- <canvas id="myChart" width="400" height="400"></canvas> -->
		<canvas id="myChart"></canvas>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script type="text/javascript">
		
			var getYear ="";
			var getMonth = [];
			var chartType = "";
<%			         	 	       
      	 	if(obj != null){
      	 		monthData = (TsalesVO)obj;
      	 		System.out.println("monthData : " + monthData.toString());
%>		          			
			getYear = <%=monthData.getYear()%>;
			getMonth =  [<%=monthData.getJan()%>,<%=monthData.getFeb()%>,<%=monthData.getMar()%>,<%=monthData.getApr()%>,<%=monthData.getMay()%>,<%=monthData.getJun()%>,<%=monthData.getJul()%>,
		   	<%=monthData.getAug()%>,<%=monthData.getSep()%>,<%=monthData.getAug()%>,<%=monthData.getOct()%>,<%=monthData.getNov()%>,<%=monthData.getDec()%>];
      	 	
<% 	 	
      	 	}
%>
			var ctx = document.getElementById('myChart').getContext('2d');
			var myData = {
			        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','July','Aug','Sep','Oct','Nov','Dec'],
			        datasets: 
			        	[{
			        	label: "전년도",
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
			        	borderColor : "rgba(5, 84, 173, 1)",
			            backgroundColor: "rgba(5, 84, 173, 1)",
			            strokeColor: "rgba(151,187,205,0.8)",
			            highlightFill: "rgba(128, 183, 242,1)",
			            highlightStroke: "rgba(151,187,205,1)",
			            hoverBorderColor: "rgba(33, 48, 99, 0.8)",
			            fill : false,
			      		data: [500, 480, 500, 500, 860]
		      		  }],
					options: {
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
			    }
			
			$(function(){
				$("#select-box").change(function(){
					alert(this.value);
				 	year = $(this).val();
				 	location.href= "/tsales/tsalesSearch.crm?year="+year;
				 	
				 	/* 
			 		$.ajax({
						url : "/tsales/getData.crm",
						type : "GET",
						dataType : "JSON",
						data : { year:year }, 
						success : function(data){
							getMonth = data;						
						},
						error : function(){
							alert("error");
						}
					});
				 	myChart.update(); //업데이트 함수  >> 반영이 됨  
				 	*/
				 	
				});
			});
			
			//기본값 
			var myChart = new Chart(ctx,{
			  type: "bar",
			  data: myData });
			
			$(function(){
				$(".chartTypeBtn").click(function(){
					myChart.destroy();
					myChart = new Chart(ctx, {
						type : $(this).val(),
						data : myData
					});
				});
				
				$("select.selbox").change(function(){
					
			        var test = $(this).children(".selbox option:selected").val();
			        
			        alert("test >> " + test);
			    });
				
				/* $("#line").click(function(){
					myChart.destroy();
					myChart = new Chart(ctx, {
						type : $(this).val(),
						data : myData
					});
				});
				$("#pie").click(function(){
					myChart.destroy();
					myChart = new Chart(ctx, {
						type : $(this).val(),
						data : myData
					});				
				});
				$("#bar").click(function(){
					myChart.destroy();
					myChart = new Chart(ctx, {
						type : $(this).val(),
						data : myData
					});
				}); */
				
			});
			
		</script>
		<style>
				.searchTbl th{
					width: 200px;
				}
				.searchTbl td{
					text-align: center;
				}
		
				.selbox{
					width: 80px;
					height: 50px;
					font-family: monospace;
					font-size: large;
				}
				#chartType{
					text-align: right;
				}
				
			</style>
		</head>
		<body>
			<div id="chartType">
				<input class="chartTypeBtn" type="button" id="line" name="line" value="line">
				<input class="chartTypeBtn" type="button" id="bar" name="bar" value="bar">
			</div>		 

		
			<table class="searchTbl">
			<tr>
				<th>*연 목표매출 조회</th>
				<th>*전년도 매출조회</th>
			</tr>
			<tr>
				<td>
					<select class="selbox" id="select-box" >
<%
						for(int i=0; i<yearList.size(); i++){
							TsalesVO tvo = yearList.get(i);
						
%>
					<option id="selectedYear" value="<%=tvo.getYear() %>"><%=tvo.getYear() %></option>
<%
						}
%>
					</select>
				</td>
				<td><select class="selbox" id="select-box2" >
<%
					for(int i=0; i<yearList.size(); i++){
						TsalesVO tvo = yearList.get(i);
					
%>
				<option id="selectedYear" value="<%=tvo.getYear() %>"><%=tvo.getYear() %></option>
<%
					}
%>
			</select></td>			
		</tr>
		</table>
	
		</body>
</html>