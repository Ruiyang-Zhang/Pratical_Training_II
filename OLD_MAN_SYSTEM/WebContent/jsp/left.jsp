<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>'
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${basePath}">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
       <link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link href="jsp/css/style.css" rel="stylesheet" type="text/css" />
       <script type="text/javascript" src="jsp/js/jquery.js"></script>
       <script type="text/javascript" src="jsp/js/weather.js"></script>
          <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
</head>
<body>
<!--     <div class="lefttop"><span></span>菜单栏</div> -->
  <div class="layui-side layui-bg-black" style="margin-top:0.5px;">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item" ><img src="jsp/images/leftico.png"/>菜单列表</li>
      <!--   <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">服务模块管理</a>
          <dl class="layui-nav-child">
            <dd><a href="modules/toModulePage" target="rightFrame">服务模块列表</a></dd>
            <dd><a href="modules/toAnalyseModulesAccess" target="rightFrame">服务模块访问量分析</a></dd>
            <dd><a href="client/toAddPage" target="rightFrame">添加服务模块</a></dd>
          </dl>
        </li>
        
           <li class="layui-nav-item">
          <a href="javascript:;">天气预报</a>
          <dl class="layui-nav-child">
                 <dd><a href="user/futrue_weather" target="rightFrame">天气走势报表</a></dd>
                <dd><a href="weather/toWeatherList" target="rightFrame">历史天气分析</a></dd>
          </dl>
        </li> -->
      <!--        <li class="layui-nav-item">
          <a href="javascript:;">景点管理</a>
          <dl class="layui-nav-child">
                 <dd><a href="scenery/toObjectList" target="rightFrame">景点信息列表</a></dd>
                <dd><a href="jsp/scenery_add.jsp"  target="rightFrame">添加景点</a></dd>
          </dl>
        </li>
        
              <li class="layui-nav-item">
          <a href="javascript:;">景点兵力部署</a>
          <dl class="layui-nav-child">
                 <dd><a href="jsp/excel_upload.jsp" target="rightFrame">上传兵力部署文件</a></dd>
          </dl>
        </li>
        
                     <li class="layui-nav-item">
          <a href="javascript:;">告警监测</a>
          <dl class="layui-nav-child">
                 <dd><a href="jsp/warnning_check.jsp" target="rightFrame">地图式监测</a></dd>
                 <dd><a href="scenery/toChartAnalyse" target="rightFrame">图表式分析</a></dd>
                  <dd><a href="scenery/analysePlan" target="rightFrame">生成派兵计划</a></dd>
          </dl>
        </li> -->
                   
 <!--          <li class="layui-nav-item">
          <a href="javascript:;">用户信息管理</a>
          <dl class="layui-nav-child">
                 <dd><a href="client/toClientList"  target="rightFrame">用户信息列表</a></dd>
                <dd><a href="jsp/client_add.jsp" target="rightFrame">添加用户</a></dd>
                <dd><a href="jsp/test.jsp" target="rightFrame">测试</a></dd>
          </dl>
        </li> -->
        
        
            <li class="layui-nav-item">
          <a href="javascript:;">学生信息管理</a>
          <dl class="layui-nav-child">
                 <dd><a href="jsp/student.jsp"  target="rightFrame">学生信息列表</a></dd>
                   <dd><a href="jsp/student_add.jsp" target="rightFrame">添加学生</a></dd>
          </dl>
        </li>
        
                    <li class="layui-nav-item">
          <a href="javascript:;">教师信息管理</a>
          <dl class="layui-nav-child">
                 <dd><a href="jsp/teacher.jsp"  target="rightFrame">教师信息列表</a></dd>
                   <dd><a href="jsp/teacher_add.jsp" target="rightFrame">添加教师</a></dd>
          </dl>
        </li>
        
             <li class="layui-nav-item">
          <a href="javascript:;">课程信息管理</a>
          <dl class="layui-nav-child">
                 <dd><a href="jsp/course.jsp"  target="rightFrame">课程信息列表</a></dd>
                   <dd><a href="course/toAdd" target="rightFrame">添加课程</a></dd>
          </dl>
        </li>
   
        
        
              <li class="layui-nav-item">
          <a href="javascript:;">选课信息管理</a>
          <dl class="layui-nav-child">
                 <dd><a href="jsp/get_course.jsp"  target="rightFrame">选课信息列表</a></dd>
                   <dd><a href="jsp/get_course_addBatch.jsp" target="rightFrame">选课文件上上传</a></dd>
          </dl>
        </li>
        
            <li class="layui-nav-item">
          <a href="javascript:;">请假事务管理</a>
          <dl class="layui-nav-child">
                 <dd><a href="jsp/afl.jsp"  target="rightFrame">请假信息列表</a></dd>
                  <dd><a href="afl/toAdd" target="rightFrame">添加考勤</a></dd>
                <dd><a href="jsp/get_course_addBatch.jsp" target="rightFrame">考勤文件上上传</a></dd>
         </dl>
        </li>
        
                      <li class="layui-nav-item">
          <a href="javascript:;">密码管理</a>
          <dl class="layui-nav-child">
                 <dd><a href="jsp/modPass.jsp"  target="rightFrame">修改密码</a></dd>
          </dl>
        </li>
        
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    </div>
  </div>
  
  <div class="layui-footer">

  </div>

<script src="../src/layui.js"></script>
<script>
$(function(){});
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>

</body>
</html>
