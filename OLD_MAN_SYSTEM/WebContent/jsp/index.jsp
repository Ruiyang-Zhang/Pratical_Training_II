<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		<title>颐养中心:</title>
       <link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link href="jsp/css/style.css" rel="stylesheet" type="text/css" />
       <script type="text/javascript" src="jsp/js/jquery.js"></script>
       <script type="text/javascript" src="jsp/js/weather.js"></script>
          <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
        
        
          <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
      
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>

   
	</head>
	<body>
		<div class="place">

    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <b>${user.ACCOUNT}您好，欢迎使用颐养中心</b>
    
    </div></br>
   
    <div class="layui-carousel" id="test1" lay-filter="test1"  style="width:200%;margin-left:12.5%;">
  <div carousel-item=""   >
    <div ><img style="width:100%;height:100%;" src="jsp/images/logininfo.png"></div>
    <div ><img  style="width:100%;height:100%;" src="jsp/images/logininfo.png"></div>
    <div ><img src="jsp/images/logininfo.png"></div>
    <div ><img src="jsp/images/logininfo.png"></div>
    <div ><img src="jsp/images/logininfo.png"></div>
  </div>
</div> 
         
	</body>
    




</html> 