var img = document.getElementById( "jack" );
$( function() {
	$( "#jack" ).on(
			"click",
			function() {

				var img_src = $( "#jack" )[0].src;
				var html = "<div><div style='float:left; width:20%;margin-left:5%;'><img   src=" +
						img_src +
						"  /></div><div style='float:right;margin-right:25%;margin-top:8%;'>" +

						"<p>最高温度:" + $( "#high" ).val() + "℃</p>" + "<p>最低温度:" + $( "#low" ).val() +
						"℃</p>" + "<p>风向:" + $( "#direction" ).val() + "</p>" + "<p>白天天气:" +
						$( "#day" ).val() + "</p>" + "<p>晚间天气:" + $( "#night" ).val() + "</p>" +
						"<p>降雨概率:" + $( "#precip" ).val() + "%</p>" +

						"</div></div>"
				layer.open( {
					type: 1,
					skin: 'layui-layer-rim', // 加上边框
					title: "天气详情",
					area: [
							'420px', '240px'
					], // 宽高
					content: html
				} );

			} );

} );