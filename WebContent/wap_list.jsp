<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date.*" import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	

    
    <title>My JSP 'index.jsp' starting page</title>
  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
<!-- bootstrp --> 
			    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
			    <meta name="description" content="" />
			    <meta name="author" content="" />
			    <!--[if IE]>
			        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
			        <![endif]-->
			    <!-- BOOTSTRAP CORE STYLE CSS -->
			    <link href="assets/css/bootstrap.css" rel="stylesheet" />
			     <!-- FONTAWESOME STYLE CSS -->
			     <link href="assets/css/font-awesome.css" rel="stylesheet" />
			    <!-- CUSTOM STYLE CSS -->
			    <link href="assets/css/style.css" rel="stylesheet" />
    
<!-- bootstrp --> 


<title>数据列表</title>

																											<!--  bootstrap链接库 -->
   <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">    
   <script src="  http://cdn.staticfile.org/bootstrapQ/0.0.1/bootstrapQ.js"></script>
   <script src="http://cdn.staticfile.org/bootstrapQ/0.0.1/bootstrapQ.min.js"></script>
   
   <script type="text/javascript">
      															 //表单提交
   function tijiao()
   {
     var key = document.mfsearch.tsearch.value;
     
     //无字符检查
    	 document.mfsearch.submit(); 
   }
   </script>
  
</head>
																<!-- css -->
	<style>
	
		body{ text-align:center}
		body{background-color:#7bbfea}
															/* th 表头  对齐*/	
		th { text-align:center;	background-color:#7bbfaa					
			}	
		td {height:40px}    /* 	表高度 */
		
	</style>	
	
<body>

							     <!-- 搜索检查js -->
<script language="javascript">
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
//     重定向
//   response.sendRedirect("list.jsp");

  }
</script>
																	<!-- 搜索模块 -->
<!-- <form action="listTest.jsp" name="myform" method="post"> -->

<!-- <div id="search" style="width:500px; margin:100px;"> -->
<!-- 	<form  action="#" name="myform" method="post"> -->
<!--   		<table> -->
<!--   			<tr> -->
<!--   				<td>搜索：</td> -->
<!--   				<td><input type ="text" name="School_name"  /></td> 	 -->
<!--   				<td colspan="2"> -->
<!--   					<input type="submit" name="submit" value="提交" /> -->
<!--   					<input type="reset" name="reset" value="重置" /> -->
<!--   				</td>	 -->
<!--   			</tr>	 -->
  			
<!--   		</table> -->
<!--   	</form> -->
<!--   	<form  action="insert.jsp" name="insertform" method="post"> -->
<!--   		<table> -->
<!--   			<tr> -->
<!--   				<td>新增：</td> -->
<!--   				<td> -->
<!--   					<input type="submit" name="insert" value="新增" />		 -->
<!--   				</td>	 -->
<!--   			</tr>	 -->
  			
<!--   		</table> -->
<!--   	</form> -->
<!-- </div>   -->
	

<!-- 					                                    
	<%
    	request.setCharacterEncoding("UTF-8");   	
    	  											//搜索    String 函数
    	
//     	String School_name=request.getParameter("School_name"); 					//新增数据 String 函数
//     	String School_properties=request.getParameter("School_properties");
//     	String Founded_time=request.getParameter("Founded_time");
//     	String load_time=request.getParameter("load_time");
//     	String other_course=request.getParameter("other_course");
//     	String Num_students=request.getParameter("Num_students");
    	
		String School_name=request.getParameter("School_name");	
		String School_properties=request.getParameter("School_properties");
		String Areas=request.getParameter("Areas");
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
		String Coverer_area=request.getParameter("Coverer_area");
		String Built_area=request.getParameter("Built_area");
		String Tuition=request.getParameter("Tuition");
		String load_people=request.getParameter("load_people");
		String load_time=request.getParameter("load_time");
    	
    	
																					// 获取时间
    	java.util.Date currentTime = new java.util.Date(); 
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	String SubmitDate = formatter.format(currentTime);
																			
    																			//     	获取session用户
    	String username = session.getAttribute("Session_user").toString();
  
    %>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/NSI_DATABASE"
     user="root"  password="123456"/>
         
  
 <h1><%=School_name%>></h1> 
 
<!-- 																						    判断来源 --> 
<!-- 																						    新增数据操作 -->
<!-- 																							查询数据操作 -->
	<%  if(School_properties== null || School_properties.length() <= 0){ %>
			<sql:query dataSource="${snapshot}" var="result">
				 SELECT * from NSI_SCHOOL_data WHERE School_name like'%<%=School_name%>%';	
			</sql:query>
	<% }else{ %> 		
		
<!-- 		School_system -->
		
		
			<sql:update dataSource="${snapshot}" var="result">
				INSERT INTO NSI_SCHOOL_data (School_name,School_properties,Areas,Founded_time,School_system,Course,President,President_country,Teacher_number,Foreign_teacher_num,Teacher_salary,Num_students,Graduating_stu_num,Extra_curricular_edu,Coverer_area,Built_area,Tuition,load_people,load_time) 
				VALUES ('<%=School_name%>','<%=School_properties%>','<%=Areas%>','<%=Founded_time%>','<%=School_system%>','<%=Course%>','<%=President%>','<%=President_country%>','<%=Teacher_number%>','<%=Foreign_teacher_num%>','<%=Teacher_salary%>','<%=Num_students%>','<%=Graduating_stu_num%>','<%=Extra_curricular_edu%>','<%=Coverer_area%>','<%=Built_area%>','<%=Tuition%>','<%=username%>','<%=SubmitDate%>');
			</sql:update>
							
			<sql:query dataSource="${snapshot}" var="result">
				 SELECT * from NSI_SCHOOL_data WHERE School_name like'%<%=School_name%>%';	
			</sql:query>
	<% } %>



<!-- <table  border="0" width="100%"> -->

<!--   <tr height="160"> -->
<!--   	<td width="5" align="center">     </td>  -->

<!--     <td colspan="2"> -->
<!--       <table border="1" width="100%">          -->
<!-- 															 表头	<! -->
<!-- 		<tr> -->
<!--  			  <th>学校名</th> -->
<!-- 			  <th>学校性质</th> -->
<!-- 			  <th>成立时间</th> -->
<!-- 			  <th>录入时间</th> -->
<!-- 			  <th>所学课程</th> -->
<!-- 			  <th>学生数量</th> -->
<!-- 		</tr> -->
<!-- 															01 -->
<%-- 		<c:forEach var="row" items="${result.rows}"> --%>
	
<!-- 		<tr > -->
<%-- 	 		<td><c:out value="${row.School_name}"/></td> --%>
<%--  			<td><c:out value="${row.School_properties}"/></td> --%>
<%--  			<td><c:out value="${row.Founded_time}"/></td> --%>
<%--  			<td><c:out value="${row.load_time}"/></td> --%>
<%--  			<td><c:out value="${row.other_course}"/></td> --%>
<%--  			<td><c:out value="${row.Num_students}"/></td> --%>
 		 
<!-- 		</tr>        -->
<%--            </c:forEach>           --%>
<!--       </table> -->
<!--     </td> -->
<!--   </tr> -->
<!-- </table> -->



<!-- bootstrp --> 


 <div class="navbar navbar-inverse navbar-fixed-top " >
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" ><strong style=""></strong> <i class="fa fa-globe"></i>NSI <small >学校查询系统</small></a>
            </div>
            <div class="navbar-collapse collapse move-me">
                <ul class="nav navbar-nav navbar-right set-links">
                    <li><a href="login.jsp" >主页</a></li>
                     <li><a href="about.html">机构</a></li>
                   <li><a href="pricing.html">行业人物</a></li>
                     <li><a href="#stats-download">会员</a></li>
                    <li><a href="blank.html" class="active-menu-item">BLANK</a></li>
                </ul>
            </div>

        </div>
    </div>
    <!--MENU SECTION END-->
    <section class="headline-sec">
        <div class="overlay ">
            <h3 >新学说 
<!--             <i class="fa fa-angle-double-right "></i> -->
            </h3>

        </div>
    </section>
    <!--HOME SECTION END-->
    <section>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">Brand</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="insert.jsp">新增</a>				 
						</li>
						<li>
							 <a href="#">Link</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">菜单<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">One more separated link</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search" action="wap_list.jsp" name="myform" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="School_name" />
						</div> <button type="submit" name="submit" class="btn btn-default">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">用户：<%=username%></a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				
			</nav>
			<table class="table">
				<thead>
					<tr>
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
<!-- 						<th> -->
<!-- 							教师薪酬 -->
<!-- 						</th> -->
<!-- 						<th> -->
<!-- 							在校生数量 -->
<!-- 						</th> -->
<!-- 						<th> -->
<!-- 							毕业班人数 -->
<!-- 						</th> -->
<!-- 						<th> -->
<!-- 							课外教学比例 -->
<!-- 						</th> -->
<!-- 						<th> -->
<!-- 							占地面积（亩） -->
<!-- 						</th> -->
<!-- 						<th> -->
<!-- 							建筑面积（平方米） -->
<!-- 						</th> -->
<!-- 						<th> -->
<!-- 							学费 -->
<!-- 						</th> -->
<!-- 						<th> -->
<!-- 							数据提交人 -->
<!-- 						</th> -->
<!-- 						<th> -->
<!-- 							数据录入时间 -->
<!-- 						</th> -->
						
					
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${result.rows}">
					
						<tr class="info">
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
						</tr>	
						<tr class="success">	
							<td>
								<c:out value="教师薪酬:${row.Teacher_salary}"/>
							</td>
							<td>
								<c:out value="在校生数量:${row.Num_students}"/>
							</td>
							<td>
								<c:out value="毕业班人数:${row.Graduating_stu_num}"/>
							</td>
							<td>
								<c:out value="课外教学比例:${row.Extra_curricular_edu}"/>
							</td>
							<td>
								<c:out value="占地面积:${row.Coverer_area}（亩）"/>
							</td>
							<td>
								<c:out value="建筑面积:${row.Built_area}（平方米）"/>
							</td>
							<td>
								<c:out value="学费:${row.Tuition}"/>
							</td>
							<td>
								<c:out value="数据提交人:${row.load_people}"/>
							</td>
							<td>
								<c:out value="数据录入时间:${row.load_time}"/>
							</td>	
							<td>
								
							</td>					
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
			<ul class="pagination">
				<li>
					 <a href="#">Prev</a>
				</li>
				<li>
					 <a href="#">1</a>
				</li>
				<li>
					 <a href="#">2</a>
				</li>
				<li>
					 <a href="#">3</a>
				</li>
				<li>
					 <a href="#">4</a>
				</li>
				<li>
					 <a href="#">5</a>
				</li>
				<li>
					 <a href="#">Next</a>
				</li>
			</ul>
		</div>
	</div>
</div>
    </section>
    <section id="footer-sec" >
        <div class="container">
            <div class="row">
<div class="col-md-4">
   <h4>关于新学说</h4>
    <p style="padding-right:50px;">
        新学说是由国际学校资深专家共同打造的国际学校服务平台。
        专注于中国国际教育行业信息挖掘，行业资讯传递，关注中国
        国际教育行业的发展动态。以中立态度，对K12国际教育进行分
        析评说，为从业人员和学校机构提供最新最全最公正的国际教育
        发展动态。 
         <a href="about.html">more..</a>
    </p>
</div>
                <div class="col-md-4">
       <h4>PHYSICAL LOCATION </h4>
                    <h5>345/DC, New York State,</h5>
                     <h5>The Lane Tower Road,</h5>
                    <h5>United States-201-900-590.</h5>
                    <br />
                    <h5><strong>Email:</strong> info@domain.com</h5>
                      <h5><strong>Call:</strong> +1-908-78-55-5555</h5>
                   
</div>
                <div class="col-md-4">
      <h4>SOCIAL LINKS</h4>
                    <div class="social-links">

                    
                    <a href="#" > <i class="fa fa-facebook fa-2x" ></i></a>
                         <a href="#" > <i class="fa fa-twitter fa-2x" ></i></a>
                         <a href="#" > <i class="fa fa-linkedin fa-2x" ></i></a>
                         <a href="#" > <i class="fa fa-google-plus fa-2x" ></i></a>
                         <a href="#" > <i class="fa fa-github fa-2x" ></i></a>
                         <a href="#" > <i class="fa fa-digg fa-2x" ></i></a>
                         <a href="#" > <i class="fa fa-dropbox fa-2x" ></i></a>
                   </div>

</div>
               
            </div>
               
        </div>
    </section>
     <!--FOOTER SECTION END-->
    <div class="copy-txt">
         <div class="container">
        <div class="row">
<div class="col-md-12 set-foot" >
    &copy 2014 your domain | All rights reserved |  More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> 
</div>
            </div>
                   </div>
    </div>
     <!-- COPY TEXT SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
    

<!-- bootstrp --> 
<!-- 状态标记 -->

<h2><%=username%></h2>


</body>
</html>