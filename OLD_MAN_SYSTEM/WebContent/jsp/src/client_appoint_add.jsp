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
                   <link rel="stylesheet" href="layui/css/layui.css"  media="all">
          <link href="jsp/css/style.css" rel="stylesheet" type="text/css"/>
	       <script language="JavaScript" src="jsp/js/jquery.js"></script>
           <script src="layer/layer.js"></script>
           <script src="layui/layui.js" charset="utf-8"></script>
   
    </head>
	<body>
		
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li>品种信息</li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>下单</span></div>
     <form action="dog/addClientApooint" id="addForm"method="post">
    <ul class="forminfo">
      <li><label>品种编号</label><input name="dogTypeIsbn" id="dogTypeIsbn" type="text" readonly="readonly" value="${dogType.dogTypeIsbn }"class="dfinput"/></li>

         <li><label>图片:${dogType.dogTypeName }</label>
           <img alt="" src="upload/${dogType.dogTypeImg }">
         </li>
         <li><label>介绍</label>
           <textarea rows="5" cols="80">
           ${dogType.dogIntroduce}
           </textarea>
         </li>
        <li><label>&nbsp;</label><input name="save" id="save" type="button" class="btn" value="下单" id="save"/></li>
    </ul>
    </form>
</div>
	</body>
    <script type="text/javascript">
    $(function(){
   	 $.ajax({
	       type:"POST",
	       ansyc:false,
	       url: "dogType/getAllType",
	       data:{
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	    	   for(var i=0;i<data.list.length;i++)
	   	    	 {  
	   	    		$("#dogTypeIsbn").append('<option value='+data.list[i].dogTypeIsbn+'>'+data.list[i].dogTypeName+'</option>'); 
	   	    	 }
	    	 
	       }
	}); 
    	
    	
    	
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
       	 $.ajax({
  	       type:"POST",
  	       ansyc:false,
  	       url: "client/addAppoint",
  	       data:{dogTypeIsbn:$("#dogTypeIsbn").val()
  	       },
  	       dataType:"json",
  	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
  	       success:function(data){
  	    	 if(data.flag==false){
  	    		layer.open({
		    		   type: 0,
		    		   shade: false,
		    		   title: false, //不显示标题
		    		   content: '数量不足！' //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
		    		 });
  	    	 }else{
  	    		layer.open({
		    		   type: 0,
		    		   shade: false,
		    		   title: false, //不显示标题
		    		   content: '订单号:'+data.appointId //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
		    		 });
  	    	 }
  	    	 
  	       }
  	});
       	  layer.closeAll('loading');
       	}, 2000);
       	 

       });
    	
    	
    	
    });
    
    
    
    </script>
</html>