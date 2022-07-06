<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>

		<base href="${basePath}">
		<meta charset="UTF-8">
		<title>H5模版:</title>
	</head>
<body style="height: 100%; margin: 0">
       <div id="container" style="height: 530%;width:80%;margin-left:10%;margin-top:5%;" ></div>
       
        <script type="text/javascript" src="jsp/js/echarts-all-3.js"></script>
       <script type="text/javascript" src="jsp/js/ecStat.min.js"></script>
       <script type="text/javascript" src="jsp/js/dataTool.min.js"></script>
       <script type="text/javascript" src="jsp/js/china.js"></script>
       <script type="text/javascript" src="jsp/js/world.js"></script>

       <script type="text/javascript" src="jsp/js/bmap.min.js"></script>
       <script type="text/javascript">
       var dom = document.getElementById("container");
       var myChart = echarts.init(dom);
       var app = {};
       option = null;
       var  legend={
    	         orient: 'vertical',
                 left: 'left',
                 data: ${modules}
       };
       option = {
           title : {
               text: '日常事务管理',
               subtext: '@颐养中心信息管理系统版权',
               x:'center'
           },
           tooltip : {
               trigger: 'item',
               formatter: "{a} <br/>{b} : {c} ({d}%)"
           },
           series : [
               {
                   name: '股票名',
                   type: 'pie',
                   radius : '55%',
                   center: ['50%', '60%'],
                   data:${anaylses},
                   itemStyle: {
                       emphasis: {
                           shadowBlur: 10,
                           shadowOffsetX: 0,
                           shadowColor: 'rgba(0, 0, 0, 0.5)'
                       }
                   }
               }
           ]
       };
       ;
       option.legend=legend;
       if (option && typeof option === "object") {
           myChart.setOption(option, true);
       }
       </script>
       </body>
</html>