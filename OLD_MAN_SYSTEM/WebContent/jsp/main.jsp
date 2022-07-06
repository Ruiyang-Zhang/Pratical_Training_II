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
<frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
 <frame src="jsp/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
   <frameset cols="197,*" frameborder="no" border="0" framespacing="0">
    <frame src="jsp/left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="jsp/index.jsp" name="rightFrame" id="rightFrame" title="rightFrame" />
   </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>