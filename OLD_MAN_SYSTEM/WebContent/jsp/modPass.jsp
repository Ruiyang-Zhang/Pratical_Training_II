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
		<title>H5模版:</title>
                   <link rel="stylesheet" href="layer/layui/css/layui.css"  media="all">
          <link href="jsp/css/style.css" rel="stylesheet" type="text/css"/>
	       <script language="JavaScript" src="jsp/js/jquery.js"></script>
           <script src="layer/layer.js"></script>
           <script src="layer/layui/layui.js" charset="utf-8"></script>
   
    </head>
	<body>
		
<div class="place">

    <ul class="placeul">
        <li>密码修改</li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>修改密码</span></div>
     <form action="ClientAddServlet.do" id="addForm"method="post">
    <ul class="forminfo">
    
      <li><label>帐号</label><input name="username" id="username" type="text" class="dfinput"/></li>
      <li><label>密码</label><input name="password" id="password" type="text" class="dfinput"/></li>
      <li><label>新密码</label><input name="newPassword" id="newPassword" type="password" class="dfinput"/></li>
      <li><label>确认密码</label><input name="conPassword" id="conPassword" type="password" class="dfinput"/></li>

        <li><label>&nbsp;</label><input name="save" id="save" type="button" class="btn" value="保存" id="save"/></li>
    </ul>
    </form>
</div>
	</body>
    <script type="text/javascript">
    $(function(){
        $("#save").on('click',function(){
      		var account=$("#username").val();
      		var password=$("#password").val();
      		var newPassword=$("#newPassword").val();
      		var conPassword=$("#conPassword").val();
      		if(newPassword!=conPassword){
      			layer.msg('新密码不一致');
      			return false;
      		}
      		if(account==null){
      			layer.msg('账号不能为空!');
      			return false;
      		}
      		if(password==null){
      			layer.msg('原始密码不能为空');
      			return false;
      		}
      		if(newPassword==null){
      			layer.msg('新密码不能为空!');
      			return false;
      		}
      		if(conPassword==null){
      			layer.msg('确认密码不能为空!');
      			return false;
      		}
      		
      		
      		
      		
      		$.ajax({
   		       type:"POST",
   		       ansyc:false,
   		       url: "user/modPass",
   		       data:{
   		    	     account:account,
   		    	     password:password,
   		    	     newpwd:newPassword
   		       },
   		       dataType:"json",
   		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
   		       success:function(data){
   		    	   if(data.flag){
   		    		layer.msg('密码修改成功');
   		    		
   		    	   }else{
   		    	   	   layer.open({
   	   		    		   type: 0,
   	   		    		   shade: false,
   	   		    		   title: false, //不显示标题
   	   		    		   content: "用户名密码错误！" //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
   	   		    		 });
   		    	   }
   		    
   		       }
   		});
      	});
    	
    	
    	
    });
    
    
    
    </script>
</html>