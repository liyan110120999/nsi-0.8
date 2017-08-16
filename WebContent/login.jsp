<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>  
<%@ page contentType="text/html;charset=UTF-8"%>  
<html>
<head>

		<link href="assets/css/bootstrap.css" rel="stylesheet" />
	     <!-- FONTAWESOME STYLE CSS -->
	    <link href="assets/css/font-awesome.css" rel="stylesheet" />
	    <!-- CUSTOM STYLE CSS -->
	    <link href="assets/css/style.css" rel="stylesheet" />
		  <!--     	自定义css -->
	    <link href="assets/css/MyCss.css" rel="stylesheet" />
		<script src="assets/js/jquery-1.11.1.js"></script>
	    <!-- BOOTSTRAP SCRIPTS  -->
	    <script src="assets/js/bootstrap.js"></script>
	    <!-- CUSTOM SCRIPTS  -->
	    <script src="assets/js/custom.js"></script>
	    
<title>新学说-登录</title>
<meta charset="UTF-8">
<!-- 	自适应标签 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />

</head>

	<style type="text/css"> 
		#formDIV
		{		
			background-color:#c7d0d5;
			box-shadow: 5px 5px 3px #333333;
			border-radius:10px;
		}
	</style>
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
	
	
<script language="javascript">
  function fcheck()
  {
    var uid = document.all.username.value;
    var pwd = document.all.password.value;
    if(uid=="")
    {
      alert("用户名不能为空!!!");
      return;
    }
    if(pwd=="")
    {
      alert("密码不能为空!!!");
      return;
    }
    if(pwd.length<6)
    {
      alert("密码长度不得小于6!!!");
      return;
    }    
    document.loginform.submit();
  }
</script>
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
		                <li><a href="#"><b>学 校</b></a></li>
	                    <li><a href="#"><b>机 构</b></a></li>
	                   	<li><a href="#"><b>人 员</b></a></li>
	                    <li><a href="about.jsp"><b>关 于</b></a></li>
	                    <li><a href="login.jsp" class="active-menu-item"><b>登 录</b></a></li>
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


			<div class="carousel slide" id="carousel-466145" data-ride="carousel">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-466145">
					</li>
					<li data-slide-to="1" data-target="#carousel-466145">
					</li>
					<li data-slide-to="2" data-target="#carousel-466145">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="assets/img/header02.jpeg" />
						<div class="carousel-caption">
							<h3>
								新学说 学校数据库
							</h3>
							<p>
								挖掘整合中国国际教育行业数据，进行深度分析报道，建立行业平台
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="assets/img/header02.jpeg" />
						<div class="carousel-caption">
							<h3>
								新学说 人脉数据库
							</h3>
							<p>
								提供全方位的行业资讯，行业研究/市场研究数据，投资建校咨询。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="assets/img/header02.jpeg" />
						<div class="carousel-caption">
							<h3>
								新学说 机构数据库
							</h3>
							<p>
								为国际学校之间提供交流平台，对接国际学校所需各类资源；提供专业的运营管理咨询，市场拓展和品牌管理等咨询服务。
							</p>
						</div>
					</div>
				</div> 
				<a class="left carousel-control" href="#carousel-466145" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-466145" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>

    <%   
    String loginResult="null";
    String Codefal="Codefal";
    String userfalse="userfal";
    
    String aaa ="kong";
//     loginResult=request.getAttribute("loginResult").toString();   
//     if(loginResult.equals(userfalse)){
	if(request.getAttribute("loginResult")!=null){
		aaa=(String)request.getAttribute("loginResult");
	}else{
		 aaa="kong02";
	}
	
	if(aaa.equals(userfalse)){
    	%>
		<script>
			confirm("账号或密码错误，重新输入"); 
		</script>
		<%
    }else if(aaa.equals(Codefal)){    	
    	%>
		<script>
			confirm("您的账号没有激活或暂未通过审核，请检查邮箱是否收到激活邮件，若已激活请耐心等待审核。"); 
		</script>
		<%
    }else {
    	loginResult="kong";
    }   
    %>
<section>
	<div class="container">
		<div class="row clearfix">		
			<div class="col-md-8 column center-block" style="margin-top:2%;">		
				<img src="assets/img/pic-login.jpg"  width="550" height="450"class="img-responsive" alt="响应式图像"/>				
			</div>
			<br>
				
			<div class="col-md-3 column form-group">
				<br>
				<form role="form" name="loginform" action="ServletControl" method="post" style="padding: 15px;">
					<div class="form-group">
						 <label for="exampleInputEmail1" >用户名</label>
						 <input name="username" type="text" class="form-control" id="username" placeholder="请输入账号" />
					</div>
					<div class="form-group">
						 <label for="exampleInputPassword1">密&nbsp;&nbsp;&nbsp;码</label>
						 <input name="pwd" type="password" class="form-control" id="password" placeholder="请输入密码"/>
					</div>			
					<div style="margin-bottom:15px;">
						<label style="font-size:15px;color:#555;font-weight:normal;cursor: pointer;margin-bottom: 0px;">
            				<input type="checkbox" value="remember-me"> 记住密码
         				 </label> 				 
					</div> 
<!-- 						type 不能为submit ,会重复提交表单 （js） -->
						<button type="button" class="btn btn-primary form-control" onclick="fcheck()">登 录</button>	
						
															
				</form>
				<div style="float:right;padding-right:20px;">
					<a href="/nsi-0.8/User/register.jsp">注 册</a>
<!-- 					<a >注 册</a> -->
					<span class="dotted">|</span>
					<a>忘记密码</a>
					<span class="dotted">|</span>
					<a>意见反馈</a>
				</div>
				
			</div>
		</div>
	</div>
</section>
   
   
   	<!--     导入底栏jsp文件 -->
	<div><jsp:include page="modular/bottomBar.jsp"/>
	</div>
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
    


	</body>  
</html>