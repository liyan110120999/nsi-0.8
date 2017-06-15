<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
 	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!--  	标题位置显示学校名 -->
 	 <% String key_School_name = request.getParameter("SearchKey"); %> 
 	
   <title><%=key_School_name%></title>
  
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
  
  			 <script src="assets/js/user.js"></script>
   
</head>
																		<!-- 			数据库源 -->
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     		url="jdbc:mysql://localhost:3306/NSI_DATABASE"
    	 	user="root"  password="123456"/>
  
			
				
  		<sql:query dataSource="${snapshot}" var="result">
				 SELECT * from NSI_SCHOOL_data WHERE School_name ='<%=key_School_name%>';	
		</sql:query>		
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
<!-- 	 字体 -->
	<style>
		.font-title01{ font-size:25px;line-height:120%;}
		.font-title02{ font-size:25px;line-height:120%;}
		.font-title03{ font-size:20px;line-height:120%;}		
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

<body > 
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
	                <a class="navbar-brand l-f24" href="#"><strong>新学说</strong></a>  
	            </div>  
	            <div class="collapse navbar-collapse l-f20" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right l-h-002">  
		                <li><a href="/nsi-0.8/list.jsp"><b>学校</b></a></li>
	                    <li><a href="/nsi-0.8/null.jsp"><b>机构</b></a></li>
	                   	<li><a href="/nsi-0.8/people/People_list.jsp"><b>人员</b></a></li>
	                    <li><a href="/nsi-0.8/about.jsp"><b>关于</b></a></li>
	                    <li><a href="/nsi-0.8/login.jsp" class="active-menu-item"><b>登录</b></a></li>
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
	
    <section>
 <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
			<div class="jumbotron">
				<h1>
					<%=key_School_name%>
				</h1>
				<p>
					
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="list.jsp">返回查询页面</a>
				</p>
			</div>	
		
		
					<c:forEach var="row" items="${result.rows}">				
						
						<c:set var="School_name" value="${row.School_name}" scope="request">
						</c:set>
						<c:set var="School_properties" value="${row.School_properties}" scope="request">
						</c:set>
						<c:set var="Areas" value="${row.Areas}" scope="request">
						</c:set>
						<c:set var="Founded_time" value="${row.Founded_time}" scope="request">
						</c:set>
						<c:set var="School_system" value="${row.School_system}" scope="request">
						</c:set>
						<c:set var="Course" value="${row.Course}" scope="request">
						</c:set>
						<c:set var="President" value="${row.President}" scope="request">
						</c:set>
						<c:set var="President_country" value="${row.President_country}" scope="request">
						</c:set>
						<c:set var="Teacher_number" value="${row.Teacher_number}" scope="request">
						</c:set>
						<c:set var="Foreign_teacher_num" value="${row.Foreign_teacher_num}" scope="request">
						</c:set>
						<c:set var="Teacher_salary" value="${row.Teacher_salary}" scope="request">
						</c:set>
						<c:set var="Num_students" value="${row.Num_students}" scope="request">
						</c:set>
						<c:set var="Graduating_stu_num" value="${row.Graduating_stu_num}" scope="request">
						</c:set>
						<c:set var="Extra_curricular_edu" value="${row.Extra_curricular_edu}" scope="request">
						</c:set>
						<c:set var="Covered_area" value="${row.Covered_area}" scope="request">
						</c:set>
						<c:set var="Built_area" value="${row.Built_area}" scope="request">
						</c:set>
						<c:set var="Tuition" value="${row.Tuition}" scope="request">
						</c:set>
						<c:set var="website" value="${row.website}" scope="request">
						</c:set>
						<c:set var="load_people" value="${row.load_people}" scope="request">
						</c:set>
						<c:set var="load_time" value="${row.load_time}" scope="request">
						</c:set>
						<c:set var="Investment" value="${row.Investment}" scope="request">
						</c:set>
						<c:set var="remark" value="${row.remark}" scope="request">
						</c:set>
						
						
					</c:forEach>
		
			<% 
			
				String School_name= (String)request.getAttribute("School_name");
				String School_properties= (String)request.getAttribute("School_properties");
				String Areas= (String)request.getAttribute("Areas");
				Integer Founded_time =Integer.parseInt(request.getAttribute("Founded_time").toString());
				String School_system= (String)request.getAttribute("School_system");
				String Course= (String)request.getAttribute("Course");
				String President= (String)request.getAttribute("President");
				String President_country= (String)request.getAttribute("President_country");
// 			String Teacher_number= (String)request.getAttribute("Teacher_number");
				Integer Teacher_number =Integer.parseInt(request.getAttribute("Teacher_number").toString());
// 			String Foreign_teacher_num= (String)request.getAttribute("Foreign_teacher_num");
				Integer Foreign_teacher_num =Integer.parseInt(request.getAttribute("Foreign_teacher_num").toString());
				String Teacher_salary= (String)request.getAttribute("Teacher_salary");
// 			String Num_students= (String)request.getAttribute("Num_students");
				Integer Num_students =Integer.parseInt(request.getAttribute("Num_students").toString());
// 			String Graduating_stu_num= (String)request.getAttribute("Graduating_stu_num");
				Integer Graduating_stu_num =Integer.parseInt(request.getAttribute("Graduating_stu_num").toString());

				Float Extra_curricular_edu =Float.parseFloat(request.getAttribute("Extra_curricular_edu").toString());
				Float Covered_area =Float.parseFloat(request.getAttribute("Covered_area").toString());
				Float Built_area =Float.parseFloat(request.getAttribute("Built_area").toString());
// 				Float Tuition =Float.parseFloat(request.getAttribute("Tuition").toString());
				String Tuition= (String)request.getAttribute("Tuition");
				String website= (String)request.getAttribute("website");
				String load_people= (String)request.getAttribute("load_people");
				String load_time= (String)request.getAttribute("load_time");
				
				String Investment= (String)request.getAttribute("Investment");
				String remark= (String)request.getAttribute("remark");
			%>
	
			
    
    <br>
    
    <div style="background-color:#e0e0e0;width:900px;margin-left:auto;margin-right:auto;border:1px solid #a1a1a1;">	
    	<br>
		<div style="background-color:#ccc;height:200px;width:800px;margin-left:auto;
 					 margin-right:auto;box-shadow:3px 3px 10px #333333;">
			 
			<div style="background-color:#4fada1;height:20%;text-align:center;">
				<span class="font-title01">
					基本信息			
				</span>			
			</div>
				
			<div style="background-color:#75a3d1;height:80%;width:20%;float:left;">
				<img src="assets/img/school-icon.png" alt="Pulpit rock" width="160" height="160">				
			</div>	

			<div style="height:80%;width:80%;float:left;border-radius:5px;">
				<div style="background-color:#b2dfdb;height:20%;width:100%;text-align:center;">
					<span class="font-title01">				
						<b><%=School_name%></b>
					</span>			
				</div>	
				<div class="font-title03" style="background-color:#eee;height:30%;width:100%;">
					<div style="float:left;height:40%;width:20%;">
						成立时间					
					</div>
					<div style="float:left;height:40%;width:20%;">
						地点				
					</div>
					<div style="float:left;height:40%;width:20%;">
						类型						
					</div>
					<div style="float:left;height:40%;width:20%;">
						学制					
					</div>
					<div style="float:left;height:40%;width:20%;">
						网站									
					</div>
				</div>	
				
				<div class="font-title03" style="background-color:#eee;height:50%;width:100%;">
					<div  style="float:left;height:40%;width:20%;">
						<%=Founded_time%>
					</div>
					<div  style="float:left;height:40%;width:20%;">
						<%=Areas%>
					</div>
					<div  style="float:left;height:40%;width:20%;">
						<%=School_properties%>			
					</div>
					<div  style="float:left;height:40%;width:20%;">
						<%=School_system%>					
					</div>
					<div  style="float:left;height:40%;width:20%;">
						<%
							if(website==null|| website.length() <= 0){	
						%>
						暂无	
						<%}else{ %>
							<a href="http://<%=website%>" target="_blank">官网</a>	
						<%}%>
										
					</div>
				</div>
				
			</div>	
		</div>
		<br><br>

			
		<div style="background-color:#eee;height:240px;width:800px;margin-left:auto;
 					 margin-right:auto;box-shadow:3px 3px 10px #333333;">
				<div style="background-color:#4fada1;height:20%;text-align:center;">
					<span class="font-title01">
						课程与认证			
					</span>			
				</div>
				<div class="font-title03" style="background-color:#b2dfdb;height:80%;width:250px;float:left;text-align:center;">
					<div  style="height:25%;width:100%;">
						课程体系
					</div>
					<div style="height:25%;width:100%;">
						开课门数
					</div>
					<div style="height:25%;width:100%;">
						俱乐部数量
					</div>
					<div style="height:25%;width:100%;">
						认证与组织
					</div>
				</div>
				<div class="font-title03" style="background-color:#eee;height:80%;width:550px;float:left;">
					<div  style="height:25%;width:100%;">
						<%=Course%>
					</div>
					<div style="height:25%;width:100%;">
						10
					</div>
					<div style="height:25%;width:100%;">
						<%=Extra_curricular_edu%>
					</div>
					<div style="height:25%;width:100%;">
						CIE,IBO
					</div>
				</div>		
		</div>
		<br><br><br>
		
	
		<div style="background-color:#F5EACD;height:200px;width:800px;margin-left:auto;
 					 margin-right:auto;box-shadow:3px 3px 10px #333333;">
				<div style="background-color:#4fada1;height:20%;text-align:center;">
					<span class="font-title01">
						学生与师资			
					</span>			
				</div>
				<div class="font-title03" style="background-color:#b2dfdb;height:80%;width:200px;float:left;text-align:center;">
					<div  style="height:33%;width:100%;">
						在校生
					</div>
					<div style="height:33%;width:100%;">
						毕业班人数
					</div>
					<div style="height:33%;width:100%;">
						毕业成绩
					</div>
				
				</div>
				<div class="font-title03" style="background-color:#eee;height:80%;width:200px;float:left;">
					<div  style="height:33%;width:100%;">
						<%=Num_students%>
					</div>
					<div style="height:33%;width:100%;">
						<%=Graduating_stu_num%>
					</div>
					<div style="height:33%;width:100%;">
						描述性内容
					</div>
			
				</div>
				<div class="font-title03" style="background-color:#b2dfdb;height:80%;width:200px;float:left;text-align:center;">
					<div  style="height:33%;width:100%;">
						师生比
					</div>
					<div style="height:33%;width:100%;">
						中外教比例
					</div>
					<div style="height:33%;width:100%;">
						外教数量
					</div>
		
				</div>
				<div class="font-title03" style="background-color:#eee;height:80%;width:200px;float:left;">
					<div  style="height:33%;width:100%;">
						1:10
					</div>
					<div style="height:33%;width:100%;">
						1:2
					</div>
					<div style="height:33%;width:100%;">
						<%=Foreign_teacher_num%>
					</div>		
				</div>			
		</div>
		<br><br><br>
		
		<div style="background-color:#F5EACD;height:200px;width:800px;margin-left:auto;
 					 margin-right:auto;box-shadow:3px 3px 10px #333333;">
				<div style="background-color:#4fada1;height:20%;text-align:center;">
					<span class="font-title01">
						基建信息			
					</span>			
				</div>
				<div class="font-title03" style="background-color:#b2dfdb;height:80%;width:250px;float:left;text-align:center;">
					<div  style="height:25%;width:100%;">
						占地面积
					</div>
					<div style="height:25%;width:100%;">
						建筑面积
					</div>
					<div style="height:25%;width:100%;">
						场馆
					</div>
		
				</div>
				<div class="font-title03" style="background-color:#eee;height:80%;width:550px;float:left;">
					<div  style="height:25%;width:100%;">
						<%=Covered_area%>
					</div>
					<div style="height:25%;width:100%;">
						<%=Built_area%>
					</div>
					<div style="height:25%;width:100%;">
						体育馆、阳光泳池
					</div>

				</div>		
		</div>
		<br><br><br>

		<div style="background-color:#ccc;height:200px;width:800px;margin-left:auto;
 					 margin-right:auto;box-shadow:3px 3px 10px #333333;">
			<div style="background-color:#eee;height:200px;width:800px;float:left;">
				<div style="background-color:#4fada1;height:20%;text-align:center;">
					<span class="font-title01">
						投资者信息		
					</span>			
				</div>	
				<div class="font-title03" style="background-color:#eee">
					<%=Investment%>
				</div>	
			</div>	

		</div>
		<br>

		<div style="background-color:#ccc;height:200px;width:800px;margin-left:auto;
 					 margin-right:auto;box-shadow:3px 3px 10px #333333;">
			<div style="background-color:#eee;height:200px;width:800px;float:left;">
				<div style="background-color:#4fada1;height:20%;text-align:center;">
					<span class="font-title01">
						备注			
					</span>			
				</div>	
				<div class="font-title03" style="background-color:#eee">
					<%=remark%>
				</div>	
			</div>	

		</div>
		<br>
		
	</div>
    
    
     <br> <br> <br>
    
    	</div>
	</div>
</div>
</section>
	<!--     导入底栏jsp文件 -->
	<div><jsp:include page="modular/bottomBar.jsp"/>
	</div>
    <!-- COPY TEXT SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
    
</body>
</html>
																										

	
