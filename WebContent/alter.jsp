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
 	
   <title>修改数据</title>
  
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
  
			 <% String key_School_name = request.getParameter("SearchKey"); %> 
				
  		<sql:query dataSource="${snapshot}" var="result">
				 SELECT * from NSI_SCHOOL_data WHERE School_name ='<%=key_School_name%>';	
		</sql:query>		
<!-- 																									  	bootstrap form表单提交给自己	 -->
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
// 	删除确认
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
//	 	亩米转换
		function Mu2Meter(){  
		    var Mu=document.getElementById("Mu2MeterID");  
		    var Mu=Mu.value;  
		    var Meter=Mu*666;
		    var MeterInner = document.getElementById("Meter2MuID");  
		    MeterInner.value = Meter;  
		    }  
		function Meter2Mu(){  
		    var Meter=document.getElementById("Meter2MuID");  
		    var Meter=Meter.value;  
		    var Mu=parseInt(Meter/666);
		    var MuInner = document.getElementById("Mu2MeterID");  
		    MuInner.value = Mu;  
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
	                <a class="navbar-brand l-f24" href="#"><strong>新学说</strong></a>  
	            </div>  
	            <div class="collapse navbar-collapse l-f20" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right l-h-002">  
		                <li><a href="/nsi-0.8/list.jsp"><b>学校</b></a></li>
	                    <li><a href="/nsi-0.8/institution/Institution_list.jsp"><b>机构</b></a></li>
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
// 			int Founded_time= Integer.parseInt(request.getAttribute("Founded_time"));
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

				String Tuition= (String)request.getAttribute("Tuition");
				String website= (String)request.getAttribute("website");
				
				String load_people= (String)request.getAttribute("load_people");
				String load_time= (String)request.getAttribute("load_time");
				String Investment= (String)request.getAttribute("Investment");
				String remark= (String)request.getAttribute("remark");
			%>
	
			<form class="form-horizontal" role="form" action="list.jsp" name="myform" method="post">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">学校名</label>
					<div class="col-sm-5">
						<input type="text"  value='<%=School_name%>' class="form-control" id="inputEmail3" name="School_name" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">学校性质</label>
					<div class="col-sm-5">		
						<input type="text" value='<%=School_properties%>' class="form-control" id="inputEmail3" name="School_properties"/>						
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">成立时间</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Founded_time%>' class="form-control" id="id_Founded_time" name="Founded_time"/>
					</div>
				</div>
                	 <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">所在地区</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Areas%>' class="form-control" id="inputEmail3" name="Areas"/>
					</div>
				</div>	
                <div>
	                <div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">学制</label>
						<div class="col-sm-5">
							<input type="text" value='<%=School_system%>' class="form-control" id="id_School_system" name="School_system"/>		
						</div>
						<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>注意：以分号结尾</h5></span>  </div>
					</div>	
					<div>    
			             <div class="form-group">
			            	 <label for="inputEmail3" class="col-sm-2 control-label"></label>
								<div class="col-sm-5">
			                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert02('高中;')" value="高中" />
			                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert02('初中;')" value="初中" />
			                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert02('小学;')" value="小学" />
			                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert02('幼儿园;')" value="幼儿园" />
								</div>
			               </div>
					</div>	
				</div>
				<div>
	                <div class="form-group">
						 <label for="inputEmail3" class="col-sm-2 control-label">课程</label>
						<div class="col-sm-5">
							<input type="text" value='<%=Course%>' class="form-control" id="id_Course" name="Course"/>
						</div>
						<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>注意：以分号结尾</h5></span>  </div>
					</div>	
	               	<div class="form-group">
	               		<label for="inputEmail3" class="col-sm-2 control-label"></label>
							<div class="col-sm-5">
								 <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IPC;')" value="IPC" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IMYC;')" value="IMYC" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('AP;')" value="AP" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IB;')" value="IB" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IBPYP;')" value="IBPYP" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IBMYP;')" value="IBMYP" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IBDP;')" value="IBDP" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('A-LEVEL;')" value="A-LEVEL" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('IGCSE;')" value="IGCSE" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('蒙特梭利;')" value="蒙特梭利" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('美国课程;')" value="美国课程" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('加拿大课程;')" value="加拿大课程" />
	                             <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert('澳洲课程;')" value="澳洲课程" /> 
							</div>
					</div>				
               	</div>      	
                    <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">校长</label>
					<div class="col-sm-5">
						<input type="text" value='<%=President%>' class="form-control" id="id_President" name="President"/>
					</div>
				</div>	
                   <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">校长国籍</label>
					<div class="col-sm-5">
						<input type="text" value='<%=President_country%>' class="form-control" id="id_President_country" name="President_country"/>
					</div>
				</div>	
                    <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">教师数量</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Teacher_number%>' class="form-control" id="id_Teacher_number" name="Teacher_number"/>
					</div>
				</div>		
                 <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">外籍教师数量</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Foreign_teacher_num%>' class="form-control" id="id_Foreign_teacher_num" name="Foreign_teacher_num"/>
					</div>
				</div>	
                    <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">教师薪酬</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Teacher_salary%>' class="form-control" id="id_Teacher_salary" name="Teacher_salary"/>
					</div>
					<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>例如：20000-30000 或 30000</h5></span>  </div>
				</div>		
                <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">在校生数量</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Num_students%>' class="form-control" id="id_Num_students" name="Num_students"/>
					</div>
				</div>		
                	<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">毕业班人数</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Graduating_stu_num%>' class="form-control" id="id_Graduating_stu_num" name="Graduating_stu_num"/>
					</div>
				</div>		
<!-- 				课外教学比例 -->
	             <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">俱乐部数量</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Extra_curricular_edu%>' class="form-control" id="id_Extra_curricular_edu" name="Extra_curricular_edu"/>
					</div>
				</div>		
                   <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">占地面积（亩）</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Covered_area%>' class="form-control" id="id_Covered_area" name="Covered_area"/>
					</div>
					
					<div class="col-sm-5" style="border:1px solid #888;padding:0;">
						<span id="useridSpan"  class="col-sm-3" style="color:#777"><h5>亩/米计算器</h5></span>		
						 <input type="text" style="border-radius: 4px;" class="col-sm-3" id="Mu2MeterID" onblur="Mu2Meter()"placeholder="亩"/> 	
						 <span id="useridSpan"  class="col-sm-1" style="color:#888"><h5>亩</h5></span>			
						 <input type="text" style="border-radius: 4px;" class="col-sm-3" id="Meter2MuID" onblur="Meter2Mu()"placeholder="平方米"/>
						 <span id="useridSpan"  class="col-sm-2" style="color:#888"><h5>平方米</h5></span>
					</div>
				</div>	
                <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">建筑面积（平方米）</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Built_area%>' class="form-control" id="id_Built_area" name="Built_area"/>
					</div>
				</div>		
                 <div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">学费</label>
					<div class="col-sm-5">
						<input type="text" value='<%=Tuition%>' class="form-control" id="id_Tuition" name="Tuition"/>
					</div>
					<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>例如：80000-120000 或 90000</h5></span>  </div>
				</div>
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">网站</label>
					<div class="col-sm-5">
						<input type="text" value='<%=website%>' class="form-control" id="id_website" name="website"/>
					</div>
					<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>例如：www.baidu.com</h5></span>  </div>
				</div>
					
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">投资信息</label>
					<div class="col-sm-5">
<!-- 						<input type="text" class="form-control" id="id_Investment" name="Investment"/> -->
						<textarea class="form-control" id="id_Investment" name="Investment" rows="3"><%=Investment%></textarea>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-5">
<!-- 						<input type="text" class="form-control" id="id_remark" name="remark"/> -->
						<textarea class="form-control" id="id_remark" name="remark" rows="3"><%=remark%></textarea>
					</div>
				</div>
                					
                	<div class="form-group">
						<div class="col-sm-offset-6 col-sm-10">
																			<!-- 						隐式表单标记位 -->
							<input type="hidden" name="whereFrom" value="alter">
							<input type="hidden" name="alter_old_Schoolname" value='<%=key_School_name%>'>
							
							 <button onclick="NulltoZero()" type="submit" class="btn btn-primary">提交</button>
						</div>
																												
					</div>
			</form>
			<br>
																					<!-- 						删除按钮 -->
				<form class="form-horizontal" role="form" action="list.jsp" id="deleteForm" name="myform02" method="post">
						<div class="form-group">
							<div class="col-sm-offset-6 col-sm-10 ">	
																<!-- 						隐式表单标记位 -->
								<input type="hidden" name="whereFrom" value="delete">
																<!-- 							性质假数据 跳过list中的“搜索if” -->
								<input type="hidden" name="School_properties" value="From_alter_School_properties">
								<input type="hidden" name="alter_old_Schoolname" value='<%=key_School_name%>'>	
								<input type="button" class="btn btn-danger" onclick="ConfirmDelete()" value="删除本条记录" />		

							</div>
						</div>
				</form>
			
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
																										

	
