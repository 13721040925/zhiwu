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
        <link rel="stylesheet" href="css/style.css"/>
        
    </head>
    <body>
        <audio src="mp3/bg.mp3" type="audio/mpeg" autoplay="true" loop="true" style="height:0px;">
          
        </audio>
        <div class="body">
            <div class="back" id="main">
                <img src="img/background.png"/>
                <div class="enemy">
                    <!--动态添加-->
                </div>
                <div class="army">
                     <!--动态添加-->
                </div>
                <div class="bullet">
                   <!--动态添加-->
                </div>
                <div class="lastarmy">
                     <!--未实现-->
                </div>
                <img class="remember" id="remember" src="img/1.png" style="opacity:0.3;left:0%;top:14%;width:5%;height:12%;"/>
                <div class="touch">
                    <!--1-->
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="1" data-row="1" data-top="14" data-left="25.5" style="left:25.5%;top:14%;width:5%;height:12%;" ></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="2" data-row="1" data-top="14" data-left="31" style="left:31%;top:14%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="3" data-row="1" data-top="14" data-left="37" style="left:37%;top:14%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="4" data-row="1" data-top="14" data-left="42.8" style="left:42.8%;top:14%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="5" data-row="1" data-top="14" data-left="48.5" style="left:48.5%;top:14%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="6" data-row="1" data-top="14" data-left="54.5" style="left:54.5%;top:14%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="7" data-row="1" data-top="14" data-left="60" style="left:60%;top:14%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="8" data-row="1" data-top="14" data-left="65.5" style="left:65.5%;top:14%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="9" data-row="1" data-top="14" data-left="71" style="left:71%;top:14%;width:5%;height:12%;"></div>
                    <!-- onmouseover="touchover(this)"2onclick="insertarmy(this)" -->
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="1" data-row="2" data-top="29" data-left="25.5" style="left:25.5%;top:29%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="2" data-row="2" data-top="29" data-left="31" style="left:31%;top:29%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="3" data-row="2" data-top="29" data-left="37" style="left:37%;top:29%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="4" data-row="2" data-top="29" data-left="42.8" style="left:42.8%;top:29%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="5" data-row="2" data-top="29" data-left="48.5" style="left:48.5%;top:29%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="6" data-row="2" data-top="29" data-left="54.5" style="left:54.5%;top:29%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="7" data-row="2" data-top="29" data-left="60" style="left:60%;top:29%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="8" data-row="2" data-top="29" data-left="65.5" style="left:65.5%;top:29%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="9" data-row="2" data-top="29" data-left="71" style="left:71%;top:29%;width:5%;height:12%;"></div>
                    <!-- onmouseover="touchover(this)"3onclick="insertarmy(this)" -->
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="1" data-row="3" data-top="45" data-left="25.5" style="left:25.5%;top:45%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="2" data-row="3" data-top="45" data-left="31" style="left:31%;top:45%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="3" data-row="3" data-top="45" data-left="37" style="left:37%;top:45%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="4" data-row="3" data-top="45" data-left="42.8" style="left:42.8%;top:45%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="5" data-row="3" data-top="45" data-left="48.5" style="left:48.5%;top:45%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="6" data-row="3" data-top="45" data-left="54.5" style="left:54.5%;top:45%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="7" data-row="3" data-top="45" data-left="60" style="left:60%;top:45%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="8" data-row="3" data-top="45" data-left="65.5" style="left:65.5%;top:45%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="9" data-row="3" data-top="45" data-left="71" style="left:71%;top:45%;width:5%;height:12%;"></div>
                    <!-- onmouseover="touchover(this)"4onclick="insertarmy(this)" -->
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="1" data-row="4" data-top="61" data-left="25.5" style="left:25.5%;top:61%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="2" data-row="4" data-top="61" data-left="31" style="left:31%;top:61%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="3" data-row="4" data-top="61" data-left="37" style="left:37%;top:61%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="4" data-row="4" data-top="61" data-left="42.8" style="left:42.8%;top:61%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="5" data-row="4" data-top="61" data-left="48.5" style="left:48.5%;top:61%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="6" data-row="4" data-top="61" data-left="54.5" style="left:54.5%;top:61%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="7" data-row="4" data-top="61" data-left="60" style="left:60%;top:61%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="8" data-row="4" data-top="61" data-left="65.5" style="left:65.5%;top:61%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="9" data-row="4" data-top="61" data-left="71" style="left:71%;top:61%;width:5%;height:12%;"></div>
                    <!-- onmouseover="touchover(this)"5onclick="insertarmy(this)" -->
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="1" data-row="5" data-top="76" data-left="25.5" style="left:25.5%;top:76%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="2" data-row="5" data-top="76" data-left="31" style="left:31%;top:76%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="3" data-row="5" data-top="76" data-left="37" style="left:37%;top:76%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="4" data-row="5" data-top="76" data-left="42.8" style="left:42.8%;top:76%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="5" data-row="5" data-top="76" data-left="48.5" style="left:48.5%;top:76%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="6" data-row="5" data-top="76" data-left="54.5" style="left:54.5%;top:76%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="7" data-row="5" data-top="76" data-left="60" style="left:60%;top:76%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="8" data-row="5" data-top="76" data-left="65.5" style="left:65.5%;top:76%;width:5%;height:12%;"></div>
                    <div onmouseover="touchover(this)" onclick="insertarmy(this)" class="point" data-col="9" data-row="5" data-top="76" data-left="71" style="left:71%;top:76%;width:5%;height:12%;"></div>
                </div>
                <div class="leftmenu">
                    <div style="padding:6px;width:1100%;height:12%;" class="sss" onclick="resetarmytype(this,'img/1.png',5,80,500)">
                        <img src="img/armytype/1.png"  style="width:100%;height:100%;"/>
                    </div>
                    <div style="padding:6px;width:1100%;height:12%;" class="sss"   onclick="resetarmytype(this,'img/3.png',10,120,800)">
                        <img src="img/armytype/2.png" style="width:100%;height:100%;"/>
                    </div>
                    <div style="padding:6px;width:600%;height:12%;" class="sss" onclick="nosetarmytype(this)">
                        <img src="img/11.png" style="width:100%;height:100%;" />
                    </div>
                </div>
                <a onclick="history.back(-1)" class="leftbottommenu" style="display:block;width:5%;height:12%;margin:6px;" href="#">
                    <img src="img/22.png"  />
                </a>
                <div class="topmenu">
                        <img src="img/a.png" style="width:6%;height:600%;float:right;margin:6px;" onclick="pause()"/>
                        <img src="img/b.png" style="width:6%;height:600%;float:right;margin:6px;" onclick="continuous()"/>
                        <div style="width:20%;background:green;height:600%;float:right;margin:6px 6px;">
                           <img id="processbar" style="width:100%;height:100%;margin:0" src="img/processbar/1.png"/>
                        </div>
                        <div style="width:32%;height:600%;float:right;margin:6px 6px;">
                            <img id="processbar" style="width:10%;height:100%;margin:0" src="img/111.png"/>&nbsp;<span id="money" style="font-size:32px;line-height:32px;">0</span>
                         </div>
                </div>
            </div>
        </div>
        <div class="pop" >
            READY GO
        </div>
        <script type="text/javascript" src="js/timeline.js"></script>
      <script type="text/javascript">
            window.onload=function(){
                start();
            }
      </script>
    </body>
</html>