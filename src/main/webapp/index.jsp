<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="icon" href="img/logo.jpg" type="image/x-icon"> 
		<link rel="shortcut icon" href="img/logo.jpg" type="image/x-icon">
        <title>冰山植物大战僵尸</title>
        <link rel="stylesheet" href="css/start_style.css"/>
    </head>
    <body>
    	<div id="box">
        	<div class="content" style="text-align:center">
        		<img src="images/22.png" id="bgimg">
                <h1>僵尸必须死</h1>
                <p>小心，别让僵尸偷了你的家！！</p>
                <a href="part.html" id="start">开始游戏</a>
       		</div>
    	</div>
    </body>
</html>

