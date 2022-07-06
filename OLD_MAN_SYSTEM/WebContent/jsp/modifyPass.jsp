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
           <link rel="stylesheet" href="layer/layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="jsp/css/reset.css" />
        <link rel="stylesheet" href="jsp/css/content.css" />
        <script src="jsp/js/jquery.js"></script>
        <script src="layer/layer.js"></script>
        <script src="layer/layui/layui.js" charset="utf-8"></script>
	</head>
	<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">修改密码</a>></div>
		<div class="public-content">
			<div class="public-content-cont">
			<form action="user/modifyUserPass" id="modForm" method="post">
			
				<div class="form-group">
					<label for="">账号</label>
					<input class="form-input-txt" type="text" name="account" id="account" value="" />
				</div>
                 <div class="form-group">
                    <label for="">密码</label>
                    <input class="form-input-txt" type="password" name="password" id="password" value="" />
                </div>
                 <div class="form-group">
                    <label for="">新密码</label>
                    <input class="form-input-txt" type="password" name="new_password" id="new_password" value="" />
                </div>
                 <div class="form-group">
                    <label for="">确认密码</label>
                    <input class="form-input-txt" type="password" name="confirm_pas" id="confirm_pas" value="" />
                </div>
                <div class="form-group">
                    <input class="layui-btn layui-btn-normal layui-btn-radius" style="margin-left:150px;margin-top:30px;" type="button" name="modify" id="modify" value="保存" />
                </div>
				</form>
			</div>
		</div>
	</div>
<script src="../kingediter/kindeditor-all-min.js"></script>
<script src="../js/laydate.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#modify").on("click",function(){
	    if($("#account").val()==""||$("#account").val()==null){
	    	layer.tips('账号不能为空', '#account');
	    	return false;
	    }
		if($("#password").val()==""||$("#password").val()==null){
			layer.tips('密码不能为空', '#password');
	    	return false;
	    }
		if($("#new_password").val()==""||$("#new_password").val()==null){
			layer.tips('新密码不能为空', '#new_password');
			return false;
		}
		if($("#confirm_pas").val()==""||$("#confirm_pas").val()==null){
			layer.tips('确认密码不能为空', '#confirm_pas');
		return false;
		}
		if($("#new_password").val()!=$("#confirm_pas").val()){
			$("#new_password").val("");
			$("#confirm_pas").val("");
			layer.msg('密码不一致，请重新输入');
		    return false;
		}
		if($("#new_password").val().length<6||$("#new_password").val().length>8){
			
			layer.msg('密码长度必须在6-8,请重新输入');
			$("#new_password").val("");
			$("#confirm_pas").val("");
		    return false;
			
		}
		$.ajax({
	 	       type:"POST",
	 	       ansyc:false,
	 	       url: "user/modifyUserPass",
	 	       data:{account:$("#account").val(),
	 	    	   password:$("#password").val(),
	 	    	  newPassword:$("#new_password").val()
	 	       },
	 	       dataType:"json",
	 	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	 	       success:function(data){
	 	    	 if(data.flag){
	 	    		 layer.msg('修改成功！', {icon: 1});
		    		   setTimeout(function(){
		    			   window.parent.location.href="user/loginOut";
		    			 }, 2000);
	 	    	 }else{
	 	    		layer.msg('用户名密码不对！', {icon: 1});
	 	    	 }
	 	       }
	 	}); 
});
	
});
</script>
</body>
</html>