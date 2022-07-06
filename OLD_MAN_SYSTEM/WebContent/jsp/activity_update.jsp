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
		<title>颐养中心:</title>
          <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
                   <link rel="stylesheet" href="layer/layui/css/layui.css"  media="all">
          <link href="jsp/css/style.css" rel="stylesheet" type="text/css"/>
	       <script language="JavaScript" src="jsp/js/jquery.js"></script>
           <script src="layer/layer.js"></script>
           <script src="layui/layui.js" charset="utf-8"></script>
    </head>
	<body>
		
<div class="place">
 
    <ul class="placeul">
        <li>活动修改</li>
    </ul>
</div>

<div class="formbody">

</div>
<input type="hidden" id="type" value="${obj.CUSTOMER_ID }">
<form class="layui-form" action="activity/update"  enctype="multipart/form-data"  id="addForm"  method="POST">

 <div class="layui-form-item">
    <label class="layui-form-label">活动编号</label>
    <div class="layui-input-inline">
      <input type="text" name="ACTIVITY_ID"  id="ACTIVITY_ID" lay-verify="required" placeholder="活动编号" autocomplete="off" value="${obj.ACTIVITY_ID }" class="layui-input" readonly="readonly">
    </div>
 </div>

 <div class="layui-form-item">
    <label class="layui-form-label">活动名称</label>
    <div class="layui-input-inline">
      <input type="text" name="ACTIVITY_NAME"  id="ACTIVITY_NAME" lay-verify="required" placeholder="活动名称" autocomplete="off" class="layui-input" value="${obj.ACTIVITY_NAME }">
    </div>
 </div>

 
<div class="layui-form-item">
 <div class="layui-inline">
      <label class="layui-form-label">活动日期</label>
      <div class="layui-input-inline">
        <input type="text" name="ACTIVITY_DATE" id="test1" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" value="${obj.ACTIVITY_DATE }">
      </div>
    </div>
 </div>

 <div class="layui-form-item">
    <label class="layui-form-label">活动地址</label>
    <div class="layui-input-inline">
      <input type="text" name="ACTIVITY_ADDRESS"  id="ACTIVITY_ADDRESS" lay-verify="required" placeholder="活动地址" autocomplete="off" class="layui-input" value="${obj.ACTIVITY_ADDRESS }">
    </div>
 </div>
 
  <div class="layui-form-item">
  <div class="layui-inline">
      <label class="layui-form-label">负责人</label>
      <div class="layui-input-inline">
        <select name="EMPLOYEE_ID" id="EMPLOYEE_ID" lay-verify="required" lay-search="">
       <c:forEach items="${list}" var="object" varStatus="vs">
                <c:set var="index" value="${index+1}" />
                <option value="${object.EMPLOYEE_ID } ">${object.EMPLOYEE_ID }/${object.EMPLOYEE_NAME }</option>
        </c:forEach>
        </select>
      </div>
    </div>
  </div>

   <div class="layui-form-item"   style="width:600px;">
    <label class="layui-form-label">活动内容</label>
 	<div class="layui-input-block"  >
      <textarea class="layui-textarea layui-hide" name="ACTIVITY_CONTENT" lay-verify="content" id="LAY_demo_editor">${obj.ACTIVITY_CONTENT }</textarea>
    </div>
  </div>
  
    

 
 
     

  
</div> 
  
    
    <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn"  id="save">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>

</form>


	</body>
    <script type="text/javascript">
$(function(){
	
	var type=$("#type").val();
	$("#EMPLOYEE_ID").val(type);
	
	
});
    </script>
    <script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  //普通图片上传
  var uploadInst = upload.render({
    elem: '#jack'
    ,url: '/upload/'
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo1').attr('src', result); //图片链接（base64）
      });
    }
    ,done: function(res){
      //如果上传失败
      if(res.code > 0){
        return layer.msg('上传失败');
      }
      //上传成功
    }
    ,error: function(){
      //演示失败状态，并实现重传
      var demoText = $('#demoText');
      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
      demoText.find('.demo-reload').on('click', function(){
        uploadInst.upload();
      });
    }
  });
  
  //多图片上传
  upload.render({
    elem: '#test2'
    ,url: '/upload/'
    ,multiple: true
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
      });
    }
    ,done: function(res){
      //上传完毕
    }
  });
  
  //指定允许上传的文件类型
  upload.render({
    elem: '#test3'
    ,url: '/upload/'
    ,accept: 'file' //普通文件
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({ //允许上传的文件后缀
    elem: '#test4'
    ,url: '/upload/'
    ,accept: 'file' //普通文件
    ,exts: 'zip|rar|7z' //只允许上传压缩文件
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({
    elem: '#test5'
    ,url: '/upload/'
    ,accept: 'video' //视频
    ,done: function(res){
      console.log(res)
    }
  });
  upload.render({
    elem: '#test6'
    ,url: '/upload/'
    ,accept: 'audio' //音频
    ,done: function(res){
      console.log(res)
    }
  });
  
  //设定文件大小限制
  upload.render({
    elem: '#test7'
    ,url: '/upload/'
    ,size: 60 //限制文件大小，单位 KB
    ,done: function(res){
      console.log(res)
    }
  });
  
  //同时绑定多个元素，并将属性设定在元素上
  upload.render({
    elem: '.demoMore'
    ,before: function(){
      layer.tips('接口地址：'+ this.url, this.item, {tips: 1});
    }
    ,done: function(res, index, upload){
      var item = this.item;
      console.log(item); //获取当前触发上传的元素，layui 2.1.0 新增
    }
  })
  
  //选完文件后不自动上传
  upload.render({
    elem: '#test8'
    ,url: '/upload/'
    ,auto: false
    //,multiple: true
    ,bindAction: '#test9'
    ,done: function(res){
      console.log(res)
    }
  });
  
  //拖拽上传
  upload.render({
    elem: '#test10'
    ,url: '/upload/'
    ,done: function(res){
      console.log(res)
    }
  });
  
  //多文件列表示例
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '/upload/'
    ,accept: 'file'
    ,multiple: true
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
        
        //单个重传
        tr.find('.demo-reload').on('click', function(){
          obj.upload(index, file);
        });
        
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        
        demoListView.append(tr);
      });
    }
    ,done: function(res, index, upload){
      if(res.code == 0){ //上传成功
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html(''); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      this.error(index, upload);
    }
    ,error: function(index, upload){
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
    }
  });
  
  //绑定原始文件域
  upload.render({
    elem: '#test20'
    ,url: '/upload/'
    ,done: function(res){
      console.log(res)
    }
  });
  
});
</script>
    <script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //常规用法
  laydate.render({
    elem: '#test1'
  });
  
  //国际版
  laydate.render({
    elem: '#test1-1'
    ,lang: 'en'
  });
  
  //年选择器
  laydate.render({
    elem: '#test2'
    ,type: 'year'
  });
  
  //年月选择器
  laydate.render({
    elem: '#test3'
    ,type: 'month'
  });
  
  //时间选择器
  laydate.render({
    elem: '#test4'
    ,type: 'time'
  });
  
  //时间选择器
  laydate.render({
    elem: '#test5'
    ,type: 'datetime'
  });
  
  //日期范围
  laydate.render({
    elem: '#test6'
    ,range: true
  });
  
  //年范围
  laydate.render({
    elem: '#test7'
    ,type: 'year'
    ,range: true
  });
  
  //年月范围
  laydate.render({
    elem: '#test8'
    ,type: 'month'
    ,range: true
  });
  
  //时间范围
  laydate.render({
    elem: '#test9'
    ,type: 'time'
    ,range: true
  });
  
  //日期时间范围
  laydate.render({
    elem: '#test10'
    ,type: 'datetime'
    ,range: true
  });
  
  //自定义格式
  laydate.render({
    elem: '#test11'
    ,format: 'yyyy年MM月dd日'
  });
  laydate.render({
    elem: '#test12'
    ,format: 'dd/MM/yyyy'
  });
  laydate.render({
    elem: '#test13'
    ,format: 'yyyyMMdd'
  });
  laydate.render({
    elem: '#test14'
    ,type: 'time'
    ,format: 'H点m分'
  });
  laydate.render({
    elem: '#test15'
    ,type: 'month'
    ,range: '~'
    ,format: 'yyyy-MM'
  });
  laydate.render({
    elem: '#test16'
    ,type: 'datetime'
    ,range: '到'
    ,format: 'yyyy年M月d日H时m分s秒'
  });
  
  //开启公历节日
  laydate.render({
    elem: '#test17'
    ,calendar: true
  });
  
  //自定义重要日
  laydate.render({
    elem: '#test18'
    ,mark: {
      '0-10-14': '生日'
      ,'0-12-31': '跨年' //每年的日期
      ,'0-0-10': '工资' //每月某天
      ,'0-0-15': '月中'
      ,'2017-8-15': '' //如果为空字符，则默认显示数字+徽章
      ,'2099-10-14': '呵呵'
    }
    ,done: function(value, date){
      if(date.year === 2017 && date.month === 8 && date.date === 15){ //点击2017年8月15日，弹出提示语
        layer.msg('这一天是：中国人民抗日战争胜利72周年');
      }
    }
  });
  
  //限定可选日期
  var ins22 = laydate.render({
    elem: '#test-limit1'
    ,min: '2016-10-14'
    ,max: '2080-10-14'
    ,ready: function(){
      ins22.hint('日期可选值设定在 <br> 2016-10-14 到 2080-10-14');
    }
  });
  
  //前后若干天可选，这里以7天为例
  laydate.render({
    elem: '#test-limit2'
    ,min: -7
    ,max: 7
  });
  
  //限定可选时间
  laydate.render({
    elem: '#test-limit3'
    ,type: 'time'
    ,min: '09:30:00'
    ,max: '17:30:00'
    ,btns: ['clear', 'confirm']
  });
  
  //同时绑定多个
  lay('.test-item').each(function(){
    laydate.render({
      elem: this
      ,trigger: 'click'
    });
  });
  
  //初始赋值
  laydate.render({
    elem: '#test19'
    ,value: '1989-10-14'
  });
  
  //选中后的回调
  laydate.render({
    elem: '#test20'
    ,done: function(value, date){
      layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
    }
  });
  
  //日期切换的回调
  laydate.render({
    elem: '#test21'
    ,change: function(value, date){
      layer.msg('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
    }
  });
  //不出现底部栏
  laydate.render({
    elem: '#test22'
    ,showBottom: false
  });
  
  //只出现确定按钮
  laydate.render({
    elem: '#test23'
    ,btns: ['confirm']
  });
  
  //自定义事件
  laydate.render({
    elem: '#test24'
    ,trigger: 'mousedown'
  });
  
  //点我触发
  laydate.render({
    elem: '#test25'
    ,eventElem: '#test25-1'
    ,trigger: 'click'
  });
  
  //双击我触发
  lay('#test26-1').on('dblclick', function(){
    laydate.render({
      elem: '#test26'
      ,show: true
      ,closeStop: '#test26-1'
    });
  });
  
  //日期只读
  laydate.render({
    elem: '#test27'
    ,trigger: 'click'
  });
  
  //非input元素
  laydate.render({
    elem: '#test28'
  });
  
  //墨绿主题
  laydate.render({
    elem: '#test29'
    ,theme: 'molv'
  });
  
  //自定义颜色
  laydate.render({
    elem: '#test30'
    ,theme: '#393D49'
  });
  
  //格子主题
  laydate.render({
    elem: '#test31'
    ,theme: 'grid'
  });
  
  
  //直接嵌套显示
  laydate.render({
    elem: '#test-n1'
    ,position: 'static'
  });
  laydate.render({
    elem: '#test-n2'
    ,position: 'static'
    ,lang: 'en'
  });
  laydate.render({
    elem: '#test-n3'
    ,type: 'month'
    ,position: 'static'
  });
  laydate.render({
    elem: '#test-n4'
    ,type: 'time'
    ,position: 'static'
  });
});
</script>
    <script type="text/javascript">
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  
  
});
</script>
    <script type="text/javascript">
    $(function(){
        $("#save").on("click",function(){
       	layer.msg('拼命上传中,请稍后....', {
       		  icon: 16
       		  ,shade: 0.45
       		});
       	setTimeout(function(){
       	  $("#addForm").submit();
       	  layer.closeAll('loading');
       	}, 2000);
       	 

       });
    	
    	
    	
    });
    
    
    
    </script>
</html>