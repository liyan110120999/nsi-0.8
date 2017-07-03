<%@page import="Institution.Institution_model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="people.People_model"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>新学说机构-详细信息</title>

</head>
		<link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
	     <!-- FONTAWESOME STYLE CSS -->
	    <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
	    <!-- CUSTOM STYLE CSS -->
	    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
	    <script src="assets/js/jquery-1.11.1.js"></script>
	    <!-- BOOTSTRAP SCRIPTS  -->
	    <script src="assets/js/bootstrap.js"></script>
	    <!-- CUSTOM SCRIPTS  -->
	    <script src="assets/js/custom.js"></script>
	    
	<style>
		body{background-color:#c7d0d5}
	</style>
	
	<style>
		li{
		text-align:center;
		}
		.font-title01{ font-size:25px;line-height:120%;}
		.font-title02{ font-size:22px;line-height:120%;}
		.font-title03{ font-size:18px;line-height:120%;}
		
	</style>
	<!-- 	不打印 -->
	<style media=print type="text/css"> 
		.noprint{visibility:hidden} 
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
	
	<script type="text/javascript">
		function SubmitAlter(){
				document.getElementById("alterForm").submit();			
		}
		
		function ConfirmDelete(){
			var x;
			var r=confirm("确定要删除本条记录吗？");
			if (r==true){
				document.getElementById("deleteForm").submit();
			}
			else{
				x="你按下了\"取消\"按钮!";
			}			
		}
// 		按钮
		function UpImageSubmit(){
			document.getElementById("UpImageForm").submit();			
		}
		
	</script>
<body>
	
	<%
		    	//   获取session用户		     		
		String username ="空";
		if(session.getAttribute("Session_user")==null){
				//	 登录超时,跳转到login
			response.sendRedirect("/nsi-0.8/login.jsp");
		}else{
			username = session.getAttribute("Session_user").toString();
		}
	
	List<Institution_model> list = (List<Institution_model>)request.getAttribute("Institution_list");

		if(list == null || list.size() < 1){
			out.print("没有数据！");
		}else{
			Institution_model Institution=list.get(0);
		 %>
	
	
<!-- 		顶栏 -->
		<nav class="navbar navbar-fixed-top my-navbar" role="navigation">  
	        <div class="container-fluid">  
	            <div class="navbar-header">  
	                <button type="button" class="navbar-toggle" data-toggle="collapse" 
	                 data-target="#example-navbar-collapse"> 

	                   	<span class="icon-bar"></span> 
                     	<span class="icon-bar"></span> 
                  	 	<span class="icon-bar"></span> 
	                </button>  
	                <a class="navbar-brand" href="#"><strong>新 学 说</strong></a>  
	            </div>  
	            <div class="collapse navbar-collapse" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right">  
		                <li><a href="/nsi-0.8/list.jsp"><b>学 校</b></a></li>
	                    <li><a href="null.jsp"><b>机 构</b></a></li>
	                   	<li><a href="/nsi-0.8/people/People_list.jsp"><b>人 员</b></a></li>
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
		
		
		<br><br><br><br>
 <div class="noprint container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h1>
					详细信息
				</h1>
				<p>	
							
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="/nsi-0.8/institution/Institution_list.jsp">返回查询页面</a>
				</p>
			</div>
		</div>
	</div>
</div>

<div class="container"style="background-color:#c7d0d5; height:950px;width:1300px;" >
	<div style="background-color:#fff;height:980px;width:850px;margin-left:6%;
				padding: 20px;border:1px solid #666;float:left;">
<!-- 页眉  -->
			<div style="background-color:#eee;height:30px;width:810px;padding:6px;">
				<span class="font-title03" style="text-align:left;float:left;">新学说机构库</span>
				<span class="font-title03" style="text-align:right;float:right;">ID:<%=Institution.getId()%></span>
			</div>
<!-- 				第一块div -->				
			<div style="background-color:#fff;height:150px;width:810px;">
				<div style="background-color:#75a3d1;height:150px;width:150px;float:left;border-radius:5px">
					<img src="/nsi-0.8/assets/img/school-icon.png" alt="Pulpit rock" width="150" height="150">				
				</div>	
				<div style="background-color:#fff;height:150px;width:658px;float:left;">
						<div style="background-color:#fff;height:20%;">				
							<div style="width:67%;text-align:center;float:left;">
								<span class="font-title01"><a href="javascript:void(0)" ><%=Institution.getName()%></a></span>	 						
							</div>
							<div style="width:33%;text-align:center;float:left;border-left:1px dashed #666;">
								<span class="font-title02"><%=Institution.getAreas()%></span>
							</div>						
						</div>	
						<div style="height:40%; background-color:#fff;border-top:1px dashed #666;">
							<div style="width:30%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">业务类型：<%=Institution.getServiceType()%></span></div>						
							<div style="width:70%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">业务：<%=Institution.getService()%></span></div>						
						</div>
						<div style="height:40%; background-color:#fff;border-top:1px dashed #666;">
							<div style="width:80%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">介绍：<%=Institution.getIntroduction()%></span></div>									
						</div>	
				</div>
			</div>
<!-- 			第二段div -->
			<br>
			<div style="background-color:#fff;height:150px;width:810px;border:1px solid #999;padding:10px;">
				<div style="height:30%; background-color:#fff;">
					<div style="width:100%;text-align:center;float:left;"><span class="font-title02">基本信息</span></div>
				</div>
				<div style="height:35%; background-color:#fff;border-top:1px dashed #666;">
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">CEO：<%=Institution.getCEO()%></span></div>
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">邮箱：<%=Institution.getMail()%></span></div>
				</div>
				<div style="height:35%; background-color:#fff;border-top:1px dashed #666;">
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">电话：<%=Institution.getTelephone()%></span></div>
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">通讯地址：<%=Institution.getAddress()%></span></div>		
				</div>	
			
			</div>
<!-- 			第三段 -->
			<br>
			<div style="background-color:#fff;height:540px;width:810px;border:1px solid #999;padding:15px;">
				<div style="height:10%; background-color:#fff;">
					<div style="width:100%;text-align:center;float:left;"><span class="font-title02">详细信息</span></div>
				</div>
				<div style="height:10%; background-color:#fff;border-top:1px dashed #666;">
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">法人：<%=Institution.getLegalPerson()%></span></div>
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">官网：<%=Institution.getWebsite()%></span></div>
				</div>
				<div style="height:10%; background-color:#fff;border-top:1px dashed #666;">
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">提交者：<%=Institution.getLoad_people()%></span></div>
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">提交时间：<%=Institution.getLoad_time()%></span></div>
				</div>
				<div style="height:70%; background-color:#fff;">
					<div style="width:100%;text-align:center;">
						<span class="font-title03">介绍</span>
						<textarea class="form-control" id="" name="" rows="4"><%=Institution.getIntroduction()%></textarea>
					</div>
					<div style="width:100%;text-align:center;">
						<span class="font-title03">投资信息</span>
						<textarea class="form-control" id="" name="" rows="4"><%=Institution.getInvestment()%></textarea>
					</div>
					<div style="width:100%;text-align:center;">
						<span class="font-title03">备注</span>
						<textarea class="form-control" id="" name="" rows="4"><%=Institution.getRemark()%></textarea>
					</div>		
				</div>			
			</div>	
			
			
			<div>
					<!-- 	修改按钮的表单 -->
					<form class="" role="form" action="Institution_servlet" id="alterForm" name="myform01" method="post">
							<div class="form-group">
								<div class="col-sm-offset-6 col-sm-10 ">													
									<input type="hidden" name="whereFrom" value="alterButton">																					
									<input type="hidden" name="alter_institution_id" value='<%=Institution.getId()%>'>	
								</div>
							</div>
					</form>
					<!-- 	删除按钮的表单 -->
					<form class="" role="form" action="Institution_servlet" id="deleteForm" name="myform02" method="post">
							<div class="form-group">
								<div class="col-sm-offset-6 col-sm-10 ">													
									<input type="hidden" name="whereFrom" value="deleteButton">																					
									<input type="hidden" name="alter_Institution_id" value='<%=Institution.getId()%>'>	
								</div>
							</div>
					</form>
<!-- 					上传图片按钮	 -->
					<form class="" role="form" action="/nsi-0.8/people/People_UpImage.jsp" id="UpImageForm" name="myform03" method="post">
							<div class="form-group">
								<div class="col-sm-offset-6 col-sm-10 ">													
									<input type="hidden" name="whereFrom" value="UpImage">																					
									<input type="hidden" name="UpImage_people_id" value='<%%>'>	
								</div>
							</div>
					</form>
			</div>
		</div>
		
		
	<%}%>
<!-- 		右侧工具栏 -->
		<div class="col-xs-6 col-sm-3 sidebar-offcanvas noprint" id="sidebar" style="float:left; width:200px;margin-left:5%;">
          <div class="list-group">
            <a href="#" class="list-group-item active">工具栏</a>
            <a href="javascript:void(0)" class="list-group-item text-center" onclick="SubmitAlter()">修改</a>
            <a href="javascript:void(0)" class="list-group-item text-center" onclick="ConfirmDelete()">删除</a>
            <a href="javascript:void(0)" class="list-group-item text-center" onclick="javascript:window.print()">打印</a>
<!--             <a href="javascript:void(0)" class="list-group-item text-center" onclick="UpImageSubmit()">上传机构logo图片</a> -->
            <a href="javascript:void(0)" class="list-group-item text-center">其他</a>
        	<a href="javascript:void(0)" class="list-group-item text-center">其他</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
</div>
	
	<div style="clear:both;">
		<br><br>
	</div>
	
	<!--     导入底栏jsp文件 -->
	<div class="noprint" style="clear:both;">
		<jsp:include page="/modular/bottomBar.jsp"/>
	</div>

</body>
</html>