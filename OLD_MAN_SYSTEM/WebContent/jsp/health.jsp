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
		<title>客户健康信息管理:</title>
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
    <body>
    <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<form class="layui-form layui-form-pane" action="">
  <div class="layui-form-item">
  
      <div class="layui-btn-group"  style=“margin-left:100px;”>
 <a class="layui-btn layui-btn-sm"   href="health/toAdd"><i class="layui-icon">添加</i></a>
  </div>
  </div>
  </form>
<table class="layui-hide" id="test" lay-filter="demo"></table>

	</body>
    
    <script   type="text/javascript">
layui.config({
  version: '1512984638033' //为了更新 js 缓存，可忽略
});
 
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
  var laydate = layui.laydate //日期
  ,laypage = layui.laypage //分页
  layer = layui.layer //弹层
  ,table = layui.table //表格
  ,carousel = layui.carousel //轮播
  ,upload = layui.upload //上传
  ,element = layui.element; //元素操作
  
  //向世界问个好
  layer.msg('Welcom!');
  
  //监听Tab切换
  element.on('tab(demo)', function(data){
    layer.msg('切换了：'+ this.innerHTML);
    console.log(data);
  });
  
  //执行一个 table 实例
  table.render({
    elem: '#test'
    ,height: 440
    ,url: 'health/list' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'HEALTH_ID', title: 'ID', width:120, sort: true, fixed: 'left',align:'center'}
      ,{field: 'CUST_ID', title: '客户编号', width:120, sort: true,align:'center'}
      ,{field: 'CUSTOMER_NAME', title: '客户姓名', width:200,align:'center'} 
      ,{field: 'SICK_HISTORY', title: '病历', width: 200,align:'center'}
      ,{field: 'SELF_CARE', title: '自理情况', width: 150, sort: true ,align:'center'}
      ,{field: 'EMPLOYEE_ID', title: '护理人编号', width: 150, sort: true ,align:'center'}
      ,{field: 'EMPLOYEE_NAME', title: '护理人姓名', width: 150, sort: true ,align:'center'}
      ,{fixed: 'right', width: 345, align:'center', toolbar: '#barDemo'} 
    ]]
  });
  
  //监听工具条
  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    
	   var info="<font color=00CCFF >编号:"+obj.data.HEALTH_ID+"</font><br>";
   	   info=info+"<font color=00CCFF >客户编号:"+obj.data.CUST_ID+"</font><br>";
   	 info=info+"<font color=00CCFF >客户名称:"+obj.data.CUSTOMER_NAME+"</font><br>";
   	info=info+"<font color=00CCFF >病历:"+obj.data.SICK_HISTORY+"</font><br>";
   	info=info+"<font color=00CCFF >自理情况:"+obj.data.SELF_CARE+"</font><br>";
   	info=info+"<font color=00CCFF >护理人编号:"+obj.data.EMPLOYEE_ID+"</font><br>";
   	info=info+"<font color=00CCFF> 护理人姓名:"+obj.data.EMPLOYEE_NAME+"</font><br>";
   if(layEvent === 'detail'){
      layer.msg('查看操作'+obj.data.HEALTH_ID);
      
	   layer.open({
   		   type: 0,
   		   shade: false,
   		   title: false, //不显示标题
   		   content: info //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
   		 });
    } else if(layEvent === 'del'){
      layer.confirm('确定删除吗', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        del(obj.data.HEALTH_ID);
        //向服务端发送删除指令
      });
    } else if(layEvent === 'edit'){
    	alert(obj.data.HEALTH_ID);
      window.location.href="health/toUpdate?HEALTH_ID="+obj.data.HEALTH_ID;
    }
  });
  
  //执行一个轮播实例
  carousel.render({
    elem: '#test1'
    ,width: '100%' //设置容器宽度
    ,height: 200
    ,arrow: 'none' //不显示箭头
    ,anim: 'fade' //切换动画方式
  });
  
  //将日期直接嵌套在指定容器中
  var dateIns = laydate.render({
    elem: '#laydateDemo'
    ,position: 'static'
    ,calendar: true //是否开启公历重要节日
    ,mark: { //标记重要日子
      '0-10-14': '生日'
      ,'2017-11-11': '剁手'
      ,'2017-11-30': ''
    } 
    ,done: function(value, date, endDate){
      if(date.year == 2017 && date.month == 11 && date.date == 30){
        dateIns.hint('一不小心就月底了呢');
      }
    }
    ,change: function(value, date, endDate){
      layer.msg(value)
    }
  });
  
  //分页
  laypage.render({
    elem: 'pageDemo' //分页容器的id
    ,count: 100 //总页数
    ,skin: '#1E9FFF' //自定义选中色值
    //,skip: true //开启跳页
    ,jump: function(obj, first){
      if(!first){
        layer.msg('第'+ obj.curr +'页');
      }
    }
  });
  
  //上传
  //底部信息
/*   var footerTpl = lay('#footer')[0].innerHTML;
  lay('#footer')[0].innerHTML = layui.laytpl(footerTpl).render({}); */
});
function del(tag){
	 var isbn=tag
	
				 $.ajax({
				       type:"POST",
				       url: "health/del",
				       data:{HEALTH_ID:isbn
				       },
				       dataType:"json",
				       contentType:"application/x-www-form-urlencoded;charset=utf-8",
				       success:function(data){
				    	   if(data.flag){
				    		   layer.msg('删除成功！', {icon: 1});
				    		   setTimeout(function(){
				    			 }, 2000);
				    		   
				    	   }
				    	   else{
				    		   layer.msg('删除失败!');
				    	   }
				       }
				}); 
		
	 
}
function sel(){
	
		var HEALTH_ID=$("#HEALTH_ID").val();
  	//alert("客户信息"+clientIsbn);
 		 $.ajax({
		       type:"POST",
		       ansyc:false,
		       url: "health/signal",
		       data:{HEALTH_ID:HEALTH_ID
		       },
		       dataType:"json",
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   var info="<font color=00CCFF >编号:"+data.HEALTH_ID+"</font><br>";
		       	   info=info+"<font color=00CCFF >客户编号:"+data.CUSTOMER_ID+"</font><br>";
		       	 info=info+"<font color=00CCFF >客户名称:"+data.CUSTOMER_NAME+"</font><br>";
		       	info=info+"<font color=00CCFF >病历:"+data.SICK_HISTORY+"</font><br>";
		       	nfo=info+"<font color=00CCFF >护理情况:"+data.SELF_CARE+"</font><br>";
		       	info=info+"<font color=00CCFF >护理人编号:"+data.EMPLOYEE_ID+"</font><br>";
		       	info=info+"<font color=00CCFF> 护理人姓名:"+data.EMPLOYEE_NAME+"</font><br>";
		     	
		     	
		     	
		     	
		         	
		         	
		         	
		    	   layer.open({
		    		   type: 0,
		    		   shade: false,
		    		   title: false, //不显示标题
		    		   content: info //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
		    		 });
		       }
		});
	
	
	
	
}
</script>

    
</html>