<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// 1. ���� �ε�
	$(document).ready(function(){
		// 2. ajax ��û
		$.ajax({
			type:'GET',
			url:'/web/pizzaPieChart',
			// 3. ��û ����
			success:function(json){
				// 4. ������Ʈ �ε�
				google.charts.load('current', {
					'packages' : [ 'corechart' ]
				});
				// 5. ������Ʈ �׸���
				google.charts.setOnLoadCallback(function(){
					var data = new google.visualization.DataTable();
					data.addColumn('string', 'Topping');
					data.addColumn('number', 'Slices');
					// json = [{"topping":"Mushrooms","slices":3},{"topping":"Onions","slices":1},{"topping":"Olives","slices":1},{"topping":"Zucchini","slices":1},{"topping":"Pepperoni","slices":2}]
					var rowList = new Array(); // var rowList=[];
					$(json).each(function(){
						var row = []; // new Array();
						row[0] = this.topping;
						row[1] = this.slices;
						rowList.push(row);
					});
					data.addRows(rowList);
					var options = {
						'title' : 'How Much Pizza I Ate Last Night',
						'width' : 400,
						'height' : 300
					};
					var chart = new google.visualization.PieChart(document
							.getElementById('chart_div'));
					chart.draw(data, options);
				});
			}
		});
	}); 

</script>
</head>

<body>
	<!--Div that will hold the pie chart-->
	<div id="chart_div"></div>
</body>
</html>