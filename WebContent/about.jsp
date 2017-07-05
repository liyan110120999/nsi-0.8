<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="people.People_model"%>
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <title>关于新学说</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="/nsi-0.8/assets/about/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  
  <link href="/nsi-0.8/assets/about/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  
  	<link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
      <!--     	自定义css -->
	<link href="assets/css/MyCss.css" rel="stylesheet" />
	   
    <script src="/nsi-0.8/assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="/nsi-0.8/assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="/nsi-0.8/assets/js/custom.js"></script>
	
</head>


			<!-- 	顶栏滚动透明 -->
 	<style type="text/css">  
	        html, body {width:100%;height:100%;} /*非常重要的样式让背景图片100%适应整个屏幕*/  
	        .bg {display: table;width: 100%;height: 100%;padding: 100px 0;text-align: center;color: #fff;background: url(http://www.xiandanke.cn/Image/intro-bg.jpg) no-repeat bottom center;background-color: #000;background-size: cover;}  
	        .my-navbar {padding:20px 0;transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}  
	        .my-navbar a{background:transparent !important;color:#fff !important}  
	        .my-navbar a:hover {color:#45bcf9 !important;background:transparent;outline:0}  
	        .my-navbar a {transition: color 0.5s ease-in-out;}/*-webkit-transition ;-moz-transition*/  
	        .top-nav {padding:0;background:#455a64;}  
	        button.navbar-toggle {background-color:#fbfbfb;}/*整个背景都是transparent透明的，会看不到，所以再次覆盖一下*/  
	        button.navbar-toggle > span.icon-bar {background-color:#dedede}  
	 </style>  
<body>
  
  
  <!-- 		顶栏 -->
		<nav class="navbar navbar-fixed-top my-navbar" role="navigation">  
	        <div class="container-fluid">  
	            <div class="navbar-header l-h-001">  
	                <button type="button" class="navbar-toggle" data-toggle="collapse" 
	                 data-target="#example-navbar-collapse"> 

	                   	<span class="icon-bar"></span> 
                     	<span class="icon-bar"></span> 
                  	 	<span class="icon-bar"></span> 
	                </button>  
	                <a class="navbar-brand l-f24" href="#"><strong>新 学 说</strong></a>  
	            </div>  
	            <div class="collapse navbar-collapse l-f20" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right l-h-002">  
		                <li><a href="/nsi-0.8/list.jsp"><b>学 校</b></a></li>
	                    <li><a href="/nsi-0.8/institution/Institution_list.jsp"><b>机 构</b></a></li>
	                   	<li><a href="/nsi-0.8/people/People_list.jsp"><b>人 员</b></a></li>
	                    <li><a href="#"><b>关 于</b></a></li>
	                    <li><a href="/nsi-0.8/login.jsp"><b>登 录</b></a></li>
		                <li></li>
	                </ul>  
	            </div>  
	        </div>  
	    </nav> 
    
		<script>  
		        $(window).scroll(function () {  
		            if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");  
		            }else {$(".navbar-fixed-top").removeClass("top-nav");}  
		        })
	    </script> 
	    
	    
 

 <div id="index-banner" class="parallax-container">
   
    <div class="no-pad-bot" style="padding-top: 8rem; padding-bottom: 1rem;">
  
	      <div class="container">
	     
	        <h1 class="header center " style="font-size: 56px;">新 学 说</h1>
	        <div class="row center">
	          <h3 class="header col s12 light">专 业 的 国 际 学 校 综 合 服 务 平 台</h3>
	        </div>
	        <div class="row center">
	          
	        </div>
	        <br><br>
	
	      </div>
    </div>
    	<div class="parallax"><img src="/nsi-0.8/assets/about/background1.jpg" alt="Unsplashed background img 1"></div>
  </div>


  <div class="container">
    <div class="section">

      <!--   Icon Section   -->
      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">
<!--             <h2 class="center brown-text"><i class="material-icons">school</i></h2> -->
            <h4 class="center l-f28">学 校</h4>

            <p class="light l-f20">实时更新的中国国际学校数据库</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
<!--             <h2 class="center brown-text"><i class="material-icons">group</i></h2> -->
            <h4 class="center l-f28">人 脉</h4>

            <p class="light l-f20">2000+学校领导和教育行业高管的丰富人脉</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
<!--             <h2 class="center brown-text"><i class="material-icons">account_balance</i></h2> -->
            <h4 class="center l-f28">机 构</h4>

            <p class="light l-f20">对接国际学校所需各类机构和资源</p>
          </div>
        </div>
      </div>

    </div>
  </div>


  <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
      <div class="container">
        <div class="row center">
          <h3 class="header col s12 light">专注于中国国际教育行业信息挖掘，行业资讯传递</h3>
        </div>
      </div>
    </div>
    <div class="parallax"><img src="/nsi-0.8/assets/about/background2.jpg" alt="Unsplashed background img 2"></div>
  </div>

  <div class="container">
    <div class="section">

      <div class="row">
        <div class="col s12 center">
          <h3><i class="mdi-content-send brown-text"></i></h3>
          <h4 class="l-f24">数据可视化</h4>
          <p class="left-align light l-f20" style="text-indent:2em;line-height:40px">挖掘整合中国国际教育行业数据，进行
深度分析报道。提供专业的运营管理咨询，市场拓展和品牌管理等咨询服务。为国际学校之间提供交流平台，对接国际学校所需各类资源。
</p>
        </div>
      </div>

    </div>
  </div>


  <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
      <div class="container">
        <div class="row center">
         <h3 class="header col s12 light">专注于中国国际教育行业信息挖掘，行业资讯传递</h3>
        </div>
      </div>
    </div>
    <div class="parallax"><img src="/nsi-0.8/assets/about/background3.jpg" alt="Unsplashed background img 3"></div>
  </div>


	<div>
		<jsp:include page="/modular/bottomBar.jsp"/>
	</div>

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="/nsi-0.8/assets/about/js/materialize.js"></script>
  <script src="/nsi-0.8/assets/about/js/init.js"></script>

	
  </body>
</html>
