<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<title>颐养中心</title>
         <link rel="stylesheet" href="layui/css/layui.css"  media="all">
<link href="jsp/css/style.css" rel="stylesheet" type="text/css" />
 <style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
  </style>
  <style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
  </style>
         <script type="text/javascript" src="jsp/js/jquery.js"></script></head>
	     <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
   <body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">颐养中心</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item">
         <a href="javascript:;">客户管理</a>
      <dl class="layui-nav-child">
     
      <a href="jsp/customer.jsp"    target="myFrameName" >客户管理</a>
     <a href="jsp/customer_add.jsp"    target="myFrameName" >客户添加</a>
      </dl>
      
      </li>
    
    
      <li class="layui-nav-item">
         <a href="javascript:;">员工管理</a>
      <dl class="layui-nav-child">
      <a href="jsp/employee.jsp"    target="myFrameName" >员工管理</a>
     <a href="jsp/employee_add.jsp"    target="myFrameName" >添加员工</a>
      </dl>
      </li>
  
      
           <li class="layui-nav-item">
               <a href="javascript:;">活动管理</a>
      <dl class="layui-nav-child">
      <a href="jsp/activity.jsp"    target="myFrameName" >活动管理</a>
     <a href="activity/toAdd"    target="myFrameName" >添加活动</a>
      </dl>
      </li>
      
          
                 <li class="layui-nav-item">
               <a href="javascript:;">客户健康信息管理</a>
      <dl class="layui-nav-child">
      <a href="jsp/health.jsp"    target="myFrameName" >客户健康管理</a>
      <a href="health/toAdd"    target="myFrameName" >客户健康信息添加</a>
      </dl>
      </li>
      
      
      
      
                 <li class="layui-nav-item">
               <a href="javascript:;">客户缴费记录管理</a>
      <dl class="layui-nav-child">
      <a href="jsp/fee.jsp"    target="myFrameName" >缴费记录管理</a>
      <a href="fee/toAdd"    target="myFrameName" >缴费信息添加</a>
      </dl>
      </li>
      
      <li class="layui-nav-item">
               <a href="javascript:;">客户膳食记录管理</a>
      <dl class="layui-nav-child">
      <a href="jsp/food.jsp"    target="myFrameName" >膳食记录管理</a>
      <a href="food/toAdd"    target="myFrameName" >膳食信息添加</a>
      </dl>
      </li>
      
      
      
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          ${account }
        </a>
      </li>
      <li class="layui-nav-item"><a href="user/loginOut">退出系统</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
  <marquee style="margin-top:30px;">颐养中心</marquee> 
  <p  style="margin-top:10px;text-align:center;">${account }</p>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 3px;"    >
    
    <iframe id="myFrameId" name="myFrameName" frameborder="0"   style="width: 100%; height: 800px;" src="jsp/index.jsp" ></iframe> 
    
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    ©CarManagement - 颐养中心信息管理系统
  </div>
</div>
<script src="layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
    
</html>