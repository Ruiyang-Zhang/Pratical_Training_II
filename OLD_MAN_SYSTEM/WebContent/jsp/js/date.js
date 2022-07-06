var mineData = {};
function initDate() {

	layui.use( 'laydate', function() {
		var laydate = layui.laydate;

		var start = {
			min: laydate.now(),
			max: '2099-06-16 23:59:59',
			istoday: false,
			choose: function( datas ) {
				end.min = datas; // 开始日选好后，重置结束日的最小日期
				end.start = datas // 将结束日的初始值设定为开始日
			}
		};

		var end = {
			min: laydate.now(),
			max: '2099-06-16 23:59:59',
			istoday: false,
			choose: function( datas ) {
				start.max = datas; // 结束日选好后，重置开始日的最大日期
			}
		};

		document.getElementById( 'LAY_demorange_s' ).onclick = function() {
			start.elem = this;
			laydate( start );
		}
		document.getElementById( 'LAY_demorange_e' ).onclick = function() {
			end.elem = this
			laydate( end );
		}

	} );
}
function initData() {
	$.ajax( {
		type: "POST",
		url: "weather/getTargetWeather",
		ansyc: true,
		dataType: "json",
		contentType: "application/x-www-form-urlencoded;charset=utf-8",
		success: function( data ) {
			initCharts( data );

		}
	} );
}
function initCharts( data ) {
	alert( data.high[0] );
	var dom = document.getElementById( "container" );
	var myChart = echarts.init( dom );
	var app = {};
	option = null;
	option = {
		title: {
			text: '历史天气变化',
			subtext: 'WTS服务提供'
		},
		tooltip: {
			trigger: 'axis'
		},
		legend: {
			data: [
					'最高气温', '最低气温'
			]
		},
		toolbox: {
			show: true,
			feature: {
				dataZoom: {
					yAxisIndex: 'none'
				},
				dataView: {
					readOnly: false
				},
				magicType: {
					type: [
							'line', 'bar'
					]
				},
				restore: {},
				saveAsImage: {}
			}
		},
		xAxis: {
			type: 'category',
			boundaryGap: false,
			data: data.date

		},
		yAxis: {
			type: 'value',
			axisLabel: {
				formatter: '{value} °C'
			}
		},
		series: [
				{
					name: '最高气温',
					type: 'line',
					data: data.high,
					markPoint: {
						data: [
								{
									type: 'max',
									name: '最高温度'
								}, {
									type: 'min',
									name: '最温度'
								}
						]
					},
					markLine: {
						data: [
							{
								type: 'average',
								name: '平均值'
							}
						]
					}
				}, {
					name: '最低气温',
					type: 'line',
					data: data.low,
					markPoint: {
						data: [
							{
								name: '周最低',
								value: -2,
								xAxis: 1,
								yAxis: -1.5
							}
						]
					},
					markLine: {
						data: [
								{
									type: 'average',
									name: '平均值'
								}, [
										{
											symbol: 'none',
											x: '90%',
											yAxis: 'max'
										}, {
											symbol: 'circle',
											label: {
												normal: {
													position: 'start',
													formatter: '最大值'
												}
											},
											type: 'max',
											name: '最高点'
										}
								]
						]
					}
				}
		]
	};

	if ( option && typeof option === "object" ) {
		myChart.setOption( option, true );
	}
}