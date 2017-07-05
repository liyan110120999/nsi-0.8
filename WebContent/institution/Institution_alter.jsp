<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Institution.Institution_model"%>
<%@ page import="java.util.Date.*" import="java.text.SimpleDateFormat" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8"> 
 	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>新学说-机构修改</title>

<link href="assets/css/bootstrap.css" rel="stylesheet" />
		<link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
	     <!-- FONTAWESOME STYLE CSS -->
	    <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
	    <!-- CUSTOM STYLE CSS -->
	    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
		<script src="/nsi-0.8/assets/js/jquery-1.11.1.js"></script>
	    <!-- BOOTSTRAP SCRIPTS  -->
	    <script src="/nsi-0.8/assets/js/bootstrap.js"></script>
	    <!-- CUSTOM SCRIPTS  -->
	    <script src="/nsi-0.8/assets/js/custom.js"></script>
	    
	   <script src="/nsi-0.8/assets/js/user.js"></script>	
			   
</head>
	<style>
		body{background-color:#c7d0d5}
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
	</script>

<body> 

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
	                    <li><a href="/nsi-0.8/institution/Institution_list.jsp"><b>机 构</b></a></li>
	                   	<li><a href="/nsi-0.8/people/People_list.jsp"><b>人 员</b></a></li>
	                    <li><a href="/nsi-0.8/about.jsp"><b>关 于</b></a></li>
	                    <li><a href="/nsi-0.8/login.jsp" class="active-menu-item"><b>登 录</b></a></li>
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
    <!--HOME SECTION END-->
<section>
  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
			<div class="jumbotron">
				<h1>
					修改数据
				</h1>
				<p>
					请按照标准格式录入数据
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="/nsi-0.8/institution/Institution_list.jsp">返回查询页面</a>
				</p>
			</div>	
				
		<%
		    //   获取session用户		     		
		String username ="空";
		if(session.getAttribute("Session_user")==null){
			//	 登录超时,跳转到login
			response.sendRedirect("/nsi-0.8/login.jsp");
		}else{
			username = session.getAttribute("Session_user").toString();
		}	
			//   获取当前时间
		java.util.Date currentTime = new java.util.Date(); 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String SubmitDate = formatter.format(currentTime);					
	
		List<Institution_model> list = (List<Institution_model>)request.getAttribute("list");
		if(list == null || list.size() < 1){
			out.print("没有数据！");
		}else{
			Institution_model Institution=list.get(0);

	%>	
		
			<form class="form-horizontal" role="form" action="/nsi-0.8/Institution_servlet" name="myform" method="post">
							
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">机构名</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="userid" value="<%=Institution.getName()%>" onblur="checkUserid()" name="Institution_name" />
					</div>
					<div> <span id="useridSpan" style=" color:#999"><h5>请输入机构名称</h5></span>  </div>								
				</div>
				<div>
					<div class="form-group">
						 <label for="inputEmail3" class="col-sm-2 control-label">地区</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="People_member_id" value="<%=Institution.getAreas()%>" name="Institution_Areas"/>
						</div>
					</div>	
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">CEO</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=Institution.getCEO()%>" name="Institution_CEO"/>
					</div>					
				</div>	
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">法人</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=Institution.getLegalPerson()%>" name="Institution_LegalPerson"/>
					</div>					
				</div>	
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">机构类型</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=Institution.getType()%>" name="Institution_Type"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">业务类型</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=Institution.getServiceType()%>" name="Institution_ServiceType"/>
					</div>
				</div>				
				<div>	
	                <div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">公司业务</label>
					<div class="col-sm-5">
 						<input type="text" class="form-control" id="People_position_id" value="<%=Institution.getService()%>" name="Institution_Service"/>
					</div>				
					</div>			
				</div>	
     			<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">电话</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=Institution.getTelephone()%>" name="Institution_Telephone"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">通讯地址</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=Institution.getAddress()%>" name="Institution_Address"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=Institution.getMail()%>" name="Institution_Mail"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">官网</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=Institution.getWebsite()%>" name="Institution_Website"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">介绍</label>
					<div class="col-sm-5">
						
						<textarea class="form-control" id="id_remark" name="Institution_Introduction" rows="3"><%=Institution.getIntroduction()%></textarea>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">投资信息</label>
					<div class="col-sm-5">
						<textarea class="form-control" id="id_remark" name="Institution_Investment" rows="3"><%=Institution.getInvestment()%></textarea>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-5">					
						<textarea class="form-control" id="id_remark" name="Institution_Remark" rows="3"><%=Institution.getRemark()%></textarea>
					</div>
				</div>	
				           					
	               	<div class="form-group">
						<div class="col-sm-offset-6 col-sm-10">															
							<input type="hidden" name="whereFrom" value="alter">
							<input type="hidden" name="alter_Institution_id" value="<%=Institution.getId()%>">	
							<input type="hidden" name="username" value="<%=username%>">		
							<input type="hidden" name="SubmitDate" value="<%=SubmitDate%>">									
							<button  type="submit" class="btn btn-primary">提交</button>
						</div>																											
					</div>
			</form>		
			<br>
			<!-- 	删除按钮 -->
			<form class="form-horizontal" role="form" action="Institution_servlet" id="deleteForm" name="myform02" method="post">
					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-10 ">	
							<!-- 隐式表单标记位 -->
							<input type="hidden" name="whereFrom" value="delete">
							<input type="hidden" name="delete_people_id" value='<%=Institution.getId()%>'>
							<input type="button" class="btn btn-danger" onclick="ConfirmDelete()" value="删除本条记录" />		

						</div>
					</div>
			</form>		
		<%}%>
			
		</div>
	</div>
</div>
    </section>
    
	<!--     导入底栏jsp文件 -->
	<div>
		<jsp:include page="/modular/bottomBar.jsp"/>
	</div>

</body>
</html>
																										

	
