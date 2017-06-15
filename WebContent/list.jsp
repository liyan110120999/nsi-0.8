<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date.*" import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE>
<html>
<head>
    <title>新学说-数据查询系统</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<meta name="description" content="" />
	<meta name="author" content="liyan" />

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
<!-- 	模块-复选框 -->
	<link rel="stylesheet" href="assets/Modular/checkbox/jquery-labelauty.css">
	<script src="assets/Modular/checkbox/jquery-labelauty.js"></script>
	
	<title>新学说学校数据库</title>

	   <script type="text/javascript">
	      															 //表单提交
	   	function tijiao()
		   {
		     var key = document.mfsearch.tsearch.value;  
		     //无字符检查
		    	 document.mfsearch.submit(); 
		   }
	    function txtclear()
			  {
			    document.mfsearch.txtsearch.value="";
			  }
	  	function check()
		  	{
		    var key = document.mfsearch.txtsearch.value;
		    if(key.trim()=="")
		    {
		      alert("关键字不能为空!!!");
		      return;
	    	}  
	 	 	}
	  		
// 		显示高级搜索框
	  	function showAdvancedSearch(){
	  		var AdvancedSearch=document.getElementById("AdvancedSearchID");  		
		  		 if (AdvancedSearch.style.display=="block"){
		  			AdvancedSearch.style.display="none";                
	             } else {
	            	 AdvancedSearch.style.display="block";
	             } 	  		
	  		}
	// 	 提交 高级搜索
		function submitAdvancedSearch(){
			obj02 = document.getElementsByName("checkbox02");
			var check_val02= [];
			for( var i=0;i<4;i++){
				if(obj02[i].checked){
// 		            check_val02.push(obj02[k].value);
					check_val02.push("1");
		    	}else{
		    		check_val02.push("0");
		    	}	
			}
			return check_val02;
		}

		$(function() {
			$("#AdvanceSubmitID").click(function() {
				
				    $.ajax({
				        type: "POST",
				        url: '/nsi-0.8/servlet?whereFrom=AdvancedSearch',
// 				        contentType: "application/json; charset=utf-8",
						contentType: "application/x-www-form-urlencoded",
 				        data: GetJsonData(),
//  				    data: JSON.stringify(GetJsonData()),
// 						data: {"a":1,"b":2},
				        dataType: "json",
				        success: function (message) {
				            if (message > 0) {
				                alert("请求已提交！我们会尽快与您取得联系");
				            }
				        },
				        error: function (message) {
				            $("#request-process-patent").html("提交数据失败！");
				        }
				    });
				});
			});
		
			function GetJsonData() {
				var a=submitAdvancedSearch();
			    var json = {
			        "a01": a[0]+a[1]+a[2]+a[3],
			        "a02": "aaa",
			        "a03": "bbb",		 
			        "a": "ddd"
			    };
			    return json;
			}
			
	   </script>
	   
<!-- 	   模块-复选框 -->
	   	<script>
			$(function(){
				$(':input').labelauty();
			});
		</script>
		
		
</head>
																<!-- css -->
	<style>
		body{
			background-color:#c7d0d5;
			text-align:center
			}
															/* th 表头  对齐*/	
		th { text-align:center;	background-color:#73afb6					
			}	
		td {height:40px}    /* 	表高度 */
			} 
	</style>	
	<!--   顶栏透明 -->
	 <style type="text/css">  
	        html, body {width:100%;height:100%;} /*非常重要的样式让背景图片100%适应整个屏幕*/  
	        .bg {display: table;width: 100%;height: 100%;padding: 100px 0;text-align: center;color: #fff;background: url(http://www.xiandanke.cn/Image/intro-bg.jpg) no-repeat bottom center;background-color: #000;background-size: cover;}  
	        .my-navbar {padding:20px 0;transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}  
	        .my-navbar a{background:transparent !important;color:#fff !important}  
	        .my-navbar a:hover {color:#45bcf9 !important;background:transparent;outline:0}  
	        .my-navbar a {transition: color 0.5s ease-in-out;}/*-webkit-transition ;-moz-transition*/  
/* 	        .top-nav {padding:0;background:#455a64;}   */
	        .top-nav {padding:0;background: rgba(69,90,100, 0.8);} 
	        button.navbar-toggle {background-color:#fbfbfb;}/*整个背景都是transparent透明的，会看不到，所以再次覆盖一下*/  
	        button.navbar-toggle > span.icon-bar {background-color:#dedede}  	        
	 </style>  
<!-- 	 用户权限管理 -->
	 <style>
	 	.null{
	 	}
	 	.Member01{
 	 		display:none; 	 		
	 	}
	 	.Member02{
	 	}
	 	.Member03{
	 	}
	 	.Member04{
	 	}
	 </style>
<!-- 	高级搜索 -->
	<style>
		#AdvancedSearchID{
			display: none;
			background-color: #ffa;
			height:200px;
			padding:15px;
			margin-bottom:20px;
		}
			#AdvanDivID01{
				background-color: #fba;
				height:50px;
				width: 1000px;
				float:left;
				padding:10px;
			}
			#AdvanDivID02{
				background-color: #fca;
				height:50px;
				 width: 1000px;
				float:left;
				padding:10px;
			}
			#AdvanDivID03{
				background-color: #fca;
				height:50px;
				 width: 1000px;
				float:left;
				padding:10px;
			}
		/* 		左侧头 */
				.AdvanSpan01{
					float:left;
					margin: auto;
					background-color: #ccc;
					margin-right:10px;
					border-right: 1px solid #DDD;
				}
		/* 		内容 */
				.AdvanSpan02{
					float:left;
					margin-left:20px;
				}
/* 				li标签 */
				.AdvanLi01{
				 	display: inline-block;
			 		float:left;margin-left:5px;
				}
	</style>
<body>					                                    
	<%	
	
	
    	request.setCharacterEncoding("UTF-8");   	
    	//搜索    String 函数
    	String flag01=request.getParameter("School_properties");  											
   		String School_name=null;
   										//判断是否来自insert 或  alert
    	if(flag01== null || flag01.length() <= 0){
//     		来自搜索或空跳转，获取session中的数据
	    	 if(session.getAttribute("School_name")==null)	{
	    		 School_name=null;   		
    		}else{
    			School_name = session.getAttribute("School_name").toString();
    		}
    	}else{
//     		来自 插入或修改，获取表单数据
    		School_name=request.getParameter("School_name");
    	}  											

		String School_properties=request.getParameter("School_properties");
// 		修改用途 和 省市两级联动
		String Areas=request.getParameter("Areas");
		String Areas01=request.getParameter("Areas01");
		String Areas02=request.getParameter("Areas02");
		
		String Founded_time=request.getParameter("Founded_time");
		String School_system=request.getParameter("School_system");
		String Course=request.getParameter("Course");
		String President=request.getParameter("President");
		String President_country=request.getParameter("President_country");
		String Teacher_number=request.getParameter("Teacher_number");
		String Foreign_teacher_num=request.getParameter("Foreign_teacher_num");
		String Teacher_salary=request.getParameter("Teacher_salary");
		String Num_students=request.getParameter("Num_students");
		String Graduating_stu_num=request.getParameter("Graduating_stu_num");
		String Extra_curricular_edu=request.getParameter("Extra_curricular_edu");
		String Covered_area=request.getParameter("Covered_area");
		String Built_area=request.getParameter("Built_area");
		String Tuition=request.getParameter("Tuition");
		String website=request.getParameter("website");	
		String load_people=request.getParameter("load_people");
		String load_time=request.getParameter("load_time");
		String Investment=request.getParameter("Investment");
		String remark=request.getParameter("remark");
																	// 				标记位
		String whereFrom=request.getParameter("whereFrom");
		String alter_old_Schoolname=request.getParameter("alter_old_Schoolname");
																					// 获取时间
    	java.util.Date currentTime = new java.util.Date(); 
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	String SubmitDate = formatter.format(currentTime);																		
    																			//     	获取session用户
    	String username=null;
	 	if(session.getAttribute("Session_user")==null)
	 	{
		 response.sendRedirect("/nsi-0.8/login.jsp");			
		}else{
			username = session.getAttribute("Session_user").toString();
		}
	 	
//     	用户密码修改
	 	String UserPassWD01=request.getParameter("UserPassWD01");
// 	 	String UserPassWD02=request.getParameter("UserPassWD02");
//     				count:本业计数 、countAll:所有结果计数
    	int count=0;				 //搜索结果计数标记位
    								//页面来源标记位
    	String insert="insert";
    	String alter="alter";
    	String delete="delete";
    	String search="search";
    	String UserChangePassWord="UserChangePassWord";
    								//测试内容标记位
    	String flag ="空";

    	String num_order=request.getParameter("num_order");

// 		当前页、跳转页
		int countAll=0;//总结果数
		int OnePageNum=20;//每页显示个数
		int pageCount = (countAll%OnePageNum==0)?(countAll/OnePageNum):(countAll/OnePageNum+1); //显示分页页数
		
 		Integer pageNum = request.getParameter("PassPage") != null && !request.getParameter("PassPage").equals("") ? Integer.parseInt(request.getParameter("PassPage")) : null;
		String num0="0";
			if(pageNum==null||pageNum<1){
				pageNum=1;	
			}else{
				System.out.println(pageNum);
			}		
    %>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/NSI_DATABASE"
     user="root"  password="123456"/>
<!--      用户信息模块 -->
		<sql:query dataSource="${snapshot}" var="resultUser">			
			SELECT * from NSI_user WHERE username ='<%=username%>';
		</sql:query>

<!--          搜索模块 -->
<%  if(School_properties== null || School_properties.length() <= 0){ %>
								<%flag ="search节点";%>	
			<%
			if(School_name==null|| School_name.length() <= 0){	
			%>
	<!-- 			空搜索时 排序方式为 “录入时间排序” -->
				<sql:query dataSource="${snapshot}" var="result">			
					SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,'')) like'%<%=School_name%>%' order by load_time DESC limit <%=(pageNum-1)*OnePageNum%>,<%=OnePageNum%>;
				</sql:query>
			<%
			}else{
				%>
<!-- 			非空搜索时 排序方式为 “校名排序” -->
				<sql:query dataSource="${snapshot}" var="result">			
					SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like'%<%=School_name%>%' order by CONVERT(School_name USING gb2312) limit <%=(pageNum-1)*OnePageNum%>,<%=OnePageNum%>;
				</sql:query>
				<%	
			} 
			%>
			
			<!-- 		搜索计数 -->
			<sql:query dataSource="${snapshot}" var="resultCount">
				SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,'')) like'%<%=School_name%>%' order by CONVERT(School_name USING gb2312);
			</sql:query>
		
		<% }else if(whereFrom.equals(insert)){ %> 		
																								<!--    新增 并 搜索		 -->
				<sql:update dataSource="${snapshot}" var="result">
					INSERT INTO NSI_SCHOOL_data (School_name,School_properties,Areas,Founded_time,School_system,Course,President,President_country,Teacher_number,Foreign_teacher_num,Teacher_salary,Num_students,Graduating_stu_num,Extra_curricular_edu,Covered_area,Built_area,Tuition,website,load_people,load_time,Investment,remark) 
					VALUES ('<%=School_name%>','<%=School_properties%>','<%=Areas01+Areas02%>','<%=Founded_time%>','<%=School_system%>','<%=Course%>','<%=President%>','<%=President_country%>','<%=Teacher_number%>','<%=Foreign_teacher_num%>','<%=Teacher_salary%>','<%=Num_students%>','<%=Graduating_stu_num%>','<%=Extra_curricular_edu%>','<%=Covered_area%>','<%=Built_area%>','<%=Tuition%>','<%=website%>','<%=username%>','<%=SubmitDate%>','<%=Investment%>','<%=remark%>');
				</sql:update>
								
				<sql:query dataSource="${snapshot}" var="result">
					 SELECT * from NSI_SCHOOL_data WHERE School_name like'%<%=School_name%>%';	
				</sql:query>		
					<!-- 							搜索计数 -->
				<sql:query dataSource="${snapshot}" var="resultCount">
					SELECT * from NSI_SCHOOL_data WHERE School_name like'%<%=School_name%>%' order by CONVERT(School_name USING gb2312);
				</sql:query>
		<% }else if(whereFrom.equals(alter)){ %> 
							<%flag ="alter节点";%>								<!-- 			标记 -->
			
				<sql:update dataSource="${snapshot}" var="result">		
					UPDATE NSI_SCHOOL_data SET 
						School_name='<%=School_name%>',School_properties='<%=School_properties%>',Areas='<%=Areas%>',Founded_time='<%=Founded_time%>',School_system='<%=School_system%>',
						Course='<%=Course%>',President='<%=President%>',President_country='<%=President_country%>',Teacher_number='<%=Teacher_number%>',Foreign_teacher_num='<%=Foreign_teacher_num%>',
						Teacher_salary='<%=Teacher_salary%>',Num_students='<%=Num_students%>',Graduating_stu_num='<%=Graduating_stu_num%>',Extra_curricular_edu='<%=Extra_curricular_edu%>',Covered_area='<%=Covered_area%>',Built_area='<%=Built_area%>',Tuition='<%=Tuition%>',website='<%=website%>',load_people='<%=username%>',load_time='<%=SubmitDate%>',Investment='<%=Investment%>',remark='<%=remark%>'
						WHERE School_name ='<%=alter_old_Schoolname%>';
				</sql:update>							
				<sql:query dataSource="${snapshot}" var="result">
					 SELECT * from NSI_SCHOOL_data WHERE School_name like'%<%=School_name%>%';	
				</sql:query>
					<!-- 							搜索计数 -->
				<sql:query dataSource="${snapshot}" var="resultCount">
					SELECT * from NSI_SCHOOL_data WHERE School_name like'%<%=School_name%>%' order by CONVERT(School_name USING gb2312);
				</sql:query>
				
		<% }else if(whereFrom.equals(delete)){ %> 
							<%flag ="delete节点";%>								<!-- 			标记 -->
			
				<sql:update dataSource="${snapshot}" var="result">						
						  DELETE FROM NSI_SCHOOL_data WHERE School_name ='<%=alter_old_Schoolname%>';		
				</sql:update>
				<sql:query dataSource="${snapshot}" var="result">
					 SELECT * from NSI_SCHOOL_data limit <%=pageNum%>,20;	
				</sql:query>
				
		<% }else if(whereFrom.equals(UserChangePassWord)){ %> 
							<%flag ="用户修改密码节点";%>								<!-- 			标记 -->
			
				<sql:update dataSource="${snapshot}" var="resultChange">	
						UPDATE NSI_user SET Password ='<%=UserPassWD01%>' WHERE UserName='<%=username%>';							
				</sql:update>
		 <% }%>

 		<nav class="navbar navbar-fixed-top my-navbar" role="navigation">  
	        <div class="container-fluid">  
	            <div class="navbar-header l-h-001">  
	                <button type="button" class="navbar-toggle" data-toggle="collapse" 
	                 data-target="#example-navbar-collapse"> 
<!-- 	                				 data-target="#bs-example-navbar-collapse-1"> -->
	                   	<span class="icon-bar"></span> 
                     	<span class="icon-bar"></span> 
                  	 	<span class="icon-bar"></span> 
	                </button>  
<!-- 	                <a class="navbar-brand l-f24" href="#"><strong>新 学 说</strong></a> -->
	                <div>
	               	 	<img src="assets/img/logo.png" class="img-rounded" width="250" height="60">
	                </div>
	            </div>  
	            <div class="collapse navbar-collapse l-f20" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right l-h-002">  
		                <li style="margin-top:5px;"><a href="list.jsp" class="active-menu-item"><b>学 校</b></a></li>
	                    <li style="margin-top:5px;"><a href="null.jsp"><b>机 构</b></a></li>
	                   	<li style="margin-top:5px;"><a href="people/People_list.jsp"><b>人 员</b></a></li>
	                    <li style="margin-top:5px;"><a href="about.jsp"><b>关 于</b></a></li>
	                    <li style="margin-top:5px;"><a href="login.jsp" ><b>登 录</b></a></li>	          
	                </ul>  
	            </div>  
	        </div>  
	    </nav>  
	   		<script>  
		        $(window).scroll(function () 
		        	{  
				        if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");  
				          }else {$(".navbar-fixed-top").removeClass("top-nav");}  
		        	}
		        )
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
						<img alt="" src="assets/img/header02.jpeg"/>
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
				</div> <a class="left carousel-control" href="#carousel-466145" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-466145" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>


    <!--HOME SECTION END-->
   <section style="padding-top:50px;">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
						 <span class="sr-only">Toggle navigation</span>
						 <span class="icon-bar"></span>
						 <span class="icon-bar"></span>
						 <span class="icon-bar"></span>
					 </button> <a class="navbar-brand" href="#">新学说</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown">
							 <a href="insert.jsp">新增</a>				 
						</li>
						<li>
							 <a href="show/map_show.html">地图分布</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">可视化<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="show/histogram.jsp">条形图</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
							</ul>
						</li>
					</ul>
						<form class="navbar-form navbar-left" role="search" action="servlet" name="myform" method="post">
							<div class="form-group">
<!-- 								防止搜索框出现null -->
								<%if(School_name!=null){%>
									<input type="text" value="<%=School_name%>" style="width:300px" class="form-control" name="School_name" />
								<%}else{%>
									<input type="text" class="form-control" style="width:300px" name="School_name" />
									<%}%>							
								<input type="hidden" name="whereFrom" value="search">
							</div> 
							<button type="submit" name="submit" class="btn btn-primary glyphicon glyphicon-search" style="top:0;"></button>
						</form>
						
<!-- 						高级搜索 -->
						<form class="navbar-form navbar-left" style="padding:0;" role="search" action="servlet" name="myform" method="post">
							<div class="form-group">
<!-- 								<input type="text" class="form-control" style="width:300px" name="School_name" />												 -->
								<input type="hidden" name="whereFrom" value="search">
							</div> 
<!-- 							<button type="button" name="submit" class="btn btn-primary" onclick="showAdvancedSearch()">高级搜索</button> -->
<!-- 							<button type="button" name="submit" class="btn btn-primary">高级搜索</button> -->
						</form>
						
						
					<ul class="nav navbar-nav navbar-right">
						<li>
<%-- 							<span class="glyphicon glyphicon-user">  <a href="#" class="glyphicon glyphicon-user" data-toggle="modal" data-target="#myModal"><%=username%></a></span> --%>
							 <a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> <%=username%></a>
						</li>
						
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">菜单<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#" data-toggle="modal" data-target="#myModal">用户信息</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#" data-toggle="modal" data-target="#myModal02">修改密码</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">null</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">null</a>
								</li>
							</ul>
						</li>
						
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<br>
</div>
<!-- 高级搜索功能 -->
<div class="container">
	
</div>

	<!-- 用户信息 模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						用户信息
					</h4>
				</div>
				<div class="modal-body">
					
					<br>
					<c:forEach var="rowUser" items="${resultUser.rows}">
<%-- 						<h4>用户名: <c:out value="${rowUser.UserName}"/></h4> --%>
<%-- 						<h4>用户等级: <c:out value="${rowUser.Member_sign}"/></h4> --%>
<%-- 						<h4>用户真实姓名: <c:out value="${rowUser.User_TureName}"/></h4> --%>
						
						<table class="table table-bordered" width="200px">
						
								<tbody>
									<tr>
										<td>用户名:</td>
										<td><c:out value="${rowUser.UserName}"/></td>							
									</tr>
									<tr>
										<td>用户等级: </td>
										<td><c:out value="${rowUser.Member_sign}"/></td>								
									</tr>
									<tr>
										<td>用户真实姓名:</td>
										<td><c:out value="${rowUser.User_TureName}"/></td>	
									</tr>
									<tr>
										<td>机构所属</td>
										<td><c:out value="${rowUser.User_Organization}"/></td>	
									</tr>
									<tr>
										<td>积分</td>
										<td><c:out value="${rowUser.User_score}"/></td>	
									</tr>
								</tbody>
						</table>
								
					</c:forEach>
<!-- 					关闭模态框01，打开修改模态框 -->
					<button type="button" class="btn btn-primary"data-dismiss="modal" data-toggle="modal" data-target="#myModal02">修改密码</button>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
	<!-- 				<button type="button" class="btn btn-primary"> -->
	<!-- 					提交更改 -->
	<!-- 				</button> -->
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
<!-- 	修改密码  模态框-->
	<div class="modal fade" id="myModal02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改密码
					</h4>
				</div>
				<div class="modal-body">
					
					<script type="text/javascript">
						    //检测密码是否一致	 
						function checkPassWDsame(){  
						    var ueridObj01=document.getElementById("userPWid01").value;  
						    var ueridObj02=document.getElementById("userPWid02").value;
						    
						    if(ueridObj01!=ueridObj02) {
						        msg ="<font color='red'><h5>两次输入不一致</h5></font>";  
						    	var span = document.getElementById("userPwSpan");  
						    	span.innerHTML = msg;  
						    }else{
						    	var span = document.getElementById("userPwSpan");
					    		span.innerHTML ="<font color='green'><h5>验证通过</h5></font>";  	
					    		// 	        使按钮可用
						        var buttonAbled = document.getElementById('passWDsubmit');
								//	移除class
						        buttonAbled.removeAttribute("disabled")
					    	}
						    }  
					
					</script>
					
					<c:forEach var="rowUser" items="${resultUser.rows}">
						<h4>修改 <c:out value="${rowUser.UserName}"/> 的密码</h4>				
					</c:forEach>
					<div style="padding-left:40px;">
						<form class="form-horizontal" role="form" action="list.jsp" name="myform" method="post">
							<div class="form-group">
								 <label for="inputEmail3" class="col-sm-3 control-label">新密码</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="userPWid01"  name="UserPassWD01" />
								</div>
							</div>
							<div class="form-group">
								 <label for="inputEmail3" class="col-sm-3 control-label">确认新密码</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="userPWid02" onblur="checkPassWDsame()" name="UserPassWD02" />
								</div>
							</div>
							<span id="userPwSpan" style=" color:#999"><h5></h5></span>
							<input type="hidden" name="whereFrom" value="UserChangePassWord">
									<!-- 		性质假数据 跳过list中的“搜索if” -->
							<input type="hidden" name="School_properties" value="From_alter_School_properties">
							<button type="submit" Id="passWDsubmit" class="btn btn-primary" disabled="disabled">确定修改</button>
						</form>
					</div>
					
					
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
	<!-- 				<button type="button" class="btn btn-primary"> -->
	<!-- 					提交更改 -->
	<!-- 				</button> -->
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
<!-- 高级搜索选择框 -->
	<div id="AdvancedSearchID" class="container">
	
		<form action="servlet" method="post">
			<div id="AdvanDivID01">
				<span class="AdvanSpan01">地区:</span>
				<span class="AdvanSpan02">北京</span>
				<span class="AdvanSpan02">上海</span>
				<span class="AdvanSpan02">深圳</span>
				<span class="AdvanSpan02">广州</span>
			</div>
			<div id="AdvanDivID02">
				<span class="AdvanSpan01">学制:</span>
				<ul class="dowebok">	
					<li class="AdvanLi01"><input type="checkbox" name="checkbox02" data-labelauty="高中"></li>
					<li class="AdvanLi01"><input type="checkbox" name="checkbox02" data-labelauty="初中"></li>
					<li class="AdvanLi01"><input type="checkbox" name="checkbox02" data-labelauty="小学"></li>
					<li class="AdvanLi01"><input type="checkbox" name="checkbox02" data-labelauty="幼儿园"></li>
				</ul>
			</div>
			<div id="AdvanDivID03">	
					<span class="AdvanSpan01">课程:</span>
				<ul class="dowebok">	
					<li class="AdvanLi01"><input type="checkbox" name="checkbox03" value="1" data-labelauty="AP"></li>
					<li class="AdvanLi01"><input type="checkbox" name="checkbox03" value="2" data-labelauty="PYP"></li>
					<li class="AdvanLi01"><input type="checkbox" name="checkbox03" value="3" data-labelauty="IMYC"></li>
					<li class="AdvanLi01"><input type="checkbox" name="checkbox03" value="4" data-labelauty="A-LEVEL"></li>
				</ul>
			</div>
			<div  id="AdvanDivID04">
			</div>
			<input type="hidden" id="tempString" name="whereFrom" value="AdvancedSearch"/>
			<button type="submit" class="btn btn-primary" id="AdvanceSubmitID">提交</button>
		</form>
	</div>

	<!-- 	显示表格区			 -->
<div class="container-fluid" id="tableID">
	<div class="row clearfix">
		<div class="col-md-12 column table-responsive">
		
			<table class="table table-hover">		
				<thead id="tableHeaderID">

					<tr>
						<th>
							序号
						</th>
						<th>
							学校名
						</th>
						<th>
							学校性质
						</th>
						<th>
							地区
						</th>						
						<th>
							建校时间
						</th>
						<th>
							学制
						</th>
						<th>
							课程
						</th>
						<th>
							校长
						</th>
						<th>
							校长国籍
						</th>
						<th>
							教师数量
						</th>
						<th>
							外籍教师数量
						</th>
						<th>
							教师薪酬
						</th>
						<th>
							在校生数量
						</th>
						<th>
							毕业班人数
						</th>
						<th>
							俱乐部数量
						</th>
						<th>
							占地面积（亩）
						</th>
						<th>
							建筑面积（平方米）
						</th>
						<th>
							学费
						</th>
						<th>
							提交用户
						</th>
						<th>
							数据录入时间
						</th>
						<th>
							修改
						</th>
						<th>
							详细
						</th>
					</tr>
				</thead>
			
										<%-- 				<%if(count%3==0){%>为列表三色循环 --%>
				<tbody>
					<c:forEach var="rowCount" items="${resultCount.rows}">
					<%countAll=countAll+1;%>
					</c:forEach>
					<c:forEach var="row" items="${result.rows}">
						<%count=count+1;%>
						<%if(count%3==0){%>
						<tr class="info">
							<td>
								<%=count+(pageNum-1)*OnePageNum%>
							</td>
							<td>							
								<c:out value="${row.School_name}"/>						
							</td>
							<td>
								<c:out value="${row.School_properties}"/>
							</td>
							<td>
								<c:out value="${row.Areas}"/>
							</td>
							<td>
								<c:out value="${row.Founded_time}"/>
							</td>
							<td>
								<c:out value="${row.School_system}"/>
							</td>
							<td>
								<c:out value="${row.Course}"/>
							</td>
							<td>
								<c:out value="${row.President}"/>
							</td>
							<td>
								<c:out value="${row.President_country}"/>
							</td>								
							<td>
								<c:out value="${row.Teacher_number}"/>
							</td>
							<td>
								<c:out value="${row.Foreign_teacher_num}"/>
							</td>
							<td>
								<c:out value="${row.Teacher_salary}"/>
							</td>
							<td>
								<c:out value="${row.Num_students}"/>
							</td>
							<td>
								<c:out value="${row.Graduating_stu_num}"/>
							</td>
							<td>
								<c:out value="${row.Extra_curricular_edu}"/>
							</td>
							<td>
								<c:out value="${row.Covered_area}"/>
							</td>
							<td>
								<c:out value="${row.Built_area}"/>
							</td>
							<td>
								<c:out value="${row.Tuition}"/>
							</td>
							<td>
								<c:out value="${row.load_people}"/>
							</td>
							<td>
								<c:out value="${row.load_time}"/>
							</td>
							<td>
								<form role="form" action="alter.jsp" method="post">									
									<input name="SearchKey" type="hidden" value="${row.School_name}"/>
									<button type="submit" class="btn btn-default">修改</button>											
								</form>		
							</td>
							<td>
								<form id="submit_from" role="form" action="detail.jsp" method="post">									
									<input name="SearchKey" type="hidden" value="${row.School_name}"/>
									<button type="submit" class="btn btn-default">详细</button>									
								</form>	
							</td>				
						</tr>
						<%}else if(count%3==1){%>
						<tr class="success">
							<td>
								<%=count+(pageNum-1)*OnePageNum%>
							</td>
							<td>						
								<c:out value="${row.School_name}"/>				
							</td>
							<td>
								<c:out value="${row.School_properties}"/>
							</td>
							<td>
								<c:out value="${row.Areas}"/>
							</td>
							<td>
								<c:out value="${row.Founded_time}"/>
							</td>
							<td>
								<c:out value="${row.School_system}"/>
							</td>
							<td>
								<c:out value="${row.Course}"/>
							</td>
							<td>
								<c:out value="${row.President}"/>
							</td>
							<td>
								<c:out value="${row.President_country}"/>
							</td>			
							<td>
								<c:out value="${row.Teacher_number}"/>
							</td>
							<td>
								<c:out value="${row.Foreign_teacher_num}"/>
							</td>
							<td>
								<c:out value="${row.Teacher_salary}"/>
							</td>
							<td>
								<c:out value="${row.Num_students}"/>
							</td>
							<td>
								<c:out value="${row.Graduating_stu_num}"/>
							</td>
							<td>
								<c:out value="${row.Extra_curricular_edu}"/>
							</td>
							<td>
								<c:out value="${row.Covered_area}"/>
							</td>
							<td>
								<c:out value="${row.Built_area}"/>
							</td>
							<td>
								<c:out value="${row.Tuition}"/>
							</td>
							<td>
								<c:out value="${row.load_people}"/>
							</td>
							<td>
								<c:out value="${row.load_time}"/>
							</td>
							<td>
								<form role="form" action="alter.jsp" method="post">															
									<input name="SearchKey" type="hidden" value="${row.School_name}"/>
									<button type="submit" class="btn btn-default">修改</button>											
								</form>	
							</td>	
							<td>
								<form id="submit_from" role="form" action="detail.jsp" method="post">									
									<input name="SearchKey" type="hidden" value="${row.School_name}"/>
									<button type="submit" class="btn btn-default">详细</button>									
								</form>	
							</td>				
						</tr>
						<%}else if(count%3==2){%>
						<tr class="warning">
							<td>
								<%=count+(pageNum-1)*OnePageNum%>
							</td>
							<td>
								<c:out value="${row.School_name}"/>		
							</td>
							<td>
								<c:out value="${row.School_properties}"/>
							</td>
							<td>
								<c:out value="${row.Areas}"/>
							</td>
							<td>
								<c:out value="${row.Founded_time}"/>
							</td>
							<td>
								<c:out value="${row.School_system}"/>
							</td>
							<td>
								<c:out value="${row.Course}"/>
							</td>
							<td>
								<c:out value="${row.President}"/>
							</td>
							<td>
								<c:out value="${row.President_country}"/>
							</td>				
							<td>
								<c:out value="${row.Teacher_number}"/>
							</td>
							<td>
								<c:out value="${row.Foreign_teacher_num}"/>
							</td>
							<td>
								<c:out value="${row.Teacher_salary}"/>
							</td>
							<td>
								<c:out value="${row.Num_students}"/>
							</td>
							<td>
								<c:out value="${row.Graduating_stu_num}"/>
							</td>
							<td>
								<c:out value="${row.Extra_curricular_edu}"/>
							</td>
							<td>
								<c:out value="${row.Covered_area}"/>
							</td>
							<td>
								<c:out value="${row.Built_area}"/>
							</td>
							<td>
								<c:out value="${row.Tuition}"/>
							</td>
							<td>
								<c:out value="${row.load_people}"/>
							</td>
							<td>
								<c:out value="${row.load_time}"/>
							</td>
							<td>
								<form role="form" action="alter.jsp" method="post">									
									<input name="SearchKey" type="hidden" value="${row.School_name}"/>
									<button type="submit" class="btn btn-default">修改</button>											
								</form>	
							</td>	
							<td>
								<form id="submit_from" role="form" action="detail.jsp" method="post">									
									<input name="SearchKey" type="hidden" value="${row.School_name}"/>
									<button type="submit" class="btn btn-default">详细</button>									
								</form>	
							</td>				
						</tr>
						<%}%>
					</c:forEach>
				</tbody>
			</table>


		</div>
	</div>
</div>
  	 
		<!--      	 搜索结果为空时，显示的内容 -->
     	 <div id="showTargetID" class="none" style="display:none">
			<br><br>
				<h4>没有搜索到内容，请重新输入关键字</h4>
			<br><br>
		</div>		
     	 <%if(countAll!=0){%>	
			<h5>已搜索到 <%=countAll%> 条结果</h5>
		<%}else{%>
			<script>
				 var target=document.getElementById("tableID");
			     var showTarget=document.getElementById("showTargetID")	           
			          	target.style.display="none";
			        	showTarget.style.display="block";
		            
			</script>
		<%}%>  
		
	    
			
																			<!--        分页 -->
 <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			
			<ul class="pagination">
				<li>
					 <a href="bus.jsp?PassPage=<%=pageNum-1%>">上一页</a>
				</li>
				<li>
					 <a href="bus.jsp?PassPage=1">1</a>
				</li>
				<li>
					 <a href="bus.jsp?PassPage=2">2</a>
				</li>
				<li>
					 <a href="bus.jsp?PassPage=3">3</a>
				</li>
				<li>
					 <a href="bus.jsp?PassPage=4">4</a>
				</li>
				<li>
					 <a href="bus.jsp?PassPage=5">5</a>
				</li>
				<li>
					 <a href="bus.jsp?PassPage=<%=pageNum+1%>">下一页</a>
				</li>
			</ul>
		</div>
	</div>
</div>
    </section>
   
   <!--     导入底栏jsp文件 -->
	<div>
		<jsp:include page="modular/bottomBar.jsp"/>
	</div>
	

</body>
</html>