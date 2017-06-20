<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE>
<html>
<head>
	<link href="../assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="../assets/css/style.css" rel="stylesheet" />
	<!--     	自定义css -->
    <link href="../assets/css/MyCss.css" rel="stylesheet" />
 
	<script src="../assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="../assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="../assets/js/custom.js"></script>
    
	<title>新学说后台管理</title>
	<meta charset="UTF-8">
	<!-- 	自适应标签 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
</head>

<body>
	<script type="text/javascript">		
// 			jq Ajax
 			var pass= function(aa){			    	
			        $.ajax({
			            url: '/nsi-0.8/Verify',
			            type: 'post',
			            dataType:'json',
			            data: {verify:aa},
			            success: function(msg) {
			            }
			        });				        
			      alert('ajax is ok!'+aa)		    	
			    };
	</script>


<!-- 	顶栏 -->
<div class="container">
	<div class="row ">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">新学说后台</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="#">概览</a>				 
						</li>
						<li>
							 <a href="#">用户审核</a>				 
						</li>
						<li>
							 <a href="#">信息审核</a>				 
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">菜单<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">功能01</a>
								</li>
								<li class="divider">
								</li>
								<li>
									<a href="#">功能02</a>
								</li>
								<li>
									<a href="#">功能03</a>
								</li>						
								<li>
									<a href="#">功能04</a>
								</li>							
								<li>
									<a href="#">功能05</a>
								</li>
							</ul>
						</li>
					</ul>			
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">用户：</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">菜单<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">action</a>
								</li>
								<li>
									 <a href="#">Something</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">link</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	
</div>
	
	
	<%  
	//注册数据库驱动  
	Class.forName("com.mysql.jdbc.Driver");  
	//获取数据库连接  
	Connection conn = DriverManager.getConnection(  
	    "jdbc:mysql://localhost:3306/NSI_DATABASE","root","123456");  
	//创建Statement  
	Statement stmt = conn.createStatement();  
	//执行查询  
	ResultSet rs = stmt.executeQuery("select * from nsi_user limit 0,10");  
	%>  
	
	<table class="table">
	<caption><h3>注册用户</h3></caption>
	<thead>
		<tr>
			<th>用户名（邮箱）</th>
			<th>用户等级</th>
			<th>真实姓名</th>
			<th>机构</th>
			<th>职位</th>
			<th>手机号码</th>
			<th>积分</th>
			
			<th>操作</th>
		
		</tr>
	</thead>
	<tbody>
	<%  	//遍历结果集  
		while(rs.next())  
	{%>  
	
		<tr class="active">
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(9)%></td>
			
			<td><button onclick="pass('<%=rs.getString(1)%>')">通过</button></td>
		</tr>		
	<%}%>  
	</tbody>
</table>
<% 
	rs.close();	
	stmt.close();	
	conn.close();	
%>	



	<h3>school</h3>
	<%  
	//注册数据库驱动  
	Class.forName("com.mysql.jdbc.Driver");  
	//获取数据库连接  
	Connection conn02 = DriverManager.getConnection(  
	    "jdbc:mysql://localhost:3306/NSI_DATABASE","root","123456");  
	//创建Statement  
	Statement stmt02 = conn02.createStatement();  
	//执行查询  
	ResultSet rs02 = stmt02.executeQuery("select * from nsi_school_data order by load_time DESC limit 0,10 ");  
	%>  
	<table bgcolor="#eee" border="1" width="300">  
		<%  
		//遍历结果集  
		while(rs02.next())  
		{%>  
		    <tr>  
		        <!-- 输出结果集 -->  
		        <td><%=rs02.getString(1)%></td>  
		    </tr>  
		<%}%>  
	</table>  

	<% 
		rs02.close();	
		stmt02.close();	
		conn02.close();	
	%>
</body>
</html>