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
	<title>颐养中心信息管理系统</title>
<link href="jsp/css/style.css" rel="stylesheet" type="text/css" />
      <link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link href="jsp/css/style.css" rel="stylesheet" type="text/css" />
               <link href="jsp/css/jquery.idcode.css" rel="stylesheet" type="text/css" />
       <script type="text/javascript" src="jsp/js/jquery.js"></script>
       <script type="text/javascript" src="jsp/js/weather.js"></script>
          <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
<script language="JavaScript" src="jsp/js/jquery.js"></script>
<script src="jsp/js/cloud.js" type="text/javascript"></script>
<script src="jsp/js/jquery.idcode.js" type="text/javascript"></script>
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script>

<style>
body {
  background: #060e1b;
  overflow: hidden;
}

canvas {
  //opacity: 0.5;
}

/* Demo Buttons Style */
.codrops-demos {
	font-size: 0.8em;
	text-align:center;
	position:absolute;
	z-index:99;
	width:96%;
}

.codrops-demos a {
	display: inline-block;
	margin: 0.35em 0.1em;
	padding: 0.5em 1.2em;
	outline: none;
	text-decoration: none;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	border-radius: 2px;
	font-size: 110%;
	border: 2px solid transparent;
	color:#fff;
}

.codrops-demos a:hover,
.codrops-demos a.current-demo {
	border-color: #383a3c;
}
</style> 
	
    </head>
<body >





<div class="logintop">    
    <span><font color="white">颐养中心信息管理系统</font></span>    
        <ul>
    <li><a href="javascript:void(0);"><font color="white">系统登录页面</font></a></li>
    </ul>   
    </div>
    
    <div class="" style="margin-top:0px;">
    
       
    <div class="loginbox"style="margin-top:180px;">
  
    <ul>
    <form action="user/login""   id="loginForm" method="POST">
    <li><p style="text-align:center;"><font color="red">${MSG }</font></p></li>
    <li><input name="ACCOUNT" type="text" class="loginuser" value="admin"/></li>
    <li><input name="PASSWORD"  id="password"  type="password" class="loginpwd" value="密码" placeholder="请输入密码" /></li>
  <li> <div><input type="text" id="Txtidcode" class="layui-input"   style="width:50%;float:left;" placeholder="请输入验证码"  /> <span id="idcode"    style="width:40%;float:right;"></span></div></li>
   
    <li><input  type="button"  id="login" class="layui-btn layui-btn-radius" value="登录" style="width:150px;margin-left:100px;margin-top:20px;"/></li>

    </form>
    </ul>
    </div>
    
    </div>
    
    <canvas id="canvas"></canvas>
    
    <div class="loginbm"><font color="black">设计 </font></div>
	
    
</body>
<script type="text/javascript">
$(function(){
	
$("#login").on('click',function(){

	var IsBy = $.idcode.validateCode();
	
	
	if(IsBy){
		var password=$("#password").val();
		var reg = new RegExp(/^(?![^a-zA-Z]+$)(?!\D+$)/);
		 if ( password.length < 8) {
			 layer.msg('密码长度不得小于8位！');
		    }
		if (reg.test(password)){
			
			$("#loginForm").submit();		
		}
		else{
			layer.msg('密码必须包含数字和字母！');
			
		}
		
		
	}else{
		

	}

	
});


});



</script>
<script>
"use strict";

var canvas = document.getElementById('canvas'),
  ctx = canvas.getContext('2d'),
  w = canvas.width = window.innerWidth,
  h = canvas.height = window.innerHeight,
    
  hue = 217,
  stars = [],
  count = 0,
  maxStars = 1400;

// Thanks @jackrugile for the performance tip! http://codepen.io/jackrugile/pen/BjBGoM
// Cache gradient
var canvas2 = document.createElement('canvas'),
    ctx2 = canvas2.getContext('2d');
    canvas2.width = 100;
    canvas2.height = 100;
var half = canvas2.width/2,
    gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);
    gradient2.addColorStop(0.025, '#fff');
    gradient2.addColorStop(0.1, 'hsl(' + hue + ', 61%, 33%)');
    gradient2.addColorStop(0.25, 'hsl(' + hue + ', 64%, 6%)');
    gradient2.addColorStop(1, 'transparent');

    ctx2.fillStyle = gradient2;
    ctx2.beginPath();
    ctx2.arc(half, half, half, 0, Math.PI * 2);
    ctx2.fill();

// End cache

function random(min, max) {
  if (arguments.length < 2) {
    max = min;
    min = 0;
  }
  
  if (min > max) {
    var hold = max;
    max = min;
    min = hold;
  }

  return Math.floor(Math.random() * (max - min + 1)) + min;
}

var Star = function() {

  this.orbitRadius = random(w / 2 - 50);
  this.radius = random(100, this.orbitRadius) / 10;
  this.orbitX = w / 2;
  this.orbitY = h / 2;
  this.timePassed = random(0, maxStars);
  this.speed = random(this.orbitRadius) / 900000;
  this.alpha = random(2, 10) / 10;

  count++;
  stars[count] = this;
}

Star.prototype.draw = function() {
  var x = Math.sin(this.timePassed + 1) * this.orbitRadius + this.orbitX,
      y = Math.cos(this.timePassed) * this.orbitRadius/2 + this.orbitY,
      twinkle = random(10);

  if (twinkle === 1 && this.alpha > 0) {
    this.alpha -= 0.05;
  } else if (twinkle === 2 && this.alpha < 1) {
    this.alpha += 0.05;
  }

  ctx.globalAlpha = this.alpha;
    ctx.drawImage(canvas2, x - this.radius / 2, y - this.radius / 2, this.radius, this.radius);
  this.timePassed += this.speed;
}

for (var i = 0; i < maxStars; i++) {
  new Star();
}

function animation() {
    ctx.globalCompositeOperation = 'source-over';
    ctx.globalAlpha = 0.8;
    ctx.fillStyle = 'hsla(' + hue + ', 64%, 6%, 1)';
    ctx.fillRect(0, 0, w, h)
  
  ctx.globalCompositeOperation = 'lighter';
  for (var i = 1, l = stars.length; i < l; i++) {
    stars[i].draw();
  };  
  
  window.requestAnimationFrame(animation);
}

animation();
</script>
<script type="text/javascript">
$(function(){

	$.idcode.setCode();


});



</script>
</html>